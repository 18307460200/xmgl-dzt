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
 * @描述: 修改产品信息
 * @公司: 思迪科技
 * @作者: yanghl
 * @创建日期: 2017年10月28日
 * @创建时间: 下午2:02:37
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
		project_name = this.getStrParameter("project_name");  //项目名称
		project_code = this.getStrParameter("project_code");  //项目编码
		project_describe = this.getStrParameter("project_describe"); //年度
		department = this.getStrParameter("department");   //部门
		predict_money = this.getStrParameter("predict_money");  //合同预计金额
		reality_money = this.getStrParameter("reality_money");  //合同实际金额
		manager = this.getStrParameter("manager");  //项目经理
		commerce = this.getStrParameter("commerce");  //商务
		client_name = this.getStrParameter("client_name");  //客户
		contract = this.getStrParameter("contract");  //合同文本是否已回 1:是, 0:否
		project_progress = this.getStrParameter("project_progress");  //项目进度
		project_state = this.getStrParameter("project_state");  //项目状态
		
		online_date = this.getStrParameter("online_date");  //上线日期
		acceptance_date = this.getStrParameter("acceptance_date");  //验收日期
		plan_online_date = this.getStrParameter("plan_online_date");  //计划上线日期
		plan_report_date = this.getStrParameter("plan_report_date");  //计划上线报告回笼日期
		plan_acceptance_report_date = this.getStrParameter("plan_acceptance_report_date");  //计划验收报告回笼日期
		plan_acceptance_date = this.getStrParameter("plan_acceptance_date");  //计划验收日期
		
		product_project_progress = this.getStrParameter("product_project_progress");  //产品反馈进度
		commerce_project_progress = this.getStrParameter("commerce_project_progress");	//商务部反馈项目进度
		risk_label = this.getStrParameter("risk_label");  //风险标签
		
		//20191105新增
		product_affiliation_id = this.getStrParameter("product_affiliation_id"); //产品归属id
		reference_data = this.getStrParameter("reference_data"); //参考数据
		project_start_date = this.getStrParameter("project_start_date"); //项目启动时间
		contract_sign_date = this.getStrParameter("contract_sign_date");  //合同签订时间
		payment_way = this.getStrParameter("payment_way"); //付款方式
		gathering_money_ok = this.getStrParameter("gathering_money_ok");  //已收款金额
		gathering_money_not = this.getStrParameter("gathering_money_not");  //未收款金额
		top_thread_report_date = this.getStrParameter("top_thread_report_date"); //上线报告实际回笼时间
		acceptance_report_date = this.getStrParameter("acceptance_report_date");  //验收报告实际回笼时间
		is_follow = this.getStrParameter("is_follow"); //是否跟进
		schedule_person = this.getStrParameter("schedule_person");  //进度负责人
		
		//20200423
		is_special_project=this.getStrParameter("is_special_project");  //是否特殊立项
		email_date=this.getStrParameter("email_date");  //邮件写的合同回笼日期
		product_type=this.getStrParameter("product_type");  //产品类别
		//产品归属字段
