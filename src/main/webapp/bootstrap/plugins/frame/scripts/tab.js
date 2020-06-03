/**
 * tab组件的相关操作
 */
define(function(require, exports, module) { 
    FrameService = require("bootstrap/plugins/frame/scripts/service/frameService");
	
	/**
	 * 构建函数
	 * 参数:tabId: 
	 */
	function Tab(tabId){ 
		This = this;  
		$("div#"+tabId+" ul").each(function(){
			This.tabId =$(this).attr("id");
			This.tab = $("#"+$(this).attr("id"));
		});
		this.isAsync = this.tab.attr("isAsync");
		if($.string.isEmpty(this.isAsync)){
			this.isAsync = "1";
		}
		this.isAsync = (this.isAsync == "1");
		this.isLoad = this.tab.attr("isLoad"); 
	    this.frameService = FrameService.getInstance();
	};
	
	/**
	 * 是否异步
	 */
	Tab.prototype.setIsAsync = function(isAsync){
		this.isAsync = isAsync;
	};
	
	/**
	 * 初始化界面
	 */
	Tab.prototype.loadViewConfig = function(){
		if(!(this.isLoad == "1")) 
		{
			var tab_id = $("#"+This.tabId+" a:first").attr("hrefs");
			if($.string.isNotEmpty(tab_id)){
				var template_no = $("#"+tab_id).attr("template_no");
				var url = $("#"+tab_id).attr("url");
				var isSignData = $("#"+tab_id).attr("isSign") == "true";
				var params = {};
				if($.string.isNotEmpty(template_no) || $.string.isNotEmpty(url)){
					var href = This.frameService.getCommonUrl(template_no, params, url, isSignData);
					var content = '<iframe src="' + href + '" width="100%" height="450px" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe>';
					$("#"+tab_id).empty().append(content);
					//document.getElementById(tab_id).innerHTML = content;
				}
			}
			$("#"+This.tabId+" a:first").tab('show');
			var callBackFunc = $("#"+This.tabId).attr("callBackFunc");
			if(callBackFunc){
				eval(callBackFunc+"("+e+")");
			}
			
		}

		$("#"+This.tabId+" a").click(function (e) {
			var tab_id = $(this).attr("hrefs");
			if($.string.isNotEmpty(tab_id)){
				var template_no = $("#"+tab_id).attr("template_no");
				var url = $("#"+tab_id).attr("url");
				var isSignData = $("#"+tab_id).attr("isSign") == "true";
				var params = {};
				if($.string.isNotEmpty(template_no) || $.string.isNotEmpty(url)){
					var href = This.frameService.getCommonUrl(template_no, params, url, isSignData);
					var content = '<iframe src="' + href + '" width="100%" height="450px" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe>';
					$("#"+tab_id).empty().append(content);
					//document.getElementById(This.tabId).innerHTML = content;
				}
			}
			e.preventDefault();
			$(this).tab('show');
			var callBackFunc = $("#"+This.tabId).attr("callBackFunc");
			if(callBackFunc){
				eval(callBackFunc+"("+e+")");
			}
		})
	};
	
	/**
	 * 释放内存工作
	 */
	Tab.prototype.destroy = function() {
		this.frameService.destroy();
	};
	
	// 暴露对外的接口
	module.exports = Tab;
});