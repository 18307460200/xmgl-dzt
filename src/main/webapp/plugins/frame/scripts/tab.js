/**
 * Tab切换框的相关操作
 */
define(function(require, exports, module) {
	
	/**
	 * 构建函数
	 * 参数:tabId:tab切换框的routeId
	 */
	function Tab(tabId, tabConfig){
		mini.parse();
		// jQuery对象tab
		this.tab = $("#" + tabId);
		//miniUI对象tab
		this.miniTab = mini.get(tabId); 
		//Tab的配置
		this.tabConfig = tabConfig;
	};
	
	/**
	 * 界面初始化
	 */
	Tab.prototype.loadViewConfig = function() {
		// 绑定事件
		this.onRegister();
		// 创建Tab
		this.createTab();
	};
	
	/**
	 * 树注册事件监听
	 */
	Tab.prototype.onRegister = function() {
		var onActiveChanged = $.bindFunc(this.onActiveChanged, this);
		this.miniTab.on("activechanged", onActiveChanged);
	};
	
	/**
	 * 创建Tab
	 */
	Tab.prototype.createTab = function() {
		if (this.tabConfig["initFunc"]) {
			eval(this.tabConfig["initFunc"] + "()");
		}
	};
	
	/** ***********************************Tab处理事件私有处理，一般不需要给外面对象调用*********************************** */
	
	/**
	 * 重新加载页面
	 */
	Tab.prototype.refresh = function() {
		var firstPanel = this.tab.find(".mini-tabs-body:visible");
		firstPanel.find("div[tagName='javascript']").each(function(i) {
            var javascript = $(this).html();
            eval(javascript);
        });
	};
	
	/**
	 * tab切换事件
	 */
	Tab.prototype.onActiveChanged = function(event){
		var firstPanel = this.tab.find(".mini-tabs-body:visible");
		if (firstPanel.attr("loadJs") != "1") {
            firstPanel.attr("loadJs", "1");
            firstPanel.find("div[tagName='javascript']").each(function(i) {
                var javascript = $(this).html();
                eval(javascript);
            });
            firstPanel.find(".mini-ueditor").each(function(i){
            	var ueditorId = $(this).attr("id");
                mini.get(ueditorId).doLayout();
            });
        }
		var callBackFunc = this.tabConfig["callBackFunc"];
		if(callBackFunc){
			eval(callBackFunc+"("+event.index+")");
		}
	};
	
	/**
	 * 释放内存
	 */
	Tab.prototype.destroy = function(){
	};
	
	// 暴露对外的接口
	module.exports = Tab;
});