//		String fxc_dept = this.getStrParameter("fxc_dept");
//		String kh_dept = this.getStrParameter("kh_dept");
//		String jy_dept = this.getStrParameter("jy_dept");
//		String lc_dept = this.getStrParameter("lc_dept");
//		String dzjf_dept = this.getStrParameter("dzjf_dept");
//		String cf_dept = this.getStrParameter("cf_dept");
//		String other_dept = this.getStrParameter("other_dept");
		
		ProjectService projectService=new ProjectServiceImpl();
		
		String login_id = SysLibrary.getLoginId();// 操作员工号UID(login_id:varchar2(50))
		String user_id = SysLibrary.getUserId();// 操作员ID(user_id:number(10))
        String login_name = SysLibrary.getLoginName();// 管理员姓名
		boolean updateFlag=false;  //通用修改权限
		boolean commerce_updateFlag=false;  //商务修改权限
		
		//根据id查询项目记录
		DataRow dataRow2 = new DataRow();
		dataRow2.set("id", id);
		DataRow projectManage = projectService.getProjectManage(dataRow2);
		
		//检查是否有修改权限,admin拥有所有修改数据权限,其他的读数据字典
		if(!"admin".equals(login_id)){
			List<DataRow> listUserEnum = projectService.queryEnumNo(EnumConstants.XMG_ROLE_JURISDICTION_DATA_QUERY);
			if(listUserEnum != null && listUserEnum.size() > 0){
				//遍历当前用户是否拥有所有权限
				if(listUserEnum != null && listUserEnum.size() > 0){
					for (int i = 0; i < listUserEnum.size(); i++) {
						DataRow userDataRow = listUserEnum.get(i);
						String itemName = userDataRow.getString("item_name");
						//判断是否拥有修改所有数据权限
						if(itemName.equals(login_id)){
							updateFlag=true;
							break;
						}
					}
				}
			}
			
			//如果没有修改所有数据权限,在判断可以修改哪些字段,不能修改的弹窗提示
			if(!updateFlag){
				
				//通用修改字段权限判断
				commonCheckUpdateDataJurisdiction(projectManage);
				
				//商务权限判断
				//查询登录用户拥有的角色权限
	            List<DataRow> role_nos = projectService.getRoleNosByUserId(user_id);
	            for (DataRow data2 : role_nos) {
	            	//商务修改权限判断
	            	if(data2.getString("role_no").equals(Constants.XMGL_COMMERCE)){
	            		commerce_updateFlag=true;
	            		break;
	            	}
	            }
				if(commerce_updateFlag){
					//商务修改权限判断
					commerceCheckUpdateDataJurisdiction(projectManage);
				}
				
			}
		}
		
		if (StringHelper.isEmpty(project_code)) {
			throw new CommonException(1, "项目编号不能为空！");
		}
		if (StringHelper.isEmpty(id)) {
			throw new CommonException(1, "项目ID不能为空！");
		}
		String org_id = SysLibrary.getOrgno();    //获取当前登录用户组织机构
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
				dataRow.set("project_progress", project_progress);  //项目进度
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
			
			dataRow.set("product_project_progress",product_project_progress );   //产品部项目反馈情况
			dataRow.set("commerce_project_progress",commerce_project_progress );  //商务部项目反馈情况
			dataRow.set("risk_label", risk_label); 
			
			dataRow.set("product_affiliation_id",product_affiliation_id ); //产品归属ID
			dataRow.set("reference_data", reference_data); 
			dataRow.set("project_start_date",project_start_date );  //项目启动时间
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
			
			//计算出来的业务字段
			//1.项目实施天数字段计算(当前日期-项目启动时间字段日期) 
			//1.1项目风险字段
			
			//2.项目进度：匹配一列更新时间字段
			if(StringUtils.isNotBlank(project_progress) && !projectManage.getString("project_progress").equals(project_progress)){
				dataRow.set("project_progress_update", DateHelper.formatDate(new Date())); //项目进度更新时间
			}
			//3.产品部项目反馈情况：匹配一列更新时间字段
			if(StringUtils.isNotBlank(product_project_progress) && !projectManage.getString("product_project_progress").equals(product_project_progress)){
				dataRow.set("product_project_progress_update", DateHelper.formatDate(new Date()));
			}
			//4.商务部项目反馈情况：匹配一列更新时间字段
			if(StringUtils.isNotBlank(commerce_project_progress)  && !projectManage.getString("commerce_project_progress").equals(commerce_project_progress)){
				dataRow.set("commerce_project_progress_update", DateHelper.formatDate(new Date()));
			}
			
			int num = 0;
			num=projectService.editProduct(dataRow);
			if (num > 0) {
				//日志记录
				DataRow dataRowLog = new DataRow();
				dataRowLog.set("id", id);
				dataRowLog.set("project_code", project_code);
				dataRowLog.set("project_name", project_name);
				dataRowLog.set("org_id", org_id);
				dataRowLog.set("updated_time", DateHelper.formatDate(new Date()));
				UserOperateLogger.logger(Constants.BUS_TYPE_PRODUCTMANAGE, "修改项目","修改项目信息成功", dataRowLog);
				result.setErr_no(0);
				result.setErr_info("修改项目信息成功！");
			} else {
				result.setErr_no(1);
				result.setErr_info("项目信息修改失败！");
			}
		}catch(Exception e){
			result.setErr_no(1);
			result.setErr_info("系统异常！");
			logger.error("", e);
		}	
		return result;
	}
	/**
	 * 通用字段权限判断
	 */
	public void commonCheckUpdateDataJurisdiction(DataRow projectManage) {
		if(!projectManage.getString("project_name").equals(project_name))
			throw new CommonException(1, "您好,你没有修改【项目名称】的权限,请联系管理员!");
		if(!projectManage.getString("project_code").equals(project_code))
			throw new CommonException(1, "您好,你没有修改【项目编码】的权限,请联系管理员!");
		if(!projectManage.getString("project_describe").equals(project_describe))
			throw new CommonException(1, "您好,你没有修改【年度(在建项目)】的权限,请联系管理员!");
		if(!projectManage.getString("predict_money").equals(new BigDecimal(predict_money).toString()))
			throw new CommonException(1, "您好,你没有修改【合同预计金额】的权限,请联系管理员!");
		if(!projectManage.getString("reality_money").equals(new BigDecimal(reality_money).toString()))
			throw new CommonException(1, "您好,你没有修改【合同实际金额】的权限,请联系管理员!");
		if(!projectManage.getString("department").equals(department))
			throw new CommonException(1, "您好,你没有修改【部门】的权限,请联系管理员!");
		if(!projectManage.getString("manager").equals(manager))
			throw new CommonException(1, "您好,你没有修改【项目经理】的权限,请联系管理员!");
		if(!projectManage.getString("commerce").equals(commerce))
			throw new CommonException(1, "您好,你没有修改【商务】的权限,请联系管理员!");
		if(!projectManage.getString("client_name").equals(client_name))
			throw new CommonException(1, "您好,你没有修改【客户】的权限,请联系管理员!");
		if(!projectManage.getString("contract").equals(contract))
			throw new CommonException(1, "您好,你没有修改【合同文本是否已回】的权限,请联系管理员!");
		if(!projectManage.getString("online_date").equals(online_date))
			throw new CommonException(1, "您好,你没有修改【上线日期】的权限,请联系管理员!");
		if(!projectManage.getString("acceptance_date").equals(acceptance_date))
			throw new CommonException(1, "您好,你没有修改【验收日期】的权限,请联系管理员!");
		if(!projectManage.getString("project_state").equals(project_state))
			throw new CommonException(1, "您好,你没有修改【项目状态】的权限,请联系管理员!");
//			if(!projectManage.getString("risk_label").equals(risk_label))
//				throw new CommonException(1, "您好,你没有修改【风险标签】的权限,请联系管理员!");
		if(!projectManage.getString("product_affiliation_id").equals(product_affiliation_id))
			throw new CommonException(1, "您好,你没有修改【产品归属】的权限,请联系管理员!");
		if(!projectManage.getString("reference_data").equals(reference_data))
			throw new CommonException(1, "您好,你没有修改【产品归属模块】的权限,请联系管理员!");
		if(!projectManage.getString("project_start_date").equals(project_start_date))
			throw new CommonException(1, "您好,你没有修改【项目启动时间】的权限,请联系管理员!");
		if(!projectManage.getString("contract_sign_date").equals(contract_sign_date))
			throw new CommonException(1, "您好,你没有修改【合同签订时间】的权限,请联系管理员!");
		if(!projectManage.getString("payment_way").equals(payment_way))
			throw new CommonException(1, "您好,你没有修改【付款方式】的权限,请联系管理员!");
		if(!projectManage.getString("gathering_money_ok").equals(new BigDecimal(gathering_money_ok).toString()))
			throw new CommonException(1, "您好,你没有修改【已收款金额】的权限,请联系管理员!");
		if(!projectManage.getString("gathering_money_not").equals(new BigDecimal(gathering_money_not).toString()))
			throw new CommonException(1, "您好,你没有修改【未收款金额】的权限,请联系管理员!");
		if(!projectManage.getString("top_thread_report_date").equals(top_thread_report_date))
			throw new CommonException(1, "您好,你没有修改【上线报告实际回笼时间】的权限,请联系管理员!");
		if(!projectManage.getString("acceptance_report_date").equals(acceptance_report_date))
			throw new CommonException(1, "您好,你没有修改【验收报告实际回笼时间】的权限,请联系管理员!");
		if(!projectManage.getString("is_follow").equals(is_follow))
			throw new CommonException(1, "您好,你没有修改【是否跟进】的权限,请联系管理员!");
		if(!projectManage.getString("schedule_person").equals(schedule_person))
			throw new CommonException(1, "您好,你没有修改【进度负责人】的权限,请联系管理员!");
		if(!projectManage.getString("is_special_project").equals(is_special_project))
			throw new CommonException(1, "您好,你没有修改【是否特殊立项】的权限,请联系管理员!");
		if(!projectManage.getString("email_date").equals(email_date))
			throw new CommonException(1, "您好,你没有修改【邮件写的合同回笼日期】的权限,请联系管理员!");
		if(!projectManage.getString("product_type").equals(product_type))
			throw new CommonException(1, "您好,你没有修改【产品类别】的权限,请联系管理员!");
	}
	
	/**
	 * 商务字段权限判断
	 */
	public void commerceCheckUpdateDataJurisdiction(DataRow projectManage) {
		if(!projectManage.getString("risk_label").equals(risk_label))
			throw new CommonException(1, "您好,你没有修改【风险标签】的权限,请联系管理员!");
		if(!projectManage.getString("product_project_progress").equals(product_project_progress))
			throw new CommonException(1, "您好,你没有修改【产品反馈进度】的权限,请联系管理员!");
		if(!projectManage.getString("plan_acceptance_date").equals(plan_acceptance_date))
			throw new CommonException(1, "您好,你没有修改【计划验收日期】的权限,请联系管理员!");
		if(!projectManage.getString("plan_acceptance_report_date").equals(plan_acceptance_report_date))
			throw new CommonException(1, "您好,你没有修改【计划验收报告回笼日期】的权限,请联系管理员!");
		if(!projectManage.getString("plan_report_date").equals(plan_report_date))
			throw new CommonException(1, "您好,你没有修改【计划上线报告回笼日期】的权限,请联系管理员!");
		if(!projectManage.getString("plan_online_date").equals(plan_online_date))
			throw new CommonException(1, "您好,你没有修改【计划上线日期】的权限,请联系管理员!");
		if(!projectManage.getString("project_progress").equals(project_progress))
			throw new CommonException(1, "您好,你没有修改【项目进度】的权限,请联系管理员!");
	}
}
