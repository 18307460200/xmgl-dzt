package com.thinkive.fxc.xmgl.event.action.impl.project;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.thinkive.base.exception.CommonException;
import com.thinkive.base.jdbc.DataRow;
import com.thinkive.base.util.DateHelper;
import com.thinkive.base.util.StringHelper;
import com.thinkive.base.util.StringUtil;
import com.thinkive.fxc.xmgl.constants.Constants;
import com.thinkive.fxc.xmgl.service.ProjectService;
import com.thinkive.fxc.xmgl.service.impl.ProjectServiceImpl;
import com.thinkive.fxc.xmgl.utils.UserOperateLogger;
import com.thinkive.gateway.v2.result.Result;
import com.thinkive.workplat.event.action.EventBaseAction;
import com.thinkive.workplat.system.SysLibrary;
/**
 * 
 * @����: �����Ŀ��Ϣ
 * @��˾: ˼�ϿƼ�
 * @����: yanghl
 * @��������: 2019��11��5��
 * @����ʱ��: ����6:05:26
 */
public class AddProjectAction extends EventBaseAction{
	
	private static Logger logger = Logger.getLogger(AddProjectAction.class);

	@Override
	public Result execute() {
		Result result = new Result();
		String project_name = this.getStrParameter("project_name");  //��Ŀ����
		String project_code = this.getStrParameter("project_code");  //��Ŀ����
		String project_describe = this.getStrParameter("project_describe"); //��Ŀ����
		String department = this.getStrParameter("department");   //����
		String predict_money = this.getStrParameter("predict_money");  //��ͬԤ�ƽ��
		String reality_money = this.getStrParameter("reality_money");  //��ͬʵ�ʽ��
		String manager = this.getStrParameter("manager");  //��Ŀ����
		String commerce = this.getStrParameter("commerce");  //����
		String client_name = this.getStrParameter("client_name");  //�ͻ�
		String contract = this.getStrParameter("contract");  //��ͬ�ı��Ƿ��ѻ� 1:��, 0:��
		String project_progress = this.getStrParameter("project_progress");  //��Ŀ����
		String project_state = this.getStrParameter("project_state");  //��Ŀ״̬
		
		String online_date = this.getStrParameter("online_date");  //��������
		String acceptance_date = this.getStrParameter("acceptance_date");  //��������
		String plan_online_date = this.getStrParameter("plan_online_date");  //�ƻ���������
		String plan_report_date = this.getStrParameter("plan_report_date");  //�ƻ����߱����������
		String plan_acceptance_report_date = this.getStrParameter("plan_acceptance_report_date");  //�ƻ����ձ����������
		String plan_acceptance_date = this.getStrParameter("plan_acceptance_date");  //�ƻ���������
		
		String product_project_progress = this.getStrParameter("product_project_progress");  //��Ʒ��������
		String commerce_project_progress = this.getStrParameter("commerce_project_progress");	//���񲿷�����Ŀ����
		String risk_label = this.getStrParameter("risk_label");  //���ձ�ǩ
		
		//20191105����
		String product_affiliation_id = this.getStrParameter("product_affiliation_id"); //��Ʒ����id
		String reference_data = this.getStrParameter("reference_data"); //�ο�����
		String project_start_date = this.getStrParameter("project_start_date"); //��Ŀ����ʱ��
		String contract_sign_date = this.getStrParameter("contract_sign_date");  //��ͬǩ��ʱ��
		String payment_way = this.getStrParameter("payment_way"); //���ʽ
		String gathering_money_ok = this.getStrParameter("gathering_money_ok");  //���տ���
		String gathering_money_not = this.getStrParameter("gathering_money_not");  //δ�տ���
		String top_thread_report_date = this.getStrParameter("top_thread_report_date"); //���߱���ʵ�ʻ���ʱ��
		String acceptance_report_date = this.getStrParameter("acceptance_report_date");  //���ձ���ʵ�ʻ���ʱ��
		String is_follow = this.getStrParameter("is_follow"); //�Ƿ����
		String schedule_person = this.getStrParameter("schedule_person");  //���ȸ�����
		
		//20200423
		String is_special_project=this.getStrParameter("is_special_project");  //�Ƿ���������
		String email_date=this.getStrParameter("email_date");  //�ʼ�д�ĺ�ͬ��������
		String product_type=this.getStrParameter("product_type");  //��Ʒ���
		
		//��Ʒ�����ֶ�
//		String fxc_dept = this.getStrParameter("fxc_dept");
//		String kh_dept = this.getStrParameter("kh_dept");
//		String jy_dept = this.getStrParameter("jy_dept");
//		String lc_dept = this.getStrParameter("lc_dept");
//		String dzjf_dept = this.getStrParameter("dzjf_dept");
//		String cf_dept = this.getStrParameter("cf_dept");
//		String other_dept = this.getStrParameter("other_dept");
		
		
		if (StringHelper.isEmpty(project_code)) {
			throw new CommonException(1, "��Ŀ���벻��Ϊ�գ�");
		}
		if (StringHelper.isEmpty(project_start_date)) {
			throw new CommonException(1, "��Ŀ����ʱ�䲻��Ϊ�գ�");
		}
//		if (StringHelper.isEmpty(fxc_dept) && StringHelper.isEmpty(kh_dept) && StringHelper.isEmpty(kh_dept) && StringHelper.isEmpty(jy_dept)
//				&& StringHelper.isEmpty(lc_dept) && StringHelper.isEmpty(dzjf_dept) && StringHelper.isEmpty(cf_dept) && StringHelper.isEmpty(other_dept)) {
//			throw new CommonException(1, "��Ʒ��������Ϊ�գ�");
//		}
		String org_id = SysLibrary.getOrgno();    //��ȡ��ǰ��¼�û���֯����
		
		try{
			
			ProjectService projectService=new ProjectServiceImpl();
			
			DataRow product=projectService.getProject(org_id,project_code);
			if(null != product){
				result.setErr_no(1);
				result.setErr_info("��Ʒ�����Ѿ����ڣ�");
				return result;
			}
			DataRow dataRow = new DataRow();
			dataRow.set("id", StringUtil.getUUID());
			dataRow.set("project_name", project_name);
			dataRow.set("project_code", project_code);
			dataRow.set("project_describe", project_describe);
			dataRow.set("department", department);
			dataRow.set("predict_money", predict_money);
			dataRow.set("reality_money", reality_money);
			dataRow.set("manager", manager);
			dataRow.set("commerce", commerce);
			dataRow.set("client_name", client_name);
			dataRow.set("contract", contract);
			dataRow.set("project_progress", project_progress);  //��Ŀ����
			dataRow.set("project_state", project_state);
			
			dataRow.set("online_date", online_date);
			dataRow.set("acceptance_date", acceptance_date);
			dataRow.set("plan_online_date", plan_online_date);
			dataRow.set("plan_report_date", plan_report_date); 
			dataRow.set("plan_acceptance_report_date", plan_acceptance_report_date); 
			dataRow.set("plan_acceptance_date",plan_acceptance_date ); 
			
			dataRow.set("product_project_progress",product_project_progress );   //��Ʒ����Ŀ�������
			dataRow.set("commerce_project_progress",commerce_project_progress );  //������Ŀ�������
			dataRow.set("risk_label", risk_label); 
			
			
			dataRow.set("product_affiliation_id",product_affiliation_id ); //��Ʒ����ID
			dataRow.set("reference_data", reference_data); 
			dataRow.set("project_start_date",project_start_date );  //��Ŀ����ʱ��
			dataRow.set("contract_sign_date", contract_sign_date); 
			dataRow.set("payment_way", payment_way); 
			dataRow.set("gathering_money_ok",gathering_money_ok ); 
			dataRow.set("gathering_money_not", gathering_money_not); 
			dataRow.set("top_thread_report_date", top_thread_report_date); 
			dataRow.set("acceptance_report_date", acceptance_report_date); 
			dataRow.set("schedule_person", schedule_person); 
			dataRow.set("is_follow",is_follow ); 
			
			
			dataRow.set("is_special_project", is_special_project); 
			dataRow.set("email_date", email_date); 
			dataRow.set("product_type",product_type ); 
			
			dataRow.set("create_date", DateHelper.formatDate(new Date()));
			dataRow.set("update_date", DateHelper.formatDate(new Date()));
			
			//���������ҵ���ֶ�
			//1.��Ŀʵʩ�����ֶμ���(��ǰ����-��Ŀ����ʱ���ֶ�����) 
			
			//2.��Ŀ���ȣ�ƥ��һ�и���ʱ���ֶ�
			if(StringUtils.isNotBlank(project_progress)){
				dataRow.set("project_progress_update", DateHelper.formatDate(new Date())); //��Ŀ���ȸ���ʱ��
			}
			//3.��Ʒ����Ŀ���������ƥ��һ�и���ʱ���ֶ�
			if(StringUtils.isNotBlank(product_project_progress)){
				dataRow.set("product_project_progress_update", DateHelper.formatDate(new Date()));
			}
			//4.������Ŀ���������ƥ��һ�и���ʱ���ֶ�
			if(StringUtils.isNotBlank(commerce_project_progress)){
				dataRow.set("commerce_project_progress_update", DateHelper.formatDate(new Date()));
			}
			
			
			//��Ʒ����
			DataRow productType = new DataRow();
//			productType.set("id", StringUtil.getUUID());
//			productType.set("fxc_dept", fxc_dept);
//			productType.set("kh_dept", kh_dept);
//			productType.set("jy_dept", jy_dept);
//			productType.set("lc_dept", lc_dept);
//			productType.set("dzjf_dept",dzjf_dept );
//			productType.set("cf_dept", cf_dept);
//			productType.set("other_dept", other_dept);
			
			//������Ʒ�����ֶ�
//			dataRow.set("product_affiliation_id", productType.get("id"));
			
			int num = projectService.addProject(dataRow,productType);
			if (num > 0) {
				//��־��¼
				DataRow dataRowLog = new DataRow();
				dataRowLog.set("project_code", project_code);
				dataRowLog.set("project_name", project_name);
				dataRowLog.set("org_id", org_id);
				dataRowLog.set("updated_time", DateHelper.formatDate(new Date()));
				UserOperateLogger.logger(Constants.BUS_TYPE_PRODUCTMANAGE, "������Ŀ",
						"������Ŀ�ɹ�", this.getParamModel().getBusinessParameter());
				result.setErr_no(0);
				result.setErr_info("��Ŀ��Ϣ��ӳɹ���");
			} else {
				result.setErr_no(1);
				result.setErr_info("��Ʒ��Ϣ���ʧ�ܣ�");
			}
		}catch(Exception e){
			result.setErr_no(1);
			result.setErr_info("ϵͳ�쳣��");
			logger.error("", e);
		}
		return result;
	}
}
