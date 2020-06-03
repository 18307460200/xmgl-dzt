/**
 * Form表单的相关操作
 */
define(function(require, exports, module) {
	var FrameService = require("plugins/frame/scripts/service/frameService");

	/**
	 * 构造函数
	 * 
	 * @param formId:表单容器的route值
	 * @returns {Form}
	 */
	function LazyPanel(panelId, panelConfig) {
		mini.parse();
		// 网络通信层
		this.frameService = FrameService.getInstance();
		// jQuery对象Panel
		this.panel = $("#" + panelId);
		// MiniUI对象Panel
		this.miniPanel = mini.get(panelId);
		// Panel的配置信息
		this.panelConfig = panelConfig;
		// 浏览器上面的入参
		this.urlParam = mini.getParams() || {};
	}

	/**
	 * 初始化信息
	 */
	LazyPanel.prototype.loadViewConfig = function() {
		// 绑定事件
		this.onRegister();
		// 创建面板
		this.createPanel();
	};
	
	/**
	 * Panel容器注册事件监听
	 */
	LazyPanel.prototype.onRegister = function() {
		var onBeforeButtonClickFunc = $.bindFunc(this.onBeforeButtonClickFunc, this);
		this.miniPanel.on("beforebuttonclick",onBeforeButtonClickFunc);
	};
	
	/**
	 * 创建面板
	 */
	LazyPanel.prototype.createPanel = function() {
		if (this.panelConfig["initFunc"]) {
			eval(this.panelConfig["initFunc"] + "()");
		}
		var param = {};
		if (this.panelConfig["isLoad"] == "true" || this.panelConfig["expanded"] == "true") {
			this.loadData(param);
		}
	};
	
	/** ***********************************Panel加载数据的相关公开API，一般需要给外面对象调用*********************************** */
	
	/**
	 * 重新加载页面
	 */
	LazyPanel.prototype.refresh = function() {
		this.loadData();
	};
	
	/**
	 * 初始化Panel内容
	 * 
	 * @param param
	 */
	LazyPanel.prototype.loadData = function(param) {
		var This = this;
		var reqParam = {};
		var inputs = This.panelConfig["inputs"];
		if($.string.isNotEmpty(inputs)){
			inputs = eval("({" + inputs + "})");
			for ( var key in inputs) {
				var value = inputs[key]+"";
				if ($.string.isEmpty(value)) {
					value = This.urlParam[key];
				}else{
					value = value.replace(/\$(.*?)\$/g,
							function(p0, p1, p2) {
							   return This.urlParam[p1];;
							});
				}
				if ($.string.isEmpty(value)) {
					value = "";
				}
				reqParam[key] = value;
			}
		}
		var paramFunc = This.panelConfig["paramFunc"];
		if (paramFunc) {
			var param = eval(paramFunc + "()");
			$.copyObjToObj(param, reqParam);
		}
		var templateNo = reqParam["template_no"] || reqParam["_template_no"] || This.panelConfig["templateNo"] ;
		delete reqParam["template_no"];
		delete reqParam["_template_no"];
		var url = This.panelConfig["url"] || reqParam["url"] || reqParam["link_url"];
		delete reqParam["url"];
		delete reqParam["link_url"];
		url = This.frameService.getCommonUrl(templateNo,reqParam,url);
		This.miniPanel.load ( url, function(e){
			if (This.panelConfig["loadDataCallBackFunc"]) {
				eval(This.panelConfig["loadDataCallBackFunc"] + "()");
			}
		}, function(action){
			if (This.panelConfig["callbackFunc"]) {
				var iframe = "iframe" + new Date().getTime();
				window[iframe] = this.getIFrameEl();;
				eval(This.panelConfig["callbackFunc"] + "('" + action + "'," + iframe
						+ ")");
				delete window[iframe];
			}
		});
	};
	
	/************************************Panel按钮事件私有处理，一般不需要给外面对象调用*********************************** */

	/**
	 * 点击顶部按钮事件处理
	 */
	LazyPanel.prototype.onBeforeButtonClickFunc = function(e) {
		if(e.name = "collapse"){
			var body = $(this.miniPanel.getBodyEl());
			var content = body.html();
			if(body.is(":hidden") && $.string.isEmpty(content)){
				this.loadData();
			}
		}
	};
	
	/**
	 * 销毁
	 */
	LazyPanel.prototype.destroy = function() {
		this.frameService.destroy();
	};

	window.LazyPanel = LazyPanel;
	// 暴露对外的接口
	module.exports = LazyPanel;
});