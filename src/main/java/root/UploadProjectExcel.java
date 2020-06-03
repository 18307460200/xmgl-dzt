package root;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.thinkive.base.exception.CommonException;
import com.thinkive.base.jdbc.DataRow;
import com.thinkive.base.util.DateHelper;
import com.thinkive.base.util.JsonHelper;
import com.thinkive.base.util.SessionHelper;
import com.thinkive.base.util.StringHelper;
import com.thinkive.base.util.StringUtil;
import com.thinkive.fxc.xmgl.constants.Constants;
import com.thinkive.fxc.xmgl.constants.EnumConstants;
import com.thinkive.fxc.xmgl.service.ProjectService;
import com.thinkive.fxc.xmgl.utils.EnumUtils;
import com.thinkive.fxc.xmgl.utils.UserOperateLogger;
import com.thinkive.server.util.SpringUtil;
import com.thinkive.web.base.ActionResult;
import com.thinkive.web.base.BaseAction;
import com.thinkive.workplat.constans.WorkPlatConstants;
import com.thinkive.workplat.system.SysLibrary;

/**
 * 
 * @描述: 项目信息上传--->Excel
 * @公司: 思迪科技
 * @作者: yanghl
 * @创建日期: 2017年10月24日
 * @创建时间: 上午11:13:11
 */
