package root;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
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
 * @描述: 查看项目归属详情
 * @公司: 思迪科技
 * @作者: yanghl
 * @创建日期: 2020年2月7日
 * @创建时间: 上午11:25:02
 */
@SuppressWarnings("unchecked")
public class QueryProductAffiliation extends BaseAction {
	private Logger logger = LoggerFactory.getLogger(QueryProductAffiliation.class);


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

		this.printMsg2Client(this.getResponse(), result);
		return null;

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
