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
 * @����: ��Ŀ�����б��ѯ
 * @��˾: ˼�ϿƼ�
 * @����: yanghl
 * @��������: 2019��11��5��
 * @����ʱ��: ����5:17:34
 */
public class QueryProjectAction extends EventBaseAction {
	
	private static Logger logger = Logger.getLogger(QueryProjectAction.class);

	@Override
	public Result execute() {
		Result resultVo = new Result();
		
        String project_name=this.getStrParameter("project_name");  //��Ŀ����
        String project_code=this.getStrParameter("project_code");  //��Ŀ����
        String department=this.getStrParameter("department");  //���������Ʒ��
        String manager=this.getStrParameter("manager");  //��Ŀ����
        String commerce=this.getStrParameter("commerce"); //����
        String client_name=this.getStrParameter("client_name");  //�ͻ�
        String schedule_person=this.getStrParameter("schedule_person");  //���ȸ�����
        String is_follow=this.getStrParameter("is_follow");  //�Ƿ����
        String project_rike_label=this.getStrParameter("project_rike_label");  //������Ŀ
        String product_affiliation_name=this.getStrParameter("product_affiliation_name");  //��Ʒ����
        
        String user_id = SysLibrary.getUserId();// ����ԱID(user_id:number(10))
        String login_id = SysLibrary.getLoginId();// ����Ա����UID(login_id:varchar2(50))
        String login_name = SysLibrary.getLoginName();// ����Ա����

		int pageIndex = this.getIntParameter("pageIndex");
	    int pageSize = this.getIntParameter("pageSize");
	    String sortField = this.getStrParameter("sortField");
	    String sortOrder = this.getStrParameter("sortOrder");
	    pageIndex = (pageIndex == 0) ? 1 : pageIndex;
        pageSize = (pageSize == 0) ? 10 : pageSize;
        logger.info("��Ŀ�����б��ѯ��ҳ���: pageIndex: "+pageIndex+" ,pageSize: "+pageSize+" ,sortField: "+sortField+" ,sortOrder: "+sortOrder);
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
			//admin�û��鿴����Ȩ��
			if("admin".equals(login_id)){
				 DBPage dbPage = projectService.queryProjectManageList(params,pageIndex,pageSize);
				 resultVo.setErr_no(0);
		         resultVo.setErr_info("��ѯ�ɹ�");
		         resultVo.setResult(dbPage);
		         return resultVo;
			} 
			
			//��ѯ��¼�û�ӵ�еĽ�ɫȨ��
            List<DataRow> role_nos = projectService.getRoleNosByUserId(user_id);
            
            //�����ֵ����ý�ɫ
            List<DataRow> role_enum_list = projectService.queryEnumNo(EnumConstants.XMG_ROLE_JURISDICTION_DATA_QUERY);
            
            //������Ŀ��ʾȨ��
            boolean all_jurisdiction = false;
            //��Ŀ����������ʾȨ��
            boolean dept_jurisdiction = false;
            //�����ֶ���ĿȨ��
            String personage_jurisdiction = "";
            
            
            for (DataRow data2 : role_nos) {
            	 for (DataRow data3 : role_enum_list) {
                     if (data3.getString("item_value").equalsIgnoreCase(data2.getString("role_no")))
                     {
                         if (Configuration.getString(Constants.XMGL_ROLE_ALL_JURISDICTION,"all_jurisdiction").equalsIgnoreCase(data2.getString("role_no"))){
                        	//������ĿȨ��
                         	all_jurisdiction = true;
                         }else if (Configuration.getString(Constants.XMGL_ROLE_DEPT_JURISDICTION,"dept_jurisdiction").equalsIgnoreCase(data2.getString("role_no"))){
                        	 //������ĿȨ��
                         	dept_jurisdiction = true;
                         }else{
                        	//�����ֶ���ĿȨ��
                        	personage_jurisdiction = data3.getString("item_value");
                         }
                     }
            	 }
            	
            }
            if (!all_jurisdiction && !dept_jurisdiction && StringUtils.isBlank(personage_jurisdiction))
            {
                throw new CommonException(1, "�û���" + login_id + "��û��������ĿȨ�޻����û�û�С���Ŀ����˵�����ɫȨ��");
            }
            boolean notBlank2 = StringUtils.isNotBlank(personage_jurisdiction);
            DBPage dbPage =new DBPage(pageIndex,pageSize);
            if(all_jurisdiction){ 
            	//������ĿȨ��
            	dbPage = projectService.queryProjectManageList(params,pageIndex,pageSize);
           
            }else if(dept_jurisdiction){
            	//������ĿȨ��
                params.set("dept_auto", "2");
                params.set("user_id", user_id);
            	dbPage = projectService.queryProjectManageList(params,pageIndex,pageSize);
            
            }else if(notBlank2){
            	//��ѯ�����ֶ���ĿȨ��
                params.set("dept_auto", "3");
                params.set("login_name", login_name);
                params.set("personage_jurisdiction", personage_jurisdiction);
            	dbPage = projectService.queryProjectManageList(params,pageIndex,pageSize);
            }
         
			resultVo.setErr_no(0);
			resultVo.setErr_info("��ѯ�ɹ�");
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
