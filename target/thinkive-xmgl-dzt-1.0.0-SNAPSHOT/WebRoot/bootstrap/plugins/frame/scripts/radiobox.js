/**
 * RadioBox单选按钮的相关操作
 */
define(function(require, exports, module) {
	var CMD = require("bootstrap/plugins/frame/scripts/service/cmd"),
    FrameService = require("bootstrap/plugins/frame/scripts/service/frameService");
	/**
	 * 构造函数
	 * 参数：radioBoxId：单选按钮组件的容器routeid
	 */
	function RadioBox(radioBoxId){
		this.radioBox = $("#"+radioBoxId+"");
		this.isAsync = this.radioBox.attr("isAsync");
		if($.string.isEmpty(this.isAsync)){
			this.isAsync = "1";
		}
		this.isAsync = (this.isAsync == "1");
		this.isLoad = this.radioBox.attr("isLoad");
		this.frameService = FrameService.getInstance(); 
	};
	
	/**
	 * 是否异步
	 */
	RadioBox.prototype.setIsAsync = function(isAsync){
		this.isAsync = isAsync;
	};
	
	/**
	 * 初始化界面
	 */
	RadioBox.prototype.loadViewConfig = function(){
		if(this.isLoad != "0"){
			var dictId = this.radioBox.attr("format");
			var inputs = this.radioBox.attr("inputs");
			if($.string.isNotEmpty(inputs)){
				inputs = eval("({"+inputs+"})");
			}
			var This = this;
			var queryDictsComplete = function(resultVo){ 
				if(resultVo.getErrorNo() == 0){
					var str = "";
					var results = resultVo.getResults(); 
					results = results[This.radioBox.attr("format")]; 
					if(results && results.length > 0){
						results = $.strToJson(results);
						for(var i = 0; i < results.length; i ++){
							var result = results[i];
							str += "<label class='radio-inline' style='margin-left: 10px;padding-top: 7px;'><input class='bootstrap_input_radio' type='radio' name='"+This.radioBox.attr("name")+"' id='"+This.radioBox.attr("id")+"' value='"+result.item_value+"'";
							//str += "<input type='radio' name='"+This.radioBox.attr("name")+"' id='"+This.radioBox.attr("id")+"' value='"+result.value+"' extend='"+result.extend+"'";
							if (("," + This.radioBox.attr("defaultValue") + ",").indexOf("," + result.item_value + ",") > -1){
								str += " checked='checked' ";
							}
							str += ">" + result.item_name + "</input></label>";
						}
					}
					This.radioBox.html(str);
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
	RadioBox.prototype.destroy = function() {
		this.frameService.destroy();
	};
	
	// 暴露对外的接口
	module.exports = RadioBox;
});

