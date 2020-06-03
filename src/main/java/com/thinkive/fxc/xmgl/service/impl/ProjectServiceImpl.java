package com.thinkive.fxc.xmgl.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.thinkive.base.jdbc.DBPage;
import com.thinkive.base.jdbc.DataRow;
import com.thinkive.base.jdbc.session.Session;
import com.thinkive.base.util.StringHelper;
import com.thinkive.base.util.StringUtil;
import com.thinkive.fxc.xmgl.service.ProjectService;
import com.thinkive.workplat.service.PlatBaseService;

/**
 * 
 * @描述: 
 * @版权: Copyright (c) 2016 
 * @公司: Thinkive 
 * @创建日期: 2016年10月7日 下午3:52:26
 */
public class ProjectServiceImpl extends PlatBaseService implements ProjectService
{
	
	private static Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);


	@Override
	public DBPage queryProjectManageList(DataRow params, int pageIndex,
			int pageSize) {
		List<String> condictionList = new ArrayList<String>();
//		StringBuffer sqlBuffer = new StringBuffer("select t.id,t.project_name,t.project_code,t.project_describe,t.predict_money,t.reality_money,t.department,t.manager,t.commerce,t.client_name,t.contract,t.project_progress,t.online_date,t.acceptance_date,t.plan_online_date,t.plan_report_date,t.plan_acceptance_date,t.plan_acceptance_report_date,t.project_state,t.product_project_progress,t.commerce_project_progress,t.risk_label,t.product_affiliation_id,t.reference_data,t.project_start_date,t.contract_sign_date,t.payment_way,t.gathering_money_ok,t.gathering_money_not,t.top_thread_report_date,t.acceptance_report_date,t.schedule_principal,t.is_follow,t.risk_project,t.project_implement_day,t.project_progress_update,t.product_progress_update,t.commerce_progress_update,t.create_date,t.update_date, ")
//		.append(" t1.fxc_dept,t1.kh_dept,t1.jy_dept,t1.lc_dept,t1.dzjf_dept,t1.cf_dept,t1.other_dept ")
//		.append(" from t_xmglxt_project_management t  ")
//		.append(" LEFT JOIN t_xmglxt_product_affiliation t1 ON t.product_affiliation_id = t1.id   ");
		StringBuffer sqlBuffer = new StringBuffer("SELECT IFNULL(DATEDIFF(CURDATE(),t.project_start_date),0) as project_day, case  ")
		.append(" when IFNULL(t.predict_money,0) > 0 and IFNULL(t.predict_money,0) <=100000 and IFNULL(DATEDIFF(CURDATE(),t.project_start_date),0) >= 60 then '风险' ")
		.append(" when IFNULL(t.predict_money,0) > 100000 and IFNULL(t.predict_money,0) <=300000 and IFNULL(DATEDIFF(CURDATE(),t.project_start_date),0) >= 90  then '风险' ")
		.append(" when IFNULL(t.predict_money,0) > 300000 and IFNULL(t.predict_money,0) <=500000 and IFNULL(DATEDIFF(CURDATE(),t.project_start_date),0) >= 120 then '风险' ")
		.append(" when IFNULL(t.predict_money,0) > 500000 and IFNULL(t.predict_money,0) <=1000000 and IFNULL(DATEDIFF(CURDATE(),t.project_start_date),0) >= 210 then '风险' ")
		.append(" else '无' end as project_rike_label,t.* ")
		.append(" FROM t_xmglxt_project_management t ");
		
		String  project_rike_label = params.getString("project_rike_label");
		if(StringHelper.isNotBlank(project_rike_label)){
			 sqlBuffer.append(" LEFT JOIN  (select t1.id, case ");
			 sqlBuffer.append(" when IFNULL(t1.predict_money,0) > 0 and IFNULL(t1.predict_money,0) <=100000 and IFNULL(DATEDIFF(CURDATE(),t1.project_start_date),0) >= 60 then '风险' ");
			 sqlBuffer.append(" when IFNULL(t1.predict_money,0) > 100000 and IFNULL(t1.predict_money,0) <=300000 and IFNULL(DATEDIFF(CURDATE(),t1.project_start_date),0) >= 90  then '风险' ");
			 sqlBuffer.append(" when IFNULL(t1.predict_money,0) > 300000 and IFNULL(t1.predict_money,0) <=500000 and IFNULL(DATEDIFF(CURDATE(),t1.project_start_date),0) >= 120 then '风险' ");
			 sqlBuffer.append(" when IFNULL(t1.predict_money,0) > 500000 and IFNULL(t1.predict_money,0) <=1000000 and IFNULL(DATEDIFF(CURDATE(),t1.project_start_date),0) >= 210 then '风险' ");
			 sqlBuffer.append(" else '无'  end as project_rike_label FROM t_xmglxt_project_management t1 ) t2  on t.id=t2.id ");
			 sqlBuffer.append(" where t2.project_rike_label LIKE ? ");
	         condictionList.add("%"+project_rike_label+"%");
		}else{
			 sqlBuffer.append(" where 1=1 ");
		}
		
		//权限查询--当前登录用户拥有查看数据权限
		String  dept_auto = params.getString("dept_auto");
		if(StringHelper.isNotBlank(dept_auto)){
			//部门权限
			if(dept_auto.equals("2")){
				List<DataRow> dept_nos = this.getDeptNosByUserId(params.getString("user_id"));
				if(dept_nos != null && dept_nos.size() > 0){
					sqlBuffer.append(" and (t.department in (");
					for (int i = 0; i < dept_nos.size(); i++) {
						if(i == dept_nos.size()-1){
							sqlBuffer.append("'"+dept_nos.get(i).getString("dept_id")+"'");
						}else{
							sqlBuffer.append("'"+dept_nos.get(i).getString("dept_id")+"',");
						}
					}
					sqlBuffer.append(") OR (");
					for (int i = 0; i < dept_nos.size(); i++) {
						if(i == dept_nos.size()-1){
							sqlBuffer.append(" t.product_affiliation_id like '%"+dept_nos.get(i).getString("dept_id")+"%'");
						}else{
							sqlBuffer.append(" t.product_affiliation_id like '%"+dept_nos.get(i).getString("dept_id")+"%' OR ");
						}
					}
					sqlBuffer.append("))");
					
				}
				
			}else if(dept_auto.equals("3")){
				//具体字段项目权限
				String login_name = params.getString("login_name");
				String personage_jurisdiction = params.getString("personage_jurisdiction");
				sqlBuffer.append(" and t."+personage_jurisdiction+"= ? ");
	            condictionList.add(login_name);
			}
		}	
		
		String  project_name = params.getString("project_name");
        if (StringHelper.isNotBlank(project_name) )
        {
            sqlBuffer.append(" and t.project_name LIKE ? ");
            condictionList.add("%"+project_name+"%");
        }
        String  project_code = params.getString("project_code");
        if (StringHelper.isNotBlank(project_code) )
        {
        	sqlBuffer.append(" and t.project_code LIKE ? ");
        	condictionList.add("%"+project_code+"%");
        }
        String  department = params.getString("department");
        if (StringHelper.isNotBlank(department) )
        {
        	sqlBuffer.append("   AND  t.department = ? ");
        	condictionList.add(department);
        }
        String  manager = params.getString("manager");
        if (StringHelper.isNotBlank(manager) )
        {
        	sqlBuffer.append(" and t.manager LIKE ? ");
        	condictionList.add("%"+manager+"%");
        }
        String  commerce = params.getString("commerce");
        if (StringHelper.isNotBlank(commerce) )
        {
        	sqlBuffer.append(" and t.commerce LIKE ? ");
        	condictionList.add("%"+commerce+"%");
        }
        String  client_name = params.getString("client_name");
        if (StringHelper.isNotBlank(client_name) )
        {
        	sqlBuffer.append(" and t.client_name LIKE  ?  ");
        	condictionList.add("%"+client_name+"%");
        }
        String  schedule_person = params.getString("schedule_person");
        if (StringHelper.isNotBlank(schedule_person) )
        {
        	sqlBuffer.append(" and t.schedule_person LIKE  ?  ");
        	condictionList.add("%"+schedule_person+"%");
        }
        String  is_follow = params.getString("is_follow");
        if (StringHelper.isNotBlank(is_follow) )
        {
        	sqlBuffer.append("   AND  t.is_follow = ? ");
        	condictionList.add(is_follow);
        }
        String  product_affiliation_name = params.getString("product_affiliation_name");
        if (StringHelper.isNotBlank(product_affiliation_name) )
        {
        	sqlBuffer.append("   AND  t.product_affiliation_id like ? ");
        	condictionList.add("%"+product_affiliation_name+"%");
        }
       
        String sort = params.getString("sortField");
        if ( StringHelper.isNotBlank(sort) )
        {
            sqlBuffer.append(" order by " + sort);
            String order = params.getString("sortOrder");
            sqlBuffer.append(" " + order);
        }else{
        	 sqlBuffer.append(" order by t.update_date DESC");
        }
		logger.info("查询项目管理列表拼接SQL: "+sqlBuffer.toString() +" 对应的SQL参数 : "+condictionList.toString());
		return this.getJdbcTemplate().queryPage(sqlBuffer.toString(), condictionList.toArray(), pageIndex, pageSize);
		
	}

	@Override
	public int addProject(DataRow dataRow,DataRow productType) throws Exception {
		Session session = null;
		int result = 0;
		try {
			session = this.getSession();
			session.beginTrans();
			//项目表信息
			result=session.insert("t_xmglxt_project_management", dataRow);
			//产品归属表信息
//			int number = session.insert("t_xmglxt_product_affiliation", productType);
//			result=number;
			session.commitTrans();
		} catch (Exception e) {
			result = -1;
			session.rollbackTrans();
			throw e;
		} finally {
			if (session != null) {
				session.close();
				session = null;
			}
		}
		return result;
		
		
	}

	@Override
	public DataRow getProject(String id, String project_code) {
		String sql = "SELECT ID, project_name,project_code,client_name FROM t_xmglxt_project_management T WHERE 1=1";
		List<String> params = new ArrayList<String>();
		if(StringUtil.isNotEmpty(id)){
			sql+=" AND T.id = ?  ";
			params.add(id);
		}
		if(StringUtil.isNotEmpty(project_code)){
			sql+=" AND T.project_code= ? ";
			params.add(project_code);
		}
		return getJdbcTemplate().queryMap(sql,params.toArray());
	}

	@Override
	public int editProduct(DataRow dataRow) {
		String id = dataRow.getString("id");
		return getJdbcTemplate().update("t_xmglxt_project_management", dataRow,"id",id);
	}


	@Override
	public int deleteProject(String[] product_id) throws Exception {
		Session session = null;
		int result = 0;
		try {
			session = this.getSession();
			session.beginTrans();
			for (int i = 0; i < product_id.length; i++) {
				session.delete("t_xmglxt_project_management", "id", product_id[i]);
				result++;
			}
			session.commitTrans();
		} catch (Exception e) {
			result = -1;
			session.rollbackTrans();
			throw new Exception(e);
		} finally {
			if (session != null) {
				session.close();
				session = null;
			}
		}
		return result;
	}
	
	 @Override
    public List<DataRow> getRoleNosByUserId(String user_id)
    {
        // TODO Auto-generated method stub
        StringBuffer sqlBuf = new StringBuffer("SELECT  T2.*    FROM   T_BASE_ROLE_USER T1    LEFT  JOIN    T_BASE_ROLE  T2  ON   T1.ROLE_ID =T2.ROLE_ID WHERE   1=1   ");
        sqlBuf.append(" and  t1.user_id =? ");
        return getJdbcTemplate().query(sqlBuf.toString(), new Object[] {user_id}) ;
    }
	 @Override
	 public List<DataRow> getDeptNosByUserId(String user_id)
	 {
		 // TODO Auto-generated method stub
		 StringBuffer sqlBuf = new StringBuffer("SELECT * FROM t_base_dept_post_user T1 LEFT JOIN  t_base_dept T2 ON T1.dept_id =T2.dept_id WHERE 1=1 ");
		 sqlBuf.append(" and  t1.user_id =? ");
		 return getJdbcTemplate().query(sqlBuf.toString(), new Object[] {user_id}) ;
	 }

	@Override 
	public List<DataRow> queryProductAffiliation(DataRow params) {
		 // TODO Auto-generated method stub
		List<DataRow> resultList=new ArrayList<DataRow>();
		String product_affiliation_id = params.getString("product_affiliation_id");
		String[] split = product_affiliation_id.split(",");
		StringBuffer sqlBuf = new StringBuffer("SELECT * FROM  t_base_dept T2 where T2.PARENT_ID != '0'");
		List<DataRow> query = getJdbcTemplate().query(sqlBuf.toString());
		for (int i = 0; i < query.size(); i++) {
			DataRow dataRow = new DataRow();
			dataRow.set("name", query.get(i).getString("name"));
			if(split != null && split.length >0 ){
				for (int j = 0; j < split.length; j++) {
					if(query.get(i).getString("dept_id").equals(split[j])){
						dataRow.set("name_value", "有");
						break;
					}else{
						dataRow.set("name_value", "无");
					}
				}
			}else{
				dataRow.set("name_value", "无");
			}
			resultList.add(dataRow);
		}
		return resultList;
	}
	
	 @Override
	 public List<DataRow> queryDeptList(DataRow project)
	 {
		 // TODO Auto-generated method stub
		 StringBuffer sqlBuf = new StringBuffer("select t.name,t.dept_id from t_base_dept t where t.PARENT_ID != '0' ");
		 return getJdbcTemplate().query(sqlBuf.toString()) ;
	 }

	@Override
	public DataRow getProjectManage(DataRow params) {
		StringBuffer sqlBuffer = new StringBuffer("select * from t_xmglxt_project_management where id = ?");
		logger.info("查询单个项目管理拼接SQL: "+sqlBuffer.toString() +" 对应的SQL参数 ID : "+params.getString("id"));
		return getJdbcTemplate().queryMap(sqlBuffer.toString(),new Object[]{params.getString("id")}) ;
	}
	@Override
	public List<DataRow> queryEnumNo(String enum_no) {
		StringBuffer sqlBuffer = new StringBuffer("select * from t_base_enum_type t left join t_base_enum_value t1 on t.ENUM_ID=t1.ENUM_ID  WHERE t.ENUM_NO = ? ");
		return getJdbcTemplate().query(sqlBuffer.toString(),new Object[]{enum_no}) ;
	}
	
	 @Override
	 public DataRow getDeptByName(String product_affiliation_id)
	 {
		DataRow dataRow =new DataRow();
		String name="";
		String[] split = product_affiliation_id.split(",");
		StringBuffer sqlBuf = new StringBuffer("SELECT * FROM  t_base_dept T2 where T2.PARENT_ID != '0'");
		List<DataRow> query = getJdbcTemplate().query(sqlBuf.toString());
		for (int i = 0; i < query.size(); i++) {
			if(split != null && split.length >0 ){
				for (int j = 0; j < split.length; j++) {
					if(query.get(i).getString("dept_id").equals(split[j])){
						name=name +query.get(i).getString("name")+",";
					}
				}
			}
		}
		if(StringUtils.isNotBlank(name)){
			name = name.substring(0, name.lastIndexOf(","));
		}
		dataRow.set("name", name);
		return dataRow;
	 }
}
