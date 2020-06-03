package com.thinkive.fxc.xmgl.event.action.impl.project;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.thinkive.base.config.Configuration;
import com.thinkive.base.exception.CommonException;
import com.thinkive.base.jdbc.DataRow;
import com.thinkive.base.jdbc.DBPage;
import com.thinkive.fxc.xmgl.constants.Constants;
import com.thinkive.fxc.xmgl.constants.EnumConstants;
import com.thinkive.fxc.xmgl.service.ProjectService;
import com.thinkive.fxc.xmgl.service.impl.ProjectServiceImpl;
import com.thinkive.gateway.v2.result.Result;
import com.thinkive.workplat.event.action.EventBaseAction;
import com.thinkive.workplat.system.SysLibrary;
/**
 * 
 * @描述: 项目管理列表查询
 * @公司: 思迪科技
 * @作者: yanghl
 * @创建日期: 2019年11月5日
 * @创建时间: 下午5:17:34
 */
public class QueryProjectAction extends EventBaseAction {
	
	private static Logger logger = Logger.getLogger(QueryProjectAction.class);

	@Override
	public Result execute() {
		Result resultVo = new Result();
		
        String project_name=this.getStrParameter("project_name");  //项目名称
        String project_code=this.getStrParameter("project_code");  //项目名称
        String department=this.getStrParameter("department");  //管理归属产品部
        String manager=this.getStrParameter("manager");  //项目经理
        String commerce=this.getStrParameter("commerce"); //商务
        String client_name=this.getStrParameter("client_name");  //客户
        String schedule_person=this.getStrParameter("schedule_person");  //进度负责人
        String is_follow=this.getStrParameter("is_follow");  //是否跟进
        String project_rike_label=this.getStrParameter("project_rike_label");  //风险项目
        String product_affiliation_name=this.getStrParameter("product_affiliation_name");  //产品归属
        
        String user_id = SysLibrary.getUserId();// 操作员ID(user_id:number(10))
        String login_id = SysLibrary.getLoginId();// 操作员工号UID(login_id:varchar2(50))
        String login_name = SysLibrary.getLoginName();// 管理员姓名

		int pageIndex = this.getIntParameter("pageIndex");
	    int pageSize = this.getIntParameter("pageSize");
	    String sortField = this.getStrParameter("sortField");
	    String sortOrder = this.getStrParameter("sortOrder");
	    pageIndex = (pageIndex == 0) ? 1 : pageIndex;
        pageSize = (pageSize == 0) ? 10 : pageSize;
        logger.info("项目管理列表查询分页入参: pageIndex: "+pageIndex+" ,pageSize: "+pageSize+" ,sortField: "+sortField+" ,sortOrder: "+sortOrder);
		try
        {
			
			ProjectService projectService=new ProjectServiceImpl();
			DataRow params = new DataRow();
			params.set("project_name", project_name);
			params.set("project_code", project_code);
			params.set("department", department);
			params.set("manager", manager);
			params.set("commerce", commerce);
			params.set("client_name", client_name);
			params.set("schedule_person", schedule_person);
			params.set("is_follow", is_follow);
			params.set("project_rike_label", project_rike_label);
			params.set("product_affiliation_name", product_affiliation_name);
			params.set("sortField", sortField);
			params.set("sortOrder", sortOrder);
			//admin用户查看所有权限
			if("admin".equals(login_id)){
				 DBPage dbPage = projectService.queryProjectManageList(params,pageIndex,pageSize);
				 resultVo.setErr_no(0);
		         resultVo.setErr_info("查询成功");
		         resultVo.setResult(dbPage);
		         return resultVo;
			} 
			
			//查询登录用户拥有的角色权限
            List<DataRow> role_nos = projectService.getRoleNosByUserId(user_id);
            
            //数据字典配置角色
            List<DataRow> role_enum_list = projectService.queryEnumNo(EnumConstants.XMG_ROLE_JURISDICTION_DATA_QUERY);
            
            //所有项目显示权限
            boolean all_jurisdiction = false;
            //项目归属部门显示权限
            boolean dept_jurisdiction = false;
            //具体字段项目权限
            String personage_jurisdiction = "";
            
            
            for (DataRow data2 : role_nos) {
            	 for (DataRow data3 : role_enum_list) {
                     if (data3.getString("item_value").equalsIgnoreCase(data2.getString("role_no")))
                     {
                         if (Configuration.getString(Constants.XMGL_ROLE_ALL_JURISDICTION,"all_jurisdiction").equalsIgnoreCase(data2.getString("role_no"))){
                        	//所有项目权限
                         	all_jurisdiction = true;
                         }else if (Configuration.getString(Constants.XMGL_ROLE_DEPT_JURISDICTION,"dept_jurisdiction").equalsIgnoreCase(data2.getString("role_no"))){
                        	 //部门项目权限
                         	dept_jurisdiction = true;
                         }else{
                        	//具体字段项目权限
                        	personage_jurisdiction = data3.getString("item_value");
                         }
                     }
            	 }
            	
            }
            if (!all_jurisdiction && !dept_jurisdiction && StringUtils.isBlank(personage_jurisdiction))
            {
                throw new CommonException(1, "用户【" + login_id + "】没有配置栏目权限或者用户没有【项目管理菜单】角色权限");
            }
            boolean notBlank2 = StringUtils.isNotBlank(personage_jurisdiction);
            DBPage dbPage =new DBPage(pageIndex,pageSize);
            if(all_jurisdiction){ 
            	//所有项目权限
            	dbPage = projectService.queryProjectManageList(params,pageIndex,pageSize);
           
            }else if(dept_jurisdiction){
            	//部门项目权限
                params.set("dept_auto", "2");
                params.set("user_id", user_id);
            	dbPage = projectService.queryProjectManageList(params,pageIndex,pageSize);
            
            }else if(notBlank2){
            	//查询具体字段项目权限
                params.set("dept_auto", "3");
                params.set("login_name", login_name);
                params.set("personage_jurisdiction", personage_jurisdiction);
            	dbPage = projectService.queryProjectManageList(params,pageIndex,pageSize);
            }
         
			resultVo.setErr_no(0);
			resultVo.setErr_info("查询成功");
			resultVo.setResult(dbPage);
        }
        catch (Exception e)
        {
        	e.printStackTrace();
        	 // TODO Auto-generated catch block
            resultVo.setErr_no(-1);
            resultVo.setErr_info(e.getMessage());
        }
		return resultVo;
	}

}
