package com.thinkive.fxc.xmgl.constants;




/**
 * 描述: 常量类
 * 版权: Copyright (c) 2012 
 * 公司: 思迪科技
 * 版本: 1.0 
 * 创建日期: Sep 8, 2013 
 * 创建时间: 2:15:56 PM
 */
public abstract class Constants
{
    /**
     * session中存放当前登录用户拥有的栏目权限树
     */
    public final static String SESSION_MY_CATALOG_RIGHTS_TRESS     = "@session_base_my_catalog_rights_tress";
    /**
     * 用户操作日志名称
     */
    public final static String USER_OPERATE_LOGGER_NAME = "operate";
    /**
     * 用户管理业务
     */
    public final static String BUS_TYPE_USERMANAGE = "user_manage";
    //视频业务管理
    public final static String BUS_TYPE_VIDEOMANAGE = "video_manage";
    /**
     * 客户业务
     */
    public final static String BUS_TYPE_CUSTMANAGE = "cust_manage";
    /**
     * 产品业务
     */
    public final static String BUS_TYPE_PRODUCTMANAGE = "product_manage";
    /**
     * 问卷业务
     */
    public final static String BUS_TYPE_SURVEYMANAGE = "survey_manage";
    
    public final static String FILE_BUS_KEY = "file_bus";
    //文件服务器数据字典类型
    public final static String ENUM_SERVICE_ADDRESS = "service_address";
    //图片上传服务器数据字典地址,字典名称
    public final static String ENUM_NAME_IMG_UPLOAD_URL = "文件服务器";
    //文件数字字典服务器地址
    public final static String ENUM_NAME_IMG_DOWNLOAD_URL = "imgDownload";
    //视频上传文件服务器地址字典名
    public final static String ENUM_NAME_VIDEO_UPLOAD_URL = "videoUploadUrl";
    //视频审核结果
	public static final String SLXT_AUDIT_RESULT = "slxt_audit_result";
	
	//商务权限
	public static final String XMGL_COMMERCE = "commerce";
	
	/**
	 * 所有项目显示权限
	 */
	public static final String XMGL_ROLE_ALL_JURISDICTION = "xmgl_role.all_jurisdiction";
	/**
	 * 项目归属部门显示权限
	 */
	public static final String XMGL_ROLE_DEPT_JURISDICTION = "xmgl_role.dept_jurisdiction";
	/**
	 * 个人归属项目显示权限
	 */
	public static final String XMGL_ROLE_PERSONAGE_JURISDICTION = "xmgl_role.personage_jurisdiction";
}
