package com.thinkive.fxc.xmgl.service;

import java.util.List;

import com.thinkive.base.jdbc.DBPage;
import com.thinkive.base.jdbc.DataRow;

public interface ProjectService
{
	/**
	 * 
	 * @描述：项目管理列表查询(查询所有项目)
	 * @作者： yanghl
	 * @创建日期: 2019年11月5日
	 * @创建时间: 下午5:40:49
	 * @param params
	 * @param pageIndex
	 * @param pageSize
	 * @return DBPage
	 */
	public DBPage queryProjectManageList(DataRow params, int pageIndex,
			int pageSize);
	
	/**
	 * 
	 * @描述：新增项目信息
	 * @作者： yanghl
	 * @创建日期: 2019年11月5日
	 * @创建时间: 下午7:29:53
	 * @param dataRow
	 * @param productType
	 * @return
	 * @throws Exception int
	 */
	public int addProject(DataRow dataRow,DataRow productType) throws Exception;
	
	/**
	 * 
	 * @描述：查询项目编码是否存在
	 * @作者： yanghl
	 * @创建日期: 2019年11月5日
	 * @创建时间: 下午7:30:06
	 * @param id
	 * @param product_code
	 * @return DataRow
	 */
	public DataRow getProject(String id, String product_code);
	/**
	 * 
	 * @描述：修改产品信息
	 * @作者： yanghl
	 * @创建日期: 2019年11月5日
	 * @创建时间: 下午7:30:21
	 * @param dataRow
	 * @return int
	 */
	public int editProduct(DataRow dataRow);
	/**
	 * 
	 * @描述：删除产品信息
	 * @作者： yanghl
	 * @创建日期: 2019年11月5日
	 * @创建时间: 下午7:30:31
	 * @param product_id
	 * @return
	 * @throws Exception int
	 */
	public int deleteProject(String[] product_id) throws Exception;
	
	/**
	 * @描述：查询管理员拥有的角色权限
	 * @作者： yanghl
	 * @创建日期: 2019年12月14日
	 * @创建时间: 下午5:33:55
	 * @param user_id
	 * @return List<DataRow>
	 */
    public List<DataRow> getRoleNosByUserId(String user_id);
    
    /**
	 * @描述：查询管理员拥有的岗位权限
	 * @作者： yanghl
	 * @创建日期: 2019年12月14日
	 * @创建时间: 下午5:33:55
	 * @param user_id
	 * @return List<DataRow>
	 */
    public List<DataRow> getDeptNosByUserId(String user_id);
    
    /**
     * 
     * @描述：产品归属查询
     * @作者： yanghl
     * @创建日期: 2020年1月17日
     * @创建时间: 下午2:39:58
     * @param params
     * @param pageIndex
     * @param pageSize
     * @return DBPage
     */
	public List<DataRow> queryProductAffiliation(DataRow params);

	/**
	 * @描述：查询部门信息
	 * @作者： yanghl
	 * @创建日期: 2020年3月26日
	 * @创建时间: 下午7:33:35
	 * @param project
	 * @return List<DataRow>
	 */
	public List<DataRow> queryDeptList(DataRow project);

	/**
	 * @描述：根据ID查询项目信息
	 * @作者： yanghl
	 * @创建日期: 2020年3月26日
	 * @创建时间: 下午8:34:52
	 * @param params
	 * @return DBPage
	 */
	public DataRow getProjectManage(DataRow params);
	
	/**
	 * @描述：查询数据字典
	 * @作者： yanghl
	 * @创建日期: 2020年3月26日
	 * @创建时间: 下午8:34:52
	 * @param params
	 * @return DBPage
	 */
	public List<DataRow> queryEnumNo(String enum_no);
	
	/**
	 * @描述：根据部门ID
	 * @作者： yanghl
	 * @创建日期: 2020年3月26日
	 * @创建时间: 下午8:34:52
	 * @param params
	 * @return DBPage
	 */
	public DataRow getDeptByName(String product_affiliation_id);
	
}
