package com.thinkive.fxc.xmgl.service;

import java.util.List;

import com.thinkive.base.jdbc.DBPage;
import com.thinkive.base.jdbc.DataRow;

public interface ProjectService
{
	/**
	 * 
	 * @��������Ŀ�����б��ѯ(��ѯ������Ŀ)
	 * @���ߣ� yanghl
	 * @��������: 2019��11��5��
	 * @����ʱ��: ����5:40:49
	 * @param params
	 * @param pageIndex
	 * @param pageSize
	 * @return DBPage
	 */
	public DBPage queryProjectManageList(DataRow params, int pageIndex,
			int pageSize);
	
	/**
	 * 
	 * @������������Ŀ��Ϣ
	 * @���ߣ� yanghl
	 * @��������: 2019��11��5��
	 * @����ʱ��: ����7:29:53
	 * @param dataRow
	 * @param productType
	 * @return
	 * @throws Exception int
	 */
	public int addProject(DataRow dataRow,DataRow productType) throws Exception;
	
	/**
	 * 
	 * @��������ѯ��Ŀ�����Ƿ����
	 * @���ߣ� yanghl
	 * @��������: 2019��11��5��
	 * @����ʱ��: ����7:30:06
	 * @param id
	 * @param product_code
	 * @return DataRow
	 */
	public DataRow getProject(String id, String product_code);
	/**
	 * 
	 * @�������޸Ĳ�Ʒ��Ϣ
	 * @���ߣ� yanghl
	 * @��������: 2019��11��5��
	 * @����ʱ��: ����7:30:21
	 * @param dataRow
	 * @return int
	 */
	public int editProduct(DataRow dataRow);
	/**
	 * 
	 * @������ɾ����Ʒ��Ϣ
	 * @���ߣ� yanghl
	 * @��������: 2019��11��5��
	 * @����ʱ��: ����7:30:31
	 * @param product_id
	 * @return
	 * @throws Exception int
	 */
	public int deleteProject(String[] product_id) throws Exception;
	
	/**
	 * @��������ѯ����Աӵ�еĽ�ɫȨ��
	 * @���ߣ� yanghl
	 * @��������: 2019��12��14��
	 * @����ʱ��: ����5:33:55
	 * @param user_id
	 * @return List<DataRow>
	 */
    public List<DataRow> getRoleNosByUserId(String user_id);
    
    /**
	 * @��������ѯ����Աӵ�еĸ�λȨ��
	 * @���ߣ� yanghl
	 * @��������: 2019��12��14��
	 * @����ʱ��: ����5:33:55
	 * @param user_id
	 * @return List<DataRow>
	 */
    public List<DataRow> getDeptNosByUserId(String user_id);
    
    /**
     * 
     * @��������Ʒ������ѯ
     * @���ߣ� yanghl
     * @��������: 2020��1��17��
     * @����ʱ��: ����2:39:58
     * @param params
     * @param pageIndex
     * @param pageSize
     * @return DBPage
     */
	public List<DataRow> queryProductAffiliation(DataRow params);

	/**
	 * @��������ѯ������Ϣ
	 * @���ߣ� yanghl
	 * @��������: 2020��3��26��
	 * @����ʱ��: ����7:33:35
	 * @param project
	 * @return List<DataRow>
	 */
	public List<DataRow> queryDeptList(DataRow project);

	/**
	 * @����������ID��ѯ��Ŀ��Ϣ
	 * @���ߣ� yanghl
	 * @��������: 2020��3��26��
	 * @����ʱ��: ����8:34:52
	 * @param params
	 * @return DBPage
	 */
	public DataRow getProjectManage(DataRow params);
	
	/**
	 * @��������ѯ�����ֵ�
	 * @���ߣ� yanghl
	 * @��������: 2020��3��26��
	 * @����ʱ��: ����8:34:52
	 * @param params
	 * @return DBPage
	 */
	public List<DataRow> queryEnumNo(String enum_no);
	
	/**
	 * @���������ݲ���ID
	 * @���ߣ� yanghl
	 * @��������: 2020��3��26��
	 * @����ʱ��: ����8:34:52
	 * @param params
	 * @return DBPage
	 */
	public DataRow getDeptByName(String product_affiliation_id);
	
}
