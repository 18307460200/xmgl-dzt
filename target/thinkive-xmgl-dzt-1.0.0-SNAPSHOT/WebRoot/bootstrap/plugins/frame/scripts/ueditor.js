/**
 * 百度编辑器的相关操作
 */
define(function(require, exports, module) {
	//require("/plugins/ueditor/ueditor.config.js");
    var UE = require("uewebeditor");
    require("/bootstrap/plugins/ueditor/lang/zh-cn/zh-cn.js");
	var UEMap = {};

	/**
	 * 构造函数
	 * 参数：editorId：日期组建的容器routeid
	 */
	function UEditor(ueditorId,ueditorConfig){
		this.ueditorConfig = ueditorConfig || {};
		this.ueditor = null;
	};
	
	/**
	 * 初始化界面
	 */
	UEditor.prototype.loadViewConfig = function(){
		var ueidtorId = this.ueditorConfig["id"];
		if(window.UE && UEMap[ueidtorId]){
			UE.getEditor(ueidtorId).destroy();
			//$(ueidtorId).xheditor();
			//$("#"+ueidtorId).remove();
		}else{
             UEMap[ueidtorId] = ueidtorId;
		}
		this.ueditor = UE.getEditor(ueidtorId,{
			autoHeightEnabled:false
		});
	};
		
	/**
	* 设置内容
	*/
    UEditor.prototype.setContent = function(content){
		var This = this; 
		setTimeout(function(){
			This.ueditor.setContent(content);
		},800);
		
	}

   /**
	* 获取内容
	*/
   UEditor.prototype.getContent = function(){ 
		return this.ueditor.getContent();
	}

	/**
	 * 释放内存工作
	 */
	UEditor.prototype.destroy = function() {
		if(this.ueditor){
			this.editor.Remove();
			if(window.EWEBEDITOR){
				var eidtorId = this.editorConfig["id"];
				var editorInstance = window.EWEBEDITOR.Instances;
			    delete editorInstance[eidtorId + "_editor_div"];
			}
			this.ueditor = null;
		}
	};

	// 暴露对外的接口
	module.exports = UEditor;
});