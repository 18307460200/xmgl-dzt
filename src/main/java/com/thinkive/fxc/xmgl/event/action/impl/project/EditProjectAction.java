package com.thinkive.fxc.xmgl.event.action.impl.project;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.thinkive.base.config.Configuration;
import com.thinkive.base.exception.CommonException;
import com.thinkive.base.jdbc.DataRow;
import com.thinkive.base.util.DateHelper;
import com.thinkive.base.util.StringHelper;
import com.thinkive.fxc.xmgl.constants.Constants;
import com.thinkive.fxc.xmgl.constants.EnumConstants;
import com.thinkive.fxc.xmgl.service.ProjectService;
import com.thinkive.fxc.xmgl.service.impl.ProjectServiceImpl;
import com.thinkive.fxc.xmgl.utils.EnumUtils;
import com.thinkive.fxc.xmgl.utils.UserOperateLogger;
import com.thinkive.gateway.v2.result.Result;
import com.thinkive.workplat.event.action.EventBaseAction;
import com.thinkive.workplat.system.SysLibrary;
/**
 * 
 * @����: �޸Ĳ�Ʒ��Ϣ
 * @��˾: ˼�ϿƼ�
 * @����: yanghl
 * @��������: 2017��10��28��
 * @����ʱ��: ����2:02:37
 */

public class EditProjectAction extends EventBaseAction{
	
	private static Logger logger = Logger.getLogger(EditProjectAction.class);

