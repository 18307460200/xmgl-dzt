package com.thinkive.fxc.xmgl.utils;



import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.thinkive.base.util.DateHelper;
import com.thinkive.base.util.JsonHelper;
import com.thinkive.fxc.xmgl.constants.Constants;
import com.thinkive.workplat.system.SysLibrary;

public class UserOperateLogger {
	private static Logger logger = LoggerFactory.getLogger(Constants.USER_OPERATE_LOGGER_NAME);
	/**
	 * @描述：记录用户操作日志
	 * @author qiulianqiong
	 * @created 2017年9月30日 下午3:26:27
	 * @since 
	 * @param bus_type  业务类型
	 * @param description  业务描述
	 * @param details    结果详情
	 * @param params	入参
	 */
	public static void logger(String bus_type,String description,String details,Map<String,String> params){
		Map<String, String> loggerStr = new HashMap<String, String>();
		loggerStr.put("login_id", SysLibrary.getLoginId());
		loggerStr.put("bus_type", bus_type);
		loggerStr.put("description", description);
		loggerStr.put("details", details);
		loggerStr.put("params",params.toString());
		loggerStr.put("bus_type", bus_type);
		loggerStr.put("created_time", DateHelper.formatDate(new Date(), DateHelper.pattern_time));
		logger.info(JsonHelper.getJSONString(loggerStr));
	}
}
