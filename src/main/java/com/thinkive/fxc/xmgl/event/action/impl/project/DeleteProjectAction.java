package com.thinkive.fxc.xmgl.event.action.impl.project;

import org.apache.log4j.Logger;

import com.thinkive.base.exception.CommonException;
import com.thinkive.fxc.xmgl.constants.Constants;
import com.thinkive.fxc.xmgl.service.ProjectService;
import com.thinkive.fxc.xmgl.service.impl.ProjectServiceImpl;
import com.thinkive.fxc.xmgl.utils.UserOperateLogger;
import com.thinkive.gateway.v2.result.Result;
import com.thinkive.server.util.SpringUtil;
import com.thinkive.workplat.event.action.EventBaseAction;
/**
 * 
 * @����: ɾ����Ʒ��Ϣ
 * @��˾: ˼�ϿƼ�
 * @����: yanghl
 * @��������: 2017��11��1��
 * @����ʱ��: ����2:43:03
 */
public class DeleteProjectAction extends EventBaseAction{
	private static Logger logger = Logger.getLogger(DeleteProjectAction.class);

	@Override
	public Result execute() {
		Result result = new Result();
		String[] product_id = this.getStrParameter("id").split(",");//��Ʒid
		if(product_id.length < 1){
			  throw new CommonException(1, "��ѡ��һ����¼");
		}
		
		ProjectService projectService=new ProjectServiceImpl();
		
		try{
			//�жϲ�Ʒ�Ƿ�¼�ƹ���Ƶ
			int num= projectService.deleteProject(product_id);
			if(num > 0){
				UserOperateLogger.logger(Constants.BUS_TYPE_CUSTMANAGE, "��Ŀ��Ϣ",
						"ɾ����Ŀ��Ϣ�ɹ�", this.getParamModel().getBusinessParameter());
				result.setErr_no(0);
				result.setErr_info("��Ŀ��Ϣɾ���ɹ���");
			}else{
				result.setErr_no(1);
				result.setErr_info("��Ŀ��Ϣɾ��ʧ�ܣ�");
			}
		}catch(Exception e){
			logger.error("", e);
			result.setErr_no(1);
			result.setErr_info("ϵͳ�쳣!");
		}
		return result;
	}
}
