/**
 * 百度编辑器的相关操作
 */
define(function(require, exports, module) {
	require("plugins/codemirror/lib/codemirror.css");
	require("plugins/codemirror/addon/display/fullscreen.css");
	require("plugins/codemirror/theme/material.css");
//	require("plugins/codemirror/lib/codemirror.js");
//	require("plugins/codemirror/mode/javascript/javascript.js");
//	require("plugins/codemirror/mode/css/css.js");
//	require("plugins/codemirror/mode/xml/xml.js");
//	require("plugins/codemirror/mode/htmlmixed/htmlmixed.js");
//	require("plugins/codemirror/addon/display/fullscreen.js");
	
	/**
	 * 构造函数
	 */
	function CEditor(ceditorId, ceditorConfig) {
		mini.parse();
		this.ceditorConfig = ceditorConfig || {};
		this.editorDiv = $("#"+ceditorId);
		this.miniText = mini.get(this.editorDiv.find(".mini-textarea").attr("id"));
		this.editor = null;
		this.theme = this.ceditorConfig["theme"] || "default";
		this.isVisible = this.editorDiv.find(".mini-textarea").is(":visible");
	};

	/**
	 * 初始化界面
	 */
	CEditor.prototype.loadViewConfig = function() {
		var This = this;
		require.async("plugins/codemirror/lib/codemirror.js",function(){
			var jsAndCss = [];
			jsAndCss.push("plugins/codemirror/mode/javascript/javascript.js");
			jsAndCss.push("plugins/codemirror/mode/css/css.js");
			jsAndCss.push("plugins/codemirror/mode/xml/xml.js");
			jsAndCss.push("plugins/codemirror/mode/htmlmixed/htmlmixed.js");
			jsAndCss.push("plugins/codemirror/addon/display/fullscreen.js");
			require.async(jsAndCss, function() {
				This.editor = CodeMirror.fromTextArea(This.editorDiv.find(".mini-textbox-input").get(0), {
					mode: "htmlmixed",
					lineNumbers: true,
					extraKeys: {
						"F11": function(cm) {
						   cm.setOption("fullScreen", !cm.getOption("fullScreen"));
					     },
					    "Esc": function(cm) {
					       if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
					     }
					}
				});
				var height = This.editorDiv.css("height");
				This.editorDiv.find(".CodeMirror").css("height",height);
				This.editor.setOption("theme", This.theme);
			});
		});
	};

	/**
	 * 设置内容
	 */
	CEditor.prototype.setContent = function(content) {
		var This = this;
		if($.string.isEmpty(content)){
			content = "";
		}
		setTimeout(function(){
			This.editor.setValue(content);
			This.miniText.setValue(content);
		}, 500);
	};

	/**
	 * 获取内容
	 */
	CEditor.prototype.getContent = function() {
		var value = this.editor.getValue();
		this.miniText.setValue(value);
		//value = encodeURIComponent(value);
		return value;
	};

	/**
	 * 设置显示隐藏
	 * @param visible
	 */
	CEditor.prototype.setVisible = function(visible){
		this.miniText.setVisible(visible);
		if(visible){
			if(!this.isVisible){
				this.isVisible = true;
				this.loadViewConfig();
			}
		}
	};
	
	/**
	 * 重新加载页面
	 */
	CEditor.prototype.refresh = function() {
	};
	
	/**
	 * 释放内存工作
	 */
	CEditor.prototype.destroy = function() {
		this.editor = null;
	};

	window.CEditor = CEditor;
	// 暴露对外的接口
	module.exports = CEditor;
	
});