	private String  id ;
	private String  project_name ;
	private String  project_code ;
	private String  project_describe ;
	private String  department ;
	private String  predict_money ;
	private String  reality_money ;
	private String  manager;
	private String  commerce;
	private String  client_name;
	private String  contract;
	private String  project_progress;
	private String  project_state;
	private String  online_date;
	private String  acceptance_date;
	private String  plan_online_date;
	private String  plan_report_date;
	private String  plan_acceptance_report_date;
	private String  plan_acceptance_date;
	private String  product_project_progress;
	private String  commerce_project_progress;
	private String  risk_label;
	private String  product_affiliation_id;
	private String  reference_data;
	private String  project_start_date;
	private String  contract_sign_date;
	private String  payment_way;
	private String  gathering_money_ok;
	private String  gathering_money_not;
	private String  top_thread_report_date;
	private String  acceptance_report_date;
	private String  is_follow;
	private String  schedule_person;
	private String  is_special_project;
	private String  email_date;
	private String  product_type;
	@Override
	public Result execute() {
		
		Result result = new Result();
		id = this.getStrParameter("id");  //id
		project_name = this.getStrParameter("project_name");  //��Ŀ����
		project_code = this.getStrParameter("project_code");  //��Ŀ����
		project_describe = this.getStrParameter("project_describe"); //���
		department = this.getStrParameter("department");   //����
		predict_money = this.getStrParameter("predict_money");  //��ͬԤ�ƽ��
		reality_money = this.getStrParameter("reality_money");  //��ͬʵ�ʽ��
		manager = this.getStrParameter("manager");  //��Ŀ����
		commerce = this.getStrParameter("commerce");  //����
		client_name = this.getStrParameter("client_name");  //�ͻ�
		contract = this.getStrParameter("contract");  //��ͬ�ı��Ƿ��ѻ� 1:��, 0:��
		project_progress = this.getStrParameter("project_progress");  //��Ŀ����
		project_state = this.getStrParameter("project_state");  //��Ŀ״̬
		
		online_date = this.getStrParameter("online_date");  //��������
		acceptance_date = this.getStrParameter("acceptance_date");  //��������
		plan_online_date = this.getStrParameter("plan_online_date");  //�ƻ���������
		plan_report_date = this.getStrParameter("plan_report_date");  //�ƻ����߱����������
		plan_acceptance_report_date = this.getStrParameter("plan_acceptance_report_date");  //�ƻ����ձ����������
		plan_acceptance_date = this.getStrParameter("plan_acceptance_date");  //�ƻ���������
		
		product_project_progress = this.getStrParameter("product_project_progress");  //��Ʒ��������
		commerce_project_progress = this.getStrParameter("commerce_project_progress");	//���񲿷�����Ŀ����
		risk_label = this.getStrParameter("risk_label");  //���ձ�ǩ
		
		//20191105����
		product_affiliation_id = this.getStrParameter("product_affiliation_id"); //��Ʒ����id
		reference_data = this.getStrParameter("reference_data"); //�ο�����
		project_start_date = this.getStrParameter("project_start_date"); //��Ŀ����ʱ��
		contract_sign_date = this.getStrParameter("contract_sign_date");  //��ͬǩ��ʱ��
		payment_way = this.getStrParameter("payment_way"); //���ʽ
		gathering_money_ok = this.getStrParameter("gathering_money_ok");  //���տ���
		gathering_money_not = this.getStrParameter("gathering_money_not");  //δ�տ���
		top_thread_report_date = this.getStrParameter("top_thread_report_date"); //���߱���ʵ�ʻ���ʱ��
		acceptance_report_date = this.getStrParameter("acceptance_report_date");  //���ձ���ʵ�ʻ���ʱ��
		is_follow = this.getStrParameter("is_follow"); //�Ƿ����
		schedule_person = this.getStrParameter("schedule_person");  //���ȸ�����
		
		//20200423
		is_special_project=this.getStrParameter("is_special_project");  //�Ƿ���������
		email_date=this.getStrParameter("email_date");  //�ʼ�д�ĺ�ͬ��������
		product_type=this.getStrParameter("product_type");  //��Ʒ���
		//��Ʒ�����ֶ�
//		String fxc_dept = this.getStrParameter("fxc_dept");
//		String kh_dept = this.getStrParameter("kh_dept");
//		String jy_dept = this.getStrParameter("jy_dept");
//		String lc_dept = this.getStrParameter("lc_dept");
//		String dzjf_dept = this.getStrParameter("dzjf_dept");
//		String cf_dept = this.getStrParameter("cf_dept");
//		String other_dept = this.getStrParameter("other_dept");
		
		ProjectService projectService=new ProjectServiceImpl();
		
		String login_id = SysLibrary.getLoginId();// ����Ա����UID(login_id:varchar2(50))
		String user_id = SysLibrary.getUserId();// ����ԱID(user_id:number(10))
        String login_name = SysLibrary.getLoginName();// ����Ա����
		boolean updateFlag=false;  //ͨ���޸�Ȩ��
		boolean commerce_updateFlag=false;  //�����޸�Ȩ��
		
		//����id��ѯ��Ŀ��¼
		DataRow dataRow2 = new DataRow();
		dataRow2.set("id", id);
		DataRow projectManage = projectService.getProjectManage(dataRow2);
		
		//����Ƿ����޸�Ȩ��,adminӵ�������޸�����Ȩ��,�����Ķ������ֵ�
		if(!"admin".equals(login_id)){
			List<DataRow> listUserEnum = projectService.queryEnumNo(EnumConstants.XMG_ROLE_JURISDICTION_DATA_QUERY);
			if(listUserEnum != null && listUserEnum.size() > 0){
				//������ǰ�û��Ƿ�ӵ������Ȩ��
				if(listUserEnum != null && listUserEnum.size() > 0){
					for (int i = 0; i < listUserEnum.size(); i++) {
						DataRow userDataRow = listUserEnum.get(i);
						String itemName = userDataRow.getString("item_name");
						//�ж��Ƿ�ӵ���޸���������Ȩ��
						if(itemName.equals(login_id)){
							updateFlag=true;
							break;
						}
					}
				}
			}
			
			//���û���޸���������Ȩ��,���жϿ����޸���Щ�ֶ�,�����޸ĵĵ�����ʾ
			if(!updateFlag){
				
				//ͨ���޸��ֶ�Ȩ���ж�
				commonCheckUpdateDataJurisdiction(projectManage);
				
				//����Ȩ���ж�
				//��ѯ��¼�û�ӵ�еĽ�ɫȨ��
	            List<DataRow> role_nos = projectService.getRoleNosByUserId(user_id);
	            for (DataRow data2 : role_nos) {
	            	//�����޸�Ȩ���ж�
	            	if(data2.getString("role_no").equals(Constants.XMGL_COMMERCE)){
	            		commerce_updateFlag=true;
	            		break;
	            	}
	            }
				if(commerce_updateFlag){
					//�����޸�Ȩ���ж�
					commerceCheckUpdateDataJurisdiction(projectManage);
				}
				
			}
		}
		
		if (StringHelper.isEmpty(project_code)) {
			throw new CommonException(1, "��Ŀ��Ų���Ϊ�գ�");
		}
		if (StringHelper.isEmpty(id)) {
			throw new CommonException(1, "��ĿID����Ϊ�գ�");
		}
		String org_id = SysLibrary.getOrgno();    //��ȡ��ǰ��¼�û���֯����
		try{
			
			DataRow dataRow = new DataRow();
			dataRow.set("id", id);
			dataRow.set("project_code", project_code);
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("project_name", project_name);
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("project_describe", project_describe);
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("department", department);
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("predict_money", predict_money);
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("reality_money", reality_money);
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("manager", manager);
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("commerce", commerce);
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("client_name", client_name);
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("contract", contract);
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("project_progress", project_progress);  //��Ŀ����
			}
			if (StringHelper.isNotEmpty(project_name)) {
				dataRow.set("project_state", project_state);
			}
			if (StringHelper.isNotEmpty(gathering_money_not)) {
				dataRow.set("gathering_money_not", gathering_money_not);
			}
			if (StringHelper.isNotEmpty(gathering_money_not)) {
				dataRow.set("gathering_money_ok",gathering_money_ok ); 
			}
			
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
			dataRow.set("top_thread_report_date", top_thread_report_date); 
			dataRow.set("acceptance_report_date", acceptance_report_date); 
			dataRow.set("schedule_person", schedule_person); 
			dataRow.set("is_follow",is_follow ); 
			
			dataRow.set("is_special_project", is_special_project); 
			dataRow.set("email_date", email_date); 
			dataRow.set("product_type",product_type); 
			
			dataRow.set("create_date", DateHelper.formatDate(new Date()));
			dataRow.set("update_date", DateHelper.formatDate(new Date()));
			
			//���������ҵ���ֶ�
			//1.��Ŀʵʩ�����ֶμ���(��ǰ����-��Ŀ����ʱ���ֶ�����) 
			//1.1��Ŀ�����ֶ�
			
			//2.��Ŀ���ȣ�ƥ��һ�и���ʱ���ֶ�
			if(StringUtils.isNotBlank(project_progress) && !projectManage.getString("project_progress").equals(project_progress)){
				dataRow.set("project_progress_update", DateHelper.formatDate(new Date())); //��Ŀ���ȸ���ʱ��
			}
			//3.��Ʒ����Ŀ���������ƥ��һ�и���ʱ���ֶ�
			if(StringUtils.isNotBlank(product_project_progress) && !projectManage.getString("product_project_progress").equals(product_project_progress)){
				dataRow.set("product_project_progress_update", DateHelper.formatDate(new Date()));
			}
			//4.������Ŀ���������ƥ��һ�и���ʱ���ֶ�
			if(StringUtils.isNotBlank(commerce_project_progress)  && !projectManage.getString("commerce_project_progress").equals(commerce_project_progress)){
				dataRow.set("commerce_project_progress_update", DateHelper.formatDate(new Date()));
			}
			
			int num = 0;
			num=projectService.editProduct(dataRow);
			if (num > 0) {
				//��־��¼
				DataRow dataRowLog = new DataRow();
				dataRowLog.set("id", id);
				dataRowLog.set("project_code", project_code);
				dataRowLog.set("project_name", project_name);
				dataRowLog.set("org_id", org_id);
				dataRowLog.set("updated_time", DateHelper.formatDate(new Date()));
				UserOperateLogger.logger(Constants.BUS_TYPE_PRODUCTMANAGE, "�޸���Ŀ","�޸���Ŀ��Ϣ�ɹ�", dataRowLog);
				result.setErr_no(0);
				result.setErr_info("�޸���Ŀ��Ϣ�ɹ���");
			} else {
				result.setErr_no(1);
				result.setErr_info("��Ŀ��Ϣ�޸�ʧ�ܣ�");
			}
		}catch(Exception e){
			result.setErr_no(1);
			result.setErr_info("ϵͳ�쳣��");
			logger.error("", e);
		}	
		return result;
	}
	/**
	 * ͨ���ֶ�Ȩ���ж�
	 */
	public void commonCheckUpdateDataJurisdiction(DataRow projectManage) {
		if(!projectManage.getString("project_name").equals(project_name))
			throw new CommonException(1, "����,��û���޸ġ���Ŀ���ơ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("project_code").equals(project_code))
			throw new CommonException(1, "����,��û���޸ġ���Ŀ���롿��Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("project_describe").equals(project_describe))
			throw new CommonException(1, "����,��û���޸ġ����(�ڽ���Ŀ)����Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("predict_money").equals(new BigDecimal(predict_money).toString()))
			throw new CommonException(1, "����,��û���޸ġ���ͬԤ�ƽ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("reality_money").equals(new BigDecimal(reality_money).toString()))
			throw new CommonException(1, "����,��û���޸ġ���ͬʵ�ʽ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("department").equals(department))
			throw new CommonException(1, "����,��û���޸ġ����š���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("manager").equals(manager))
			throw new CommonException(1, "����,��û���޸ġ���Ŀ������Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("commerce").equals(commerce))
			throw new CommonException(1, "����,��û���޸ġ����񡿵�Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("client_name").equals(client_name))
			throw new CommonException(1, "����,��û���޸ġ��ͻ�����Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("contract").equals(contract))
			throw new CommonException(1, "����,��û���޸ġ���ͬ�ı��Ƿ��ѻء���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("online_date").equals(online_date))
			throw new CommonException(1, "����,��û���޸ġ��������ڡ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("acceptance_date").equals(acceptance_date))
			throw new CommonException(1, "����,��û���޸ġ��������ڡ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("project_state").equals(project_state))
			throw new CommonException(1, "����,��û���޸ġ���Ŀ״̬����Ȩ��,����ϵ����Ա!");
//			if(!projectManage.getString("risk_label").equals(risk_label))
//				throw new CommonException(1, "����,��û���޸ġ����ձ�ǩ����Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("product_affiliation_id").equals(product_affiliation_id))
			throw new CommonException(1, "����,��û���޸ġ���Ʒ��������Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("reference_data").equals(reference_data))
			throw new CommonException(1, "����,��û���޸ġ���Ʒ����ģ�顿��Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("project_start_date").equals(project_start_date))
			throw new CommonException(1, "����,��û���޸ġ���Ŀ����ʱ�䡿��Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("contract_sign_date").equals(contract_sign_date))
			throw new CommonException(1, "����,��û���޸ġ���ͬǩ��ʱ�䡿��Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("payment_way").equals(payment_way))
			throw new CommonException(1, "����,��û���޸ġ����ʽ����Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("gathering_money_ok").equals(new BigDecimal(gathering_money_ok).toString()))
			throw new CommonException(1, "����,��û���޸ġ����տ����Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("gathering_money_not").equals(new BigDecimal(gathering_money_not).toString()))
			throw new CommonException(1, "����,��û���޸ġ�δ�տ����Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("top_thread_report_date").equals(top_thread_report_date))
			throw new CommonException(1, "����,��û���޸ġ����߱���ʵ�ʻ���ʱ�䡿��Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("acceptance_report_date").equals(acceptance_report_date))
			throw new CommonException(1, "����,��û���޸ġ����ձ���ʵ�ʻ���ʱ�䡿��Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("is_follow").equals(is_follow))
			throw new CommonException(1, "����,��û���޸ġ��Ƿ��������Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("schedule_person").equals(schedule_person))
			throw new CommonException(1, "����,��û���޸ġ����ȸ����ˡ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("is_special_project").equals(is_special_project))
			throw new CommonException(1, "����,��û���޸ġ��Ƿ����������Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("email_date").equals(email_date))
			throw new CommonException(1, "����,��û���޸ġ��ʼ�д�ĺ�ͬ�������ڡ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("product_type").equals(product_type))
			throw new CommonException(1, "����,��û���޸ġ���Ʒ��𡿵�Ȩ��,����ϵ����Ա!");
	}
	
	/**
	 * �����ֶ�Ȩ���ж�
	 */
	public void commerceCheckUpdateDataJurisdiction(DataRow projectManage) {
		if(!projectManage.getString("risk_label").equals(risk_label))
			throw new CommonException(1, "����,��û���޸ġ����ձ�ǩ����Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("product_project_progress").equals(product_project_progress))
			throw new CommonException(1, "����,��û���޸ġ���Ʒ�������ȡ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("plan_acceptance_date").equals(plan_acceptance_date))
			throw new CommonException(1, "����,��û���޸ġ��ƻ��������ڡ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("plan_acceptance_report_date").equals(plan_acceptance_report_date))
			throw new CommonException(1, "����,��û���޸ġ��ƻ����ձ���������ڡ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("plan_report_date").equals(plan_report_date))
			throw new CommonException(1, "����,��û���޸ġ��ƻ����߱���������ڡ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("plan_online_date").equals(plan_online_date))
			throw new CommonException(1, "����,��û���޸ġ��ƻ��������ڡ���Ȩ��,����ϵ����Ա!");
		if(!projectManage.getString("project_progress").equals(project_progress))
			throw new CommonException(1, "����,��û���޸ġ���Ŀ���ȡ���Ȩ��,����ϵ����Ա!");
	}
}
