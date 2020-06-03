define(function(require, exports, module) {
	// 加载依赖模块
	require("jquery");
	function init() {
	}

	function bindPageEvent() {
		$("#save")
				.click(
						function(event) {
							$.gconfig.global.componentBusMap.mainView_maindiv_leftpanel_tree
									.loadViewConfig();
						});
	}

	function destory() {
	}

	var index = {
		"init" : init,
		"bindPageEvent" : bindPageEvent,
		"destory" : destory
	}
	module.exports = index;
});