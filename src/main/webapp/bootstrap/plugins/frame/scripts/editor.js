/**
 * 文本编辑器的相关操作
 */
define(function(require, exports, module) {
    var EWEBEDITOR = require("ewebeditor");
      
	/**
	 * 构造函数
	 * 参数：editorId：日期组建的容器routeid
	 */
	function Editor(editorId,editorConfig){
		this.editorBox = $("#"+editorId).parent();
		this.input = $("#" + editorId);
		this.editorConfig = editorConfig || {};
		this.editorConfig["style"] = editorConfig["style"] || "standard650";
		this.editorConfig["id"] = this.input.attr("id");
		this.editor = null;
	};
	
	/**
	 * 初始化界面
	 */
	Editor.prototype.loadViewConfig = function(){
		this.editorBox.hide();
		var eidtorId = this.editorConfig["id"];
		if(window.EWEBEDITOR){
			 var editorInstance = window.EWEBEDITOR.Instances;
			 var tempEditor = editorInstance[eidtorId + "_editor_div"];
			 if(tempEditor){
			 	 tempEditor.Remove();
			 	 delete editorInstance[eidtorId + "_editor_div"];
			 }
		 }
		this.editor = EWEBEDITOR.Append(eidtorId + "_editor_div", this.editorConfig);

		this.editor.IframeId = eidtorId + "_editor";
		this.editorBox.find("iframe").attr("id",eidtorId + "_editor");
		this.editorBox.find("iframe").attr("link",eidtorId);
		this.editorBox.find("iframe").attr("tagName","webEditor");
		this.editorBox.show();
	};
		
	/**
	 * 释放内存工作
	 */
	Editor.prototype.destroy = function() {
		if(this.editor){
			this.editor.Remove();
			if(window.EWEBEDITOR){
				var eidtorId = this.editorConfig["id"];
				var editorInstance = window.EWEBEDITOR.Instances;
			    delete editorInstance[eidtorId + "_editor_div"];
			}
			this.editor = null;
		}
	};
	
	// 暴露对外的接口
	module.exports = Editor;
});