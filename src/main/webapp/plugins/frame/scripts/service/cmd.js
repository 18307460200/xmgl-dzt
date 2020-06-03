/**
 * 请求操作的相关常量
 */
define("plugins/frame/scripts/service/cmd",function(require, exports, module) {
	var CMD = {
		    /**
		     * 数据字典ID
		     */
		    REQUST_DICTID:"dictId",
			/**
			 * 请求栏目id
			 */
			REQUEST_CATALOGID : "_catalogId",
			/**
			 * 请求的窗体Id
			 */
			REQUEST_WINDOWID : "windowId",
			/**
			 * 请求的表单Id
			 */
			REQUEST_FORMID :  "formId",
			/**
			 * 请求功能号
			 */
			REQUEST_FUNCNO : "funcNo",
			/**
			 * 按钮权限
			 */
			REQEUST_RIGHTID : "rightId",
				/**
			 * 请求函数
			 */
			REQUEST_FUNCTION : "function",
			/**
			 * 请求class
			 */
			REQUEST_CLASS :  "_className",
			/**
			 * 请求方法
			 */
			REQUEST_METHORD : "_method",
			/**
			 * 请求携带数据
			 */
			REQUEST_EXTENDDATA : "_data",
			/**
			 * 路由值
			 */
			REQUEST_ROUTE : "_route",
			/**
			 * 提交功能
			 */
			METHORD_SUBMIT : "submit",
			/**
			 * 查询数据方法
			 */
			METHORD_QUERYDATA : "queryData",
			/**
			 * 添加数据方法
			 */
			METHORD_ADD : "add",
			/**
			 * 修改数据
			 */
			METHORD_MODIFY : "modify",
			/**
			 * 删除数据方法
			 */
			METHORD_DELETE : "delete",
			/**
			 * 导出数据
			 */
			METHOD_EXPORT : "export",
			/**
			 * 刷新
			 */
			METHOD_REFRESH : "refresh",
			/**
			 * 重置
			 */
			METHOD_RESET : "reset",
			/**
			 * 高级查询
			 */
			METHOD_ADQUERYDATA : "adQueryData",
			/**
			 * 设置列
			 */
			METHOD_SETCOLUMN : "set",
			/**
			 * 弹窗
			 */
			METHOD_POPWINDOW : "pop",
			/**
			 * 加载
			 */
			METHOD_LOADWINDOW : "load",
			/**
			 * 事件Id
			 */
			REQUEST_EVENTID : "eventId",
			/**
			 * 事件查询的功能号
			 */
			EVENTID_FUNCNO : "920100"
	};
	module.exports = CMD;
});