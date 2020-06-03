/**
 * Select下拉框的相关操作
 */
define(function(require, exports, module) {
	var CMD = require("bootstrap/plugins/frame/scripts/service/cmd"),
    FrameService = require("bootstrap/plugins/frame/scripts/service/frameService");
	
	/**
	 * 构建函数
	 * 参数:selectId:下拉框组件的routeId
	 */
	function Select(selectId){
		this.select = $("#"+selectId+"");
		this.isAsync = this.select.attr("isAsync");
		if($.string.isEmpty(this.isAsync)){
			this.isAsync = "1";
		}
		this.isAsync = (this.isAsync == "1");
		this.isLoad = this.select.attr("isLoad");
	    this.addNull = this.select.attr("addNull");
	    this.frameService = FrameService.getInstance();
	};
	
	/**
	 * 是否异步
	 */
	Select.prototype.setIsAsync = function(isAsync){
		this.isAsync = isAsync;
	};
	
	/**
	 * 初始化界面
	 */
	Select.prototype.loadViewConfig = function(){
		if(this.isLoad != "0"){
			var dictId = this.select.attr("format");
			var inputs = this.select.attr("inputs");
			var disabled = this.select.attr("disabled");
			if($.string.isNotEmpty(inputs)){
				inputs = eval("({"+inputs+"})");
			}
			var This = this;
			var queryDictsComplete = function(resultVo){
				if(resultVo.getErrorNo() == 0){
					var str = "";
					var results = resultVo.getResults(); 
					results = results[This.select.attr("format")]; 
					if(results && results.length > 0){
						results = $.strToJson(results);
						for(var i = 0; i < results.length; i ++){
							var result = results[i];
							str += "<option value=" + result.item_value ;
							if (("," + This.select.attr("defaultValue") + ",").indexOf("," + result.item_value + ",") > -1){
								str += " selected='selected' ";
							}
							str += ">" + result.item_name + "</option>";
						}
					}
					This.select.html(str);
				}
			};
			this.frameService.queryDicts(inputs,dictId,this.isAsync,queryDictsComplete);
		}else{
			this.isLoad = "1";
		}
	};
	
	/**
	 * 释放内存工作
	 */
	Select.prototype.destroy = function() {
		this.frameService.destroy();
	};
	
	// 暴露对外的接口
	module.exports = Select;
});