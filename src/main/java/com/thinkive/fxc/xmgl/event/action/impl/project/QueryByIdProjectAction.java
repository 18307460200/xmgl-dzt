package com.thinkive.fxc.xmgl.event.action.impl.project;

import org.apache.log4j.Logger;

import com.thinkive.base.exception.CommonException;
import com.thinkive.base.jdbc.DataRow;
import com.thinkive.base.util.StringHelper;
import com.thinkive.fxc.xmgl.service.ProjectService;
import com.thinkive.fxc.xmgl.service.impl.ProjectServiceImpl;
import com.thinkive.gateway.v2.result.Result;
import com.thinkive.workplat.event.action.EventBaseAction;
import com.thinkive.workplat.system.SysLibrary;
/**
 * 
 * @描述: 根据ID查询项目信息
 * @公司: 思迪科技
 * @作者: yanghl
 * @创建日期: 2019年11月5日
 * @创建时间: 下午5:17:34
 */
public class QueryByIdProjectAction extends EventBaseAction {
	
	private static Logger logger = Logger.getLogger(QueryByIdProjectAction.class);

	@Override
	public Result execute() {
		Result resultVo = new Result();
		
        String id=this.getStrParameter("id");  //主键

        if (StringHelper.isEmpty(id)) {
			throw new CommonException(1, "项目ID不能为空！");
		}
        String user_id = SysLibrary.getUserId();// 操作员ID(user_id:number(10))
        String login_id = SysLibrary.getLoginId();// 操作员工号UID(login_id:varchar2(50))
        String login_name = SysLibrary.getLoginName();// 管理员姓名
        logger.info("根据ID查询项目信息: id: "+id);
		try
        {
			
			ProjectService projectService=new ProjectServiceImpl();
			DataRow params = new DataRow();
			params.set("id", id);
			DataRow dbPage = projectService.getProjectManage(params);
			if(dbPage != null){
				DataRow deptByName = projectService.getDeptByName(dbPage.getString("product_affiliation_id"));
				if(deptByName != null){
					dbPage.set("product_affiliation_name", deptByName.getString("name"));
				}
				dbPage.set("login_id", login_id);
				dbPage.set("user_id", user_id);
				dbPage.set("login_name", login_name);
			}
			resultVo.setErr_no(0);
			resultVo.setErr_info("查询成功");
			resultVo.setResult(dbPage);
        }
        catch (Exception e)
        {
        	e.printStackTrace();
        	 // TODO Auto-generated catch block
            resultVo.setErr_no(-1);
            resultVo.setErr_info(e.getMessage());
        }
		return resultVo;
	}

}
