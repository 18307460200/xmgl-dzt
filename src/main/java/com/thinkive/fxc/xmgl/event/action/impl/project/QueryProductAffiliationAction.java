package com.thinkive.fxc.xmgl.event.action.impl.project;



import java.util.List;

import org.apache.log4j.Logger;

import com.thinkive.base.config.Configuration;
import com.thinkive.base.exception.CommonException;
import com.thinkive.base.jdbc.DataRow;
import com.thinkive.base.jdbc.DBPage;
import com.thinkive.fxc.xmgl.constants.Constants;
import com.thinkive.fxc.xmgl.service.ProjectService;
import com.thinkive.fxc.xmgl.service.impl.ProjectServiceImpl;
import com.thinkive.gateway.v2.result.Result;
import com.thinkive.workplat.event.action.EventBaseAction;
import com.thinkive.workplat.system.SysLibrary;
/**
 * 
 * @����: ��Ʒ���������ѯ
 * @��˾: ˼�ϿƼ�
 * @����: yanghl
 * @��������: 2020��1��17��
 * @����ʱ��: ����2:35:33
 */
public class QueryProductAffiliationAction extends EventBaseAction {
	
	private static Logger logger=Logger.getLogger(QueryProductAffiliationAction.class);

	@Override
	public Result execute() {
		Result resultVo = new Result();
        String product_affiliation_id=this.getStrParameter("product_affiliation_id");  //��Ʒ����id
        String user_id = SysLibrary.getUserId();// ����ԱID(user_id:number(10))
        String login_id = SysLibrary.getLoginId();// ����Ա����UID(login_id:varchar2(50))
        String login_name = SysLibrary.getLoginName();// ����Ա����
        int pageIndex = this.getIntParameter("pageIndex");
	    int pageSize = this.getIntParameter("pageSize");
	    String sortField = this.getStrParameter("sortField");
	    String sortOrder = this.getStrParameter("sortOrder");
	    pageIndex = (pageIndex == 0) ? 1 : pageIndex;
        pageSize = (pageSize == 0) ? 10 : pageSize;
		try
        {
			ProjectService projectService=new ProjectServiceImpl();
			DataRow params = new DataRow();
			params.set("product_affiliation_id", product_affiliation_id);
			params.set("sortField", sortField);
			params.set("sortOrder", sortOrder);
			
			List<DataRow> dbPage = projectService.queryProductAffiliation(params);
			
			resultVo.setErr_no(0);
			resultVo.setErr_info("��ѯ�ɹ�");
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
