package com.thinkive.fxc.xmgl.event.action.impl.project;


import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import com.thinkive.base.exception.CommonException;
import com.thinkive.base.jdbc.DataRow;
import com.thinkive.fxc.xmgl.utils.EnumUtils;
import com.thinkive.gateway.v2.result.Result;
import com.thinkive.workplat.event.action.EventBaseAction;

/**
 * 
 * @描述: 产品详情,数字字典查询
 * @公司: 思迪科技
 * @作者: yanghl
 * @创建日期: 2017年10月18日
 * @创建时间: 上午10:55:28
 */
public class QueryEnumAction extends EventBaseAction {
	private static Logger logger = Logger.getLogger(AddProjectAction.class);
	@Override
	public Result execute() {
		Result result = new Result();
		String[] enum_no = this.getStrParameter("enum_no").split(","); // enum_no
		if(enum_no.length < 1){
			  throw new CommonException(1, "数字字典查询异常!");
		}
		try{
			Map<String, List<DataRow>> enumMap = EnumUtils.getEnumMap(enum_no);
	           for (Entry<String, List<DataRow>> entry : enumMap.entrySet()) {
	            logger.info("key= " + entry.getKey() + " and value= "
	                       + entry.getValue());
	             result.setResult(entry.getKey(), entry.getValue());
	          }
			result.setErr_no(0);
			result.setErr_info("数字字典查询成功！");
		}catch(Exception e){
			result.setErr_no(1);
			result.setErr_info("数字字典查询失败！");
			logger.error("", e);
		}
		
		return result;
	}

}
