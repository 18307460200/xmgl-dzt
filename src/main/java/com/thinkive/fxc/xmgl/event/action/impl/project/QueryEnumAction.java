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
 * @����: ��Ʒ����,�����ֵ��ѯ
 * @��˾: ˼�ϿƼ�
 * @����: yanghl
 * @��������: 2017��10��18��
 * @����ʱ��: ����10:55:28
 */
public class QueryEnumAction extends EventBaseAction {
	private static Logger logger = Logger.getLogger(AddProjectAction.class);
	@Override
	public Result execute() {
		Result result = new Result();
		String[] enum_no = this.getStrParameter("enum_no").split(","); // enum_no
		if(enum_no.length < 1){
			  throw new CommonException(1, "�����ֵ��ѯ�쳣!");
		}
		try{
			Map<String, List<DataRow>> enumMap = EnumUtils.getEnumMap(enum_no);
	           for (Entry<String, List<DataRow>> entry : enumMap.entrySet()) {
	            logger.info("key= " + entry.getKey() + " and value= "
	                       + entry.getValue());
	             result.setResult(entry.getKey(), entry.getValue());
	          }
			result.setErr_no(0);
			result.setErr_info("�����ֵ��ѯ�ɹ���");
		}catch(Exception e){
			result.setErr_no(1);
			result.setErr_info("�����ֵ��ѯʧ�ܣ�");
			logger.error("", e);
		}
		
		return result;
	}

}
