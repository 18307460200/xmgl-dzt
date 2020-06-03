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
 * @描述: 删除产品信息
 * @公司: 思迪科技
 * @作者: yanghl
 * @创建日期: 2017年11月1日
 * @创建时间: 下午2:43:03
 */
public class DeleteProjectAction extends EventBaseAction{
	private static Logger logger = Logger.getLogger(DeleteProjectAction.class);

	@Override
	public Result execute() {
		Result result = new Result();
		String[] product_id = this.getStrParameter("id").split(",");//产品id
		if(product_id.length < 1){
			  throw new CommonException(1, "请选择一条记录");
		}
		
		ProjectService projectService=new ProjectServiceImpl();
		
		try{
			//判断产品是否录制过视频
			int num= projectService.deleteProject(product_id);
			if(num > 0){
				UserOperateLogger.logger(Constants.BUS_TYPE_CUSTMANAGE, "项目信息",
						"删除项目信息成功", this.getParamModel().getBusinessParameter());
				result.setErr_no(0);
				result.setErr_info("项目信息删除成功！");
			}else{
				result.setErr_no(1);
				result.setErr_info("项目信息删除失败！");
			}
		}catch(Exception e){
			logger.error("", e);
			result.setErr_no(1);
			result.setErr_info("系统异常!");
		}
		return result;
	}
}
