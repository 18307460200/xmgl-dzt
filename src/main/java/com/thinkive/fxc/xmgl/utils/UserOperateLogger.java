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
	 * @��������¼�û�������־
	 * @author qiulianqiong
	 * @created 2017��9��30�� ����3:26:27
	 * @since 
	 * @param bus_type  ҵ������
	 * @param description  ҵ������
	 * @param details    �������
	 * @param params	���
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
