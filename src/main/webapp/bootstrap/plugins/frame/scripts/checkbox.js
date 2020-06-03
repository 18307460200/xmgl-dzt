/**
 * Checkbox下拉框的相关操作
 */
define(function(require, exports, module) { 
	var CMD = require("bootstrap/plugins/frame/scripts/service/cmd"),
    FrameService = require("bootstrap/plugins/frame/scripts/service/frameService");

	/**
	 * 构建函数
	 * 参数:CheckboxId:下拉框组件的ID
	 */
	function Checkbox(checkboxId){
		this.checkbox = $("#"+checkboxId+"");
		this.isAsync = this.checkbox.attr("isAsync");
		if($.string.isEmpty(this.isAsync)){
			this.isAsync = "1";
		}
		this.isAsync = (this.isAsync == "1");
		this.isLoad = this.checkbox.attr("isLoad"); 
	    this.frameService = FrameService.getInstance();
	    this.componentBusMap = $.gconfig.global.componentBusMap;
	};
	
	/**
	 * 是否异步
	 */
	Checkbox.prototype.setIsAsync = function(isAsync){
		this.isAsync = isAsync;
	};
	
	/**
	 * 初始化界面
	 */
	Checkbox.prototype.loadViewConfig = function(){
		if(this.isLoad != "0"){
			var dictId = this.checkbox.attr("format");
			var inputs = this.checkbox.attr("inputs");
			var disabled = this.checkbox.attr("disabled");
			if($.string.isNotEmpty(inputs)){
				inputs = eval("({"+inputs+"})");
			}
			var This = this;
			var queryDictsComplete = function(resultVo){
				if(resultVo.getErrorNo() == 0){ 
					var str = "";
					var results = resultVo.getResults(); 
					results = results[This.checkbox.attr("format")]; 
					if(results && results.length > 0){
						results = $.strToJson(results);
						for(var i = 0; i < results.length; i ++){
							var result = results[i];
							str += "<label class='checkbox-inline' style='margin-left: 10px;padding-top: 7px;'><input class='bootstrap_input_radio' type='checkbox' name='"+This.checkbox.attr("name")+"' id='"+This.checkbox.attr("id")+"' value='"+result.item_value+"'";
							if (("," + This.checkbox.attr("defaultValue") + ",").indexOf("," + result.item_value + ",") > -1){
								str += " checked='checked' ";
							}
							str += ">" + result.item_name + "</input></label>";
						}
					}
					This.checkbox.html(str);
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
	Checkbox.prototype.destroy = function() {
		this.frameService.destroy();
	};
	
	// 暴露对外的接口
	module.exports = Checkbox;
});