@SuppressWarnings("unchecked")
public class UploadProjectExcel extends BaseAction {
	private Logger logger = LoggerFactory.getLogger(UploadProjectExcel.class);


	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	@SuppressWarnings("unused")
	@Override
	public ActionResult doDefault() {
		DataRow result = new DataRow();
		HttpSession session = this.getRequest().getSession();
		String loginId = SessionHelper.getString(
				WorkPlatConstants.ADMIN_LOGIN_ID, session);
		logger.info("登录用户：" + loginId + ",jsessionid=" + session.getId());
		if (StringHelper.isEmpty(loginId)) {
			result.set("err_no", "0");
			result.set("errer_no", "-999");
			result.set("err_msg", "还未登录");
			this.printMsg2Client(this.getResponse(), result);
			logger.error("还未登录");
			return null;
		}

		HttpServletRequest request = this.getRequest();

		Workbook workbook = null;
		XSSFWorkbook xssfWorkbook = null; // 存储 .xlsx格式
		HSSFWorkbook hssfWorkbook = null;	// 存储 .xls格式
		
		try {
			// 检测是否为多媒体上传
			if (!ServletFileUpload.isMultipartContent(request)) {
				// 如果不是则停止
				throw new CommonException(2,"表单必须包含 enctype=multipart/form-data");
			}
			// 配置上传参数
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
			factory.setSizeThreshold(MEMORY_THRESHOLD);
			// 设置临时存储目录
			// factory.setRepository(new
			// File(System.getProperty("java.io.tmpdir")));
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 设置最大文件上传值
			upload.setFileSizeMax(MAX_FILE_SIZE);
			// 设置最大请求值 (包含文件和表单数据)
			upload.setSizeMax(MAX_REQUEST_SIZE);
			// 中文处理
			upload.setHeaderEncoding("UTF-8");
			// 解析请求的内容提取文件数据
			List<FileItem> formItems = upload.parseRequest(request);
			if (formItems != null && formItems.size() > 0) {
				// 迭代表单数据
				for (FileItem item : formItems) {
					// 处理不在表单中的字段
					if (!item.isFormField()) {
						String fileName = item.getName();
						if (fileName.endsWith(".xls")) {
							hssfWorkbook = new HSSFWorkbook(item
									.getInputStream());
						} else if (fileName.endsWith(".xlsx")) {
							workbook = new XSSFWorkbook(
									item.getInputStream());
						}
					}
				}
			}
			if (workbook == null) {
				throw new CommonException(3, "找不到上传的Excel文件");
			}

		} catch (Exception ex) {
			logger.error("", ex);
			result.set("err_no", -1);
			result.set("err_msg", "上传失败：" + ex.getMessage());
			this.printMsg2Client(this.getResponse(), result);
			return null;
		}
		ProjectService projectService = (ProjectService) SpringUtil
				.getBean("ProjectService");
		int failNum = 0; // 记录错误数
		int successNum = 0;  //记录成功数
		String failMsg = "";
		String org_id = SysLibrary.getOrgno();
		
		// .xlsx格式
		Sheet sheet = workbook.getSheetAt(0);
		int rows = sheet.getLastRowNum();
		int firstRowNum = sheet.getFirstRowNum();
		rows++;
		logger.info("================总共导入行数:"+rows+",起始行:"+firstRowNum);
		for (int i = 1; i < rows; i++) {
			try {
				Row row = sheet.getRow(i);
				//判断是否为空
				if(this.isRowEmpty(row)){
					continue;
				}
				//1.获取excel列属性
				Cell project_describe_cell = row.getCell(0);	 //第一列
				Cell project_code_cell = row.getCell(1);	 //第二列
				Cell project_name_cell = row.getCell(2);		//第三列
				Cell predict_money_cell = row.getCell(3);	//第四列
				Cell reality_money_cell = row.getCell(4);		//第五列
				Cell department_cell = row.getCell(5);			//第六列
				Cell manager_cell = row.getCell(6);	
				Cell commerce_cell = row.getCell(7);	
				Cell client_name_cell = row.getCell(8);	
				Cell contract_cell = row.getCell(9);	
				Cell project_progress_cell = row.getCell(10);	
				Cell online_date_cell = row.getCell(11);	
				Cell acceptance_date_cell = row.getCell(12);	
				Cell plan_online_date_cell = row.getCell(13);	
				Cell plan_report_date_cell = row.getCell(14);	
				Cell plan_acceptance_date_cell = row.getCell(15);	
				Cell plan_acceptance_report_date_cell = row.getCell(16);	
				Cell project_state_cell = row.getCell(17);	
				Cell product_project_progress_cell = row.getCell(18);	
				Cell commerce_project_progress_cell = row.getCell(19);	
				Cell risk_label_cell = row.getCell(20);	
				
				//20200326
				Cell reference_data_cell =  row.getCell(21);
				Cell project_start_date_cell =  row.getCell(22);
				Cell contract_sign_date_cell =  row.getCell(23);
				Cell payment_way_cell =  row.getCell(24);
				Cell schedule_person_cell =  row.getCell(25);
				Cell gathering_money_ok_cell =  row.getCell(26);
				Cell gathering_money_not_cell =  row.getCell(27);
				Cell top_thread_report_date_cell =  row.getCell(28);
				Cell acceptance_report_date_cell =  row.getCell(29);
				Cell is_follow_cell =  row.getCell(30);
				Cell product_affiliation_id_cell =  row.getCell(31);
				
				//20200423
				Cell is_special_project_cell =  row.getCell(32);
				Cell email_date_cell =  row.getCell(33);
				Cell product_type_cell =  row.getCell(34);
				
				//2.获取excel列属性内容getStringCellValue()
				project_describe_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String project_describe = project_describe_cell.getStringCellValue();		//第一列内容
				
				project_code_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型(String字符串)
				String project_code = project_code_cell.getStringCellValue();	//第二列内容
				
				project_name_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型(String字符串)
				String project_name = project_name_cell.getStringCellValue(); //第三列内容
				
				predict_money_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String predict_money = predict_money_cell.getStringCellValue();
				
				reality_money_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String reality_money = reality_money_cell.getStringCellValue();
				
				department_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String department = department_cell.getStringCellValue();
				
				manager_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String manager = manager_cell.getStringCellValue();
				
				commerce_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String commerce = commerce_cell.getStringCellValue();
				
				client_name_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String client_name = client_name_cell.getStringCellValue();
				
				contract_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String contract = contract_cell.getStringCellValue();
				
				project_progress_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String project_progress = project_progress_cell.getStringCellValue();
				
				online_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String online_date = online_date_cell.getStringCellValue();
				
				acceptance_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String acceptance_date = acceptance_date_cell.getStringCellValue();
				
				plan_online_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String plan_online_date = plan_online_date_cell.getStringCellValue();
				
				plan_report_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String plan_report_date = plan_report_date_cell.getStringCellValue();
				
				plan_acceptance_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String plan_acceptance_date = plan_acceptance_date_cell.getStringCellValue();
				
				plan_acceptance_report_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String plan_acceptance_report_date = plan_acceptance_report_date_cell.getStringCellValue();
				
				project_state_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String project_state = project_state_cell.getStringCellValue();
				
				product_project_progress_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String product_project_progress = product_project_progress_cell.getStringCellValue();
				
				commerce_project_progress_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String commerce_project_progress = commerce_project_progress_cell.getStringCellValue();
				
				risk_label_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String risk_label = risk_label_cell.getStringCellValue();
				
				//20200326
				reference_data_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String reference_data = reference_data_cell.getStringCellValue();
				
				project_start_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String project_start_date = project_start_date_cell.getStringCellValue();
				
				contract_sign_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String contract_sign_date =contract_sign_date_cell.getStringCellValue();
				
				payment_way_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String payment_way = payment_way_cell.getStringCellValue();
				
				schedule_person_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String schedule_person = schedule_person_cell.getStringCellValue();
				
				gathering_money_ok_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String gathering_money_ok =gathering_money_ok_cell.getStringCellValue();
				
				gathering_money_not_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String gathering_money_not = gathering_money_not_cell.getStringCellValue();
				
				top_thread_report_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String top_thread_report_date = top_thread_report_date_cell.getStringCellValue();
				
				acceptance_report_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String acceptance_report_date = acceptance_report_date_cell.getStringCellValue();
				
				is_follow_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String is_follow =is_follow_cell.getStringCellValue();
				
				product_affiliation_id_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String product_affiliation_id = product_affiliation_id_cell.getStringCellValue();
				
				//20200423
				is_special_project_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String is_special_project = is_special_project_cell.getStringCellValue();
				
				email_date_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String email_date =email_date_cell.getStringCellValue();
				
				product_type_cell.setCellType(org.apache.poi.ss.usermodel.Cell.CELL_TYPE_STRING); //先设置值的类型
				String product_type = product_type_cell.getStringCellValue();
				
				if (StringUtil.isEmpty(project_describe)			//年度（在建项目）
						|| project_describe.length() > 500) {
					failMsg = failMsg + "第"+(i + 1) + "行，1列数据格式不正确<br/>";
					failNum += 1;
				} else if (StringUtil.isEmpty(project_code)		//项目编码
						|| project_code.length() > 500) {
					failMsg = failMsg + "第"+(i + 1) + "行，2列数据格式不正确<br/>";
					failNum += 1;
				} else if (StringUtil.isEmpty(project_name)		//项目描述
						|| project_name.length() > 500){ 		
					failMsg = failMsg + "第"+(i + 1) + "行，3列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(predict_money)) {		//合同预计金额
					failMsg = failMsg + "第"+(i + 1) + "行，4列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(reality_money)) {			//合同金额
					failMsg = failMsg + "第"+(i + 1) + "行，5列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(department)) {			//部门
					failMsg = failMsg + "第"+(i + 1) + "行，6列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(manager)) {		//项目经理
					failMsg = failMsg + "第"+(i + 1) + "行，7列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(commerce)) {		//商务
					failMsg = failMsg + "第"+(i + 1) + "行，8列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(client_name)) {		//客户
					failMsg = failMsg + "第"+(i + 1) + "行，9列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(contract)) {		//合同文本是否已回
					failMsg = failMsg + "第"+(i + 1) + "行，10列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(project_progress)) {		//项目进度
					failMsg = failMsg + "第"+(i + 1) + "行，11列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(online_date)) {	//上线日期
					failMsg = failMsg + "第"+(i + 1) + "行，12列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(acceptance_date)) {	//验收日期
					failMsg = failMsg + "第"+(i + 1) + "行，13列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(plan_online_date)) {	//计划上线日期
					failMsg = failMsg + "第"+(i + 1) + "行，14列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(plan_report_date)) {	//计划上线报告回笼日期
					failMsg = failMsg + "第"+(i + 1) + "行，15列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(plan_acceptance_date)) {			//计划验收日期
					failMsg = failMsg + "第"+(i + 1) + "行，16列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(plan_acceptance_report_date)) {	//计划验收报告回笼日期
					failMsg = failMsg + "第"+(i + 1) + "行，17列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(project_state)) {			//项目状态
					failMsg = failMsg + "第"+(i + 1) + "行，18列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(product_project_progress)) {	//产品部反馈项目进度情况
					failMsg = failMsg + "第"+(i + 1) + "行，19列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(commerce_project_progress)) {	//商务部反馈进度情况
					failMsg = failMsg + "第"+(i + 1) + "行，20列数据格式不正确<br/>";
					failNum += 1;
				}else if (StringUtil.isEmpty(risk_label)) {		//风险标签
					failMsg = failMsg + "第"+(i + 1) + "行，21列数据格式不正确<br/>";
					failNum += 1;
				}else {
					DataRow project = projectService.getProject(org_id,project_code);
					if (null != project) {
						throw new CommonException(4, "项目编号已存在");
					}
					//3.获取数据字典对应值
					risk_label = EnumUtils.getEnumValue(EnumConstants.XMGL_RISK_LABEL, risk_label); //风险标签
					project_state = EnumUtils.getEnumValue(EnumConstants.XMGL_PROJECT_STATE, project_state);  //项目状态
					contract = EnumUtils.getEnumValue(EnumConstants.XMGL_CONTRACT,contract); //合同文本是否已回
//						department = EnumUtils.getEnumValue(EnumConstants.XMGL_DEPARTMENT,department); 
					is_follow = EnumUtils.getEnumValue(EnumConstants.XMGL_IS_FOLLOW,is_follow); //是否跟进
					is_special_project = EnumUtils.getEnumValue(EnumConstants.XMGL_IS_SPECIAL_PROJECT,is_special_project); //是否特殊立项
					
					List<DataRow> deptList = projectService.queryDeptList(null);
					//部门
					for (int j2 = 0; j2 < deptList.size(); j2++) {
						if(deptList.get(j2).getString("name").equals(department)){
							department=deptList.get(j2).getString("dept_id");
						}
					}
					
					//产品归属
					String product_affiliation_id2="";
					if(!StringUtil.isEmpty(product_affiliation_id)){
						String[] product_affiliation_idList = product_affiliation_id.split(";");
						for (int j = 0; j < product_affiliation_idList.length; j++) {
							 for (int j2 = 0; j2 < deptList.size(); j2++) {
								if(product_affiliation_idList[j].equals(deptList.get(j2).getString("name"))){
									product_affiliation_id2=product_affiliation_id2+deptList.get(j2).getString("dept_id")+",";
								}
							}
						}
						if(!StringUtil.isEmpty(product_affiliation_id2)){
							product_affiliation_id2 = product_affiliation_id2.substring(0, product_affiliation_id2.lastIndexOf(","));
						}
					}
					
					project = new DataRow();
					project.set("id", StringUtil.getUUID());
					project.set("project_name", project_name);
					project.set("project_code", project_code);
					project.set("project_describe", project_describe);
					project.set("predict_money", predict_money);
					project.set("reality_money", reality_money);
					project.set("department", department);
					project.set("manager", manager);
					project.set("commerce", commerce);
					project.set("client_name", client_name);
					project.set("contract", contract);
					project.set("project_progress", project_progress);
					project.set("online_date", online_date);
					project.set("acceptance_date", acceptance_date);
					project.set("plan_online_date", plan_online_date);
					project.set("plan_report_date", plan_report_date);
					project.set("plan_acceptance_date", plan_acceptance_date);
					project.set("plan_acceptance_report_date", plan_acceptance_report_date);
					project.set("project_state", project_state);
					project.set("product_project_progress", product_project_progress);
					project.set("commerce_project_progress", commerce_project_progress);
					project.set("risk_label", risk_label);
					project.set("create_date",DateHelper.formatDate(new Date()));
					project.set("update_date",DateHelper.formatDate(new Date()));
					
					//20200326
					project.set("reference_data",reference_data);
					project.set("project_start_date",project_start_date);
					project.set("contract_sign_date",contract_sign_date);
					project.set("payment_way",payment_way);
					project.set("schedule_person",schedule_person);
					project.set("gathering_money_ok",gathering_money_ok);
					project.set("gathering_money_not",gathering_money_not);
					project.set("top_thread_report_date",top_thread_report_date);
					project.set("acceptance_report_date",acceptance_report_date);
					project.set("is_follow",is_follow);
					project.set("product_affiliation_id",product_affiliation_id2);
					
					//20200423
					project.set("is_special_project",is_special_project);
					project.set("email_date",email_date);
					project.set("product_type",product_type);
					
					//计算出来的业务字段
					//1.项目实施天数字段计算(当前日期-项目启动时间字段日期) 
					//1.1项目风险字段
					//2.项目进度：匹配一列更新时间字段
					if(!StringUtils.isEmpty(project_progress)){
						project.set("project_progress_update", DateHelper.formatDate(new Date())); //项目进度更新时间
					}
					//3.产品部项目反馈情况：匹配一列更新时间字段
					if(!StringUtils.isEmpty(product_project_progress)){
						project.set("product_project_progress_update", DateHelper.formatDate(new Date()));
					}
					//4.商务部项目反馈情况：匹配一列更新时间字段
					if(!StringUtils.isEmpty(commerce_project_progress)){
						project.set("commerce_project_progress_update", DateHelper.formatDate(new Date()));
					}
					logger.info("导入保存参数:"+project.toString());
					int num = projectService.addProject(project,null);
					if(num > 0){
						successNum += 1;
					}
				}
			} catch (Exception e) {
				logger.error("", e);
				failMsg = failMsg + "第"+(i + 1) + "行数据添加失败："
						+ e.getMessage() + "<br/>";
				failNum += 1;
			}
		}
		result.set("fail_msg", failMsg);
		result.set("success_num", successNum);
		result.set("fail_num", failNum);
		result.set("err_no", 0);
		result.set("err_msg", "上传成功");

		DataRow param = new DataRow();
		param.set("org_id", org_id);
		UserOperateLogger.logger(Constants.BUS_TYPE_PRODUCTMANAGE,
				"Excel导入产品信息",
				"导入成功" + successNum + "条数据,失败" + failNum + "条数据", param);
		this.printMsg2Client(this.getResponse(), result);
		return null;

	}
	
	public static boolean isRowEmpty(Row row) {
		for (int c = row.getFirstCellNum(); c < row.getLastCellNum(); c++) {
			Cell cell = row.getCell(c);
			if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK)
			return false;
		}
		return true;
	}
	
	/**
	 * 描述：输出响应数据到页面 作者：陈庚 chengeng@thinkive.com 时间: 2016年1月28日 下午2:23:42
	 * 
	 * @param
	 * @return void
	 */
	private void printMsg2Client(HttpServletResponse resp, DataRow resultVo) {
		PrintWriter out = null;
		try {
			out = resp.getWriter();
			String jsonStr = JsonHelper.getJSONString(resultVo);
			out.print(jsonStr);
			out.flush();
			logger.info("返回给上传插件的数据：" + jsonStr);
		} catch (Exception e) {
			logger.error("输出响应数据失败", e);
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
}
