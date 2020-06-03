/**
 * 非现场开户服务类
 */
define("framework/scripts/service/projectService",function(require, exports, module) {
	function ProjectService(){
		this.service = new $.domain.Service();
		this.frameService =  require("plugins/frame/scripts/service/frameService").getInstance();
	}
	
	/**
	 * 功能：获取登录的用户信息
	 */
	ProjectService.prototype.getUserInfo = function(){
		var userInfo = $.getStorage("userInfo");
		if($.string.isNotEmpty(userInfo)){
			userInfo = $.strToJson(userInfo);
		}else{
			userInfo = null;
		}
		return userInfo;
	};
	
    /**
     * 功能:退出清除session
     */
	ProjectService.prototype.clearSession = function(){
		$.removeStorage ("userInfo");
	};
	
	/**
	 * 功能:员工登录(100000)
	 * 入参: callBackFunc: 回调函数
	 *       loginId：登录账号(N)
	 *       password：登录密码(N)
	 *       ticket:图片校验码(Y)
	 */
	ProjectService.prototype.login = function(callBackFunc,loginId,password,ticket){
		var paraMap = {};
		paraMap["funcNo"] = "901018";
		paraMap["loginId"] = loginId;
		paraMap["password"] = password;
		paraMap["ticket"] = ticket;
		paraMap["op_source"] = $.gconfig.global.op_source;
		var reqParamVo = $.getReqParamVo();
		reqParamVo.setUrl($.gconfig.global.server);
		reqParamVo.setReqParam(paraMap);
		reqParamVo.setIsShowWait(true);
		this.service.invoke(reqParamVo,callBackFunc,false);
	};
	
	/**
	 * 功能:查询栏目树(100000)
	 * 入参: callBackFunc: 回调函数
	 *        catalogId：栏目数Id(N)
	 */
	ProjectService.prototype.queryTreeData = function(callBackFunc,catalogId){
		var reqParam = {};
		reqParam["id"] = catalogId;
		var funcNo = "901031";
		this.frameService.processQueryList(callBackFunc,funcNo,reqParam,null,false);
	};
	
	/**
	 * 得到会话是否过期
	 */
	ProjectService.prototype.queryUserInfo = function(callBackFunc)
	{
		var paraMap = {};
		paraMap["funcNo"] = "901020";
		var reqParamVo = $.getReqParamVo();
		reqParamVo.setUrl($.gconfig.global.server);
		reqParamVo.setReqParam(paraMap);
		reqParamVo.setIsAsync(false);
		this.service.invoke(reqParamVo,callBackFunc,false);
	};
	
	/**
	 * 弹出页面
	 */
	ProjectService.prototype.popCatalogHtmlPage = function(catalogId,catalogName)
	{
		var This = this;
		var paraMap = {};
		paraMap["funcNo"] = "901040";
		paraMap["catalogId"] = catalogId;
		var reqParamVo = $.getReqParamVo();
		reqParamVo.setUrl($.gconfig.global.server);
		reqParamVo.setReqParam(paraMap);
		reqParamVo.setIsAsync(false);
		this.service.invoke(reqParamVo,function(resultVo){
			if(resultVo.getErrorNo() == 0){
				var result = resultVo.getResults();
				var link_html = result.link_html;
				var width = result.width;
				var height = result.height;
				$.getHtmlContent ("popup/popWindowPage",function(data){
					var result = {};
					result["content"] = data;
					result["modal"] = true;
					window.top.$("#winShow").append(data);
					result["title"] = catalogName;
					window.top.$("#winShow").find("#popWindowPageUrl").attr("src",link_html);
					if(width>0)
					{
						result["width"] = width+25;
						result["height"] = height+25;
					}
					else
					{
						result["width"] = $(window).width() - 200;
						result["height"] = $(window).height() - 100;
					}
					result["isMaximize"] = 1;
					result["isMaxed"] = 0;
					window.top.$.showWinodw("popWindowPage",result);
				});
			}else{
				$.jAlert(resultVo.getErrorInfo());
			}
		},false);
	};
	
	/**
	 * 功能:查询数字字典
	 * 参数: isAsync:是否异步
	 *      callBackFunc(resultVo):回调函数
	 */
	ProjectService.prototype.queryAllDicts = function(callBackFunc){
		this.frameService.queryAllDicts(true,callBackFunc);
	};
	
	/**
	 * 功能：得到RSA的key
	 * 参数: callBackFunc:回调函数
	 */
	ProjectService.prototype.getRsaKey = function(callBackFunc){
		var paraMap = {};
		paraMap["funcNo"] = "901210";
		var reqParamVo = $.getReqParamVo();
		reqParamVo.setIsAsync(false);
		reqParamVo.setUrl($.gconfig.global.server);
		reqParamVo.setReqParam(paraMap);
		this.service.invoke(reqParamVo,callBackFunc,false);
	};
	
	/**
	 * 释放操作
	 */
	ProjectService.prototype.destroy = function(){
		this.service.destroy();
		this.frameService.destroy();
	};
	
    /**
	 * 实例化对象
	 */
	function getInstance(){
		return new ProjectService();
	}
	
	var projectService = {
		"getInstance" : getInstance
	};
	
	// 暴露对外的接口
	module.exports = projectService;
});