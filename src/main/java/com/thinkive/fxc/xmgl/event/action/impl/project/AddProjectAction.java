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
 * @描述: 添加项目信息
 * @公司: 思迪科技
 * @作者: yanghl
 * @创建日期: 2019年11月5日
 * @创建时间: 下午6:05:26
 */
public class AddProjectAction extends EventBaseAction{
	
	private static Logger logger = Logger.getLogger(AddProjectAction.class);

	@Override
	public Result execute() {
		Result result = new Result();
		String project_name = this.getStrParameter("project_name");  //项目名称
		String project_code = this.getStrParameter("project_code");  //项目编码
		String project_describe = this.getStrParameter("project_describe"); //项目描述
		String department = this.getStrParameter("department");   //部门
		String predict_money = this.getStrParameter("predict_money");  //合同预计金额
		String reality_money = this.getStrParameter("reality_money");  //合同实际金额
		String manager = this.getStrParameter("manager");  //项目经理
		String commerce = this.getStrParameter("commerce");  //商务
		String client_name = this.getStrParameter("client_name");  //客户
		String contract = this.getStrParameter("contract");  //合同文本是否已回 1:是, 0:否
		String project_progress = this.getStrParameter("project_progress");  //项目进度
		String project_state = this.getStrParameter("project_state");  //项目状态
		
		String online_date = this.getStrParameter("online_date");  //上线日期
		String acceptance_date = this.getStrParameter("acceptance_date");  //验收日期
		String plan_online_date = this.getStrParameter("plan_online_date");  //计划上线日期
		String plan_report_date = this.getStrParameter("plan_report_date");  //计划上线报告回笼日期
		String plan_acceptance_report_date = this.getStrParameter("plan_acceptance_report_date");  //计划验收报告回笼日期
		String plan_acceptance_date = this.getStrParameter("plan_acceptance_date");  //计划验收日期
		
		String product_project_progress = this.getStrParameter("product_project_progress");  //产品反馈进度
		String commerce_project_progress = this.getStrParameter("commerce_project_progress");	//商务部反馈项目进度
		String risk_label = this.getStrParameter("risk_label");  //风险标签
		
		//20191105新增
		String product_affiliation_id = this.getStrParameter("product_affiliation_id"); //产品归属id
		String reference_data = this.getStrParameter("reference_data"); //参考数据
		String project_start_date = this.getStrParameter("project_start_date"); //项目启动时间
		String contract_sign_date = this.getStrParameter("contract_sign_date");  //合同签订时间
		String payment_way = this.getStrParameter("payment_way"); //付款方式
		String gathering_money_ok = this.getStrParameter("gathering_money_ok");  //已收款金额
		String gathering_money_not = this.getStrParameter("gathering_money_not");  //未收款金额
		String top_thread_report_date = this.getStrParameter("top_thread_report_date"); //上线报告实际回笼时间
		String acceptance_report_date = this.getStrParameter("acceptance_report_date");  //验收报告实际回笼时间
		String is_follow = this.getStrParameter("is_follow"); //是否跟进
		String schedule_person = this.getStrParameter("schedule_person");  //进度负责人
		
		//20200423
		String is_special_project=this.getStrParameter("is_special_project");  //是否特殊立项
		String email_date=this.getStrParameter("email_date");  //邮件写的合同回笼日期
		String product_type=this.getStrParameter("product_type");  //产品类别
		
		//产品归属字段
//		String fxc_dept = this.getStrParameter("fxc_dept");
//		String kh_dept = this.getStrParameter("kh_dept");
//		String jy_dept = this.getStrParameter("jy_dept");
//		String lc_dept = this.getStrParameter("lc_dept");
//		String dzjf_dept = this.getStrParameter("dzjf_dept");
//		String cf_dept = this.getStrParameter("cf_dept");
//		String other_dept = this.getStrParameter("other_dept");
		
		
		if (StringHelper.isEmpty(project_code)) {
			throw new CommonException(1, "项目编码不能为空！");
		}
		if (StringHelper.isEmpty(project_start_date)) {
			throw new CommonException(1, "项目启动时间不能为空！");
		}
//		if (StringHelper.isEmpty(fxc_dept) && StringHelper.isEmpty(kh_dept) && StringHelper.isEmpty(kh_dept) && StringHelper.isEmpty(jy_dept)
//				&& StringHelper.isEmpty(lc_dept) && StringHelper.isEmpty(dzjf_dept) && StringHelper.isEmpty(cf_dept) && StringHelper.isEmpty(other_dept)) {
//			throw new CommonException(1, "产品归属不能为空！");
//		}
		String org_id = SysLibrary.getOrgno();    //获取当前登录用户组织机构
		
		try{
			
			ProjectService projectService=new ProjectServiceImpl();
			
			DataRow product=projectService.getProject(org_id,project_code);
			if(null != product){
				result.setErr_no(1);
				result.setErr_info("产品编码已经存在！");
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
			dataRow.set("project_progress", project_progress);  //项目进度
			dataRow.set("project_state", project_state);
			
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
			
			//计算出来的业务字段
			//1.项目实施天数字段计算(当前日期-项目启动时间字段日期) 
			
			//2.项目进度：匹配一列更新时间字段
			if(StringUtils.isNotBlank(project_progress)){
				dataRow.set("project_progress_update", DateHelper.formatDate(new Date())); //项目进度更新时间
			}
			//3.产品部项目反馈情况：匹配一列更新时间字段
			if(StringUtils.isNotBlank(product_project_progress)){
				dataRow.set("product_project_progress_update", DateHelper.formatDate(new Date()));
			}
			//4.商务部项目反馈情况：匹配一列更新时间字段
			if(StringUtils.isNotBlank(commerce_project_progress)){
				dataRow.set("commerce_project_progress_update", DateHelper.formatDate(new Date()));
			}
			
			
			//产品归属
			DataRow productType = new DataRow();
//			productType.set("id", StringUtil.getUUID());
//			productType.set("fxc_dept", fxc_dept);
//			productType.set("kh_dept", kh_dept);
//			productType.set("jy_dept", jy_dept);
//			productType.set("lc_dept", lc_dept);
//			productType.set("dzjf_dept",dzjf_dept );
//			productType.set("cf_dept", cf_dept);
//			productType.set("other_dept", other_dept);
			
			//关联产品归属字段
//			dataRow.set("product_affiliation_id", productType.get("id"));
			
			int num = projectService.addProject(dataRow,productType);
			if (num > 0) {
				//日志记录
				DataRow dataRowLog = new DataRow();
				dataRowLog.set("project_code", project_code);
				dataRowLog.set("project_name", project_name);
				dataRowLog.set("org_id", org_id);
				dataRowLog.set("updated_time", DateHelper.formatDate(new Date()));
				UserOperateLogger.logger(Constants.BUS_TYPE_PRODUCTMANAGE, "新增项目",
						"新增项目成功", this.getParamModel().getBusinessParameter());
				result.setErr_no(0);
				result.setErr_info("项目信息添加成功！");
			} else {
				result.setErr_no(1);
				result.setErr_info("产品信息添加失败！");
			}
		}catch(Exception e){
			result.setErr_no(1);
			result.setErr_info("系统异常！");
			logger.error("", e);
		}
		return result;
	}
}
