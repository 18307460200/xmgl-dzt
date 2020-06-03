/**
 * 百度编辑器的相关操作
 */
define(function(require, exports, module) {
	var UE = require("uewebeditor");
	require("plugins/ueditor/lang/zh-cn/zh-cn.js");
	require("plugins/frame/scripts/labelfield.js");
	var UEMap = {};
	
	mini.UEditor = function () {
	    mini.UEditor.superclass.constructor.call(this);
	};
	mini.extend(mini.UEditor, mini.LabelField, {
	    uiCls: 'mini-ueditor',
	    initComponents: function () {
	    	 var el = document.createElement('div');
	         var targetEl = this.getTargetEl();
	         targetEl.style.padding = 0;
	         $(el).appendTo(targetEl);
	         this.ueditorEl = el;
	         var me = this;
	         setTimeout(function () {
	             me.initUEditor();
	         }, 1);
	    },
	    initUEditor: function () {
	    	var textarea = $(this.el).find("textarea");
	    	var id = this.id;
	    	var name = textarea.attr("name");
	    	textarea.remove();
	        this.ueditorId = "uedior_"+id;
	        var script = $("<script type='text/plain' style='border:0' id='"+this.ueditorId+"'>");
	        var targetEl = this.getTargetEl();
	        var h = mini.getHeight(targetEl);
	        var w = mini.getWidth(targetEl);
	        script.width(w);
	        script.height(h - 105);
	        script.appendTo(this.ueditorEl);
			if (window.UE && UEMap[this.ueditorId]) {
				UE.getEditor(this.ueditorId).destroy();
			}
			UEMap[this.ueditorId] = this.ueditorId;
	    	this.ueditor = UE.getEditor(this.ueditorId, {
				autoHeightEnabled : false
	    	});
	    	this.setValue(this.value);
	    },
	    setValue: function (value) {
	    	if($.string.isEmpty(value)){
	    		value = "";
	    	}
			var ueditorId = this.ueditorId;
			window[ueditorId] = this.ueditor;
			setTimeout(function() {
					if (window[ueditorId]) { 
						window[ueditorId].setContent(value);
					}
			}, 800);
			this.value = value;
	    },
	    getValue: function () {
	    	if(this.ueditor){
				var value  = this.ueditor.getContent();
				var host = (window.location.protocol + "//" + window.location.host);
				value = $.string.replaceAll(value,host,"");
	    		return value;
	    	}
	        return this.value;
	    },
	    doLayout: function() {
	        if (!this.canLayout()) return;
	        mini.UEditor.superclass.doLayout.call(this);
	        var This = this;
	        var targetEl = This.getTargetEl();
	        var h = mini.getHeight(targetEl);
	        var w = mini.getWidth(targetEl);
	        setTimeout(function () {
	        	 $("#"+This.ueditorId).width(w);
	        	 $("#"+This.ueditorId).height(h);
           	     $("#"+This.ueditorId).find(".edui-editor").width(w);
           	     //$("#"+This.ueditorId).find(".edui-editor").height(h - 105);
           	     $("#"+This.ueditorId).find(".edui-editor").css("border","0");
           	     $("#"+This.ueditorId).find(".edui-editor-iframeholder").width(w);
           	     var toolHeight = $("#"+This.ueditorId).find(".edui-editor-toolbarboxinner").outerHeight(true);
           	     toolHeight += 15; 
           	     var buttonHeight = $("#"+This.ueditorId).find(".edui-editor-bottomContainer").outerHeight(true);
           	     $("#"+This.ueditorId).find(".edui-editor-iframeholder").height(h - toolHeight - buttonHeight + 10);
           }, 800);
	    }
	});
	mini.regClass(mini.UEditor, "UEditor");
});