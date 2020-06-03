/**
 * 文本编辑器的相关操作
 */
define(function(require, exports, module) {
	var EWEBEDITOR = require("ewebeditor");
	
	mini.Editor = function () {
	    mini.Editor.superclass.constructor.call(this);
	};
	mini.extend(mini.Editor, mini.LabelField, {
	    uiCls: 'mini-editor',
	    initComponents: function () {
	    	 var el = document.createElement('div');
	         var targetEl = this.getTargetEl();
	         targetEl.style.padding = 0;
	         $(el).appendTo(targetEl);
			 $(el).addClass("bj_iframe");
			 this.eidtorId = this.id + "_editor_div";
			 $(el).attr("id",this.eidtorId);
	         this.editorEl = el;
	         var me = this;
	         setTimeout(function () {
	             me.initEditor();
	         }, 1);
	    },
	    initEditor: function () {
	    	var textarea = $(this.el).find("textarea");
	    	var name = textarea.attr("name");
	    	textarea.remove();
			var targetEl = this.getTargetEl();
	        var height = mini.getHeight(targetEl);
	        var width = mini.getWidth(targetEl);
			this.editorConfig = {};
		    this.editorConfig["style"] = this.inputStyle || "standard650";
		    this.editorConfig["id"] = this.id + "_editor";
		    this.editorConfig["height"] = height || "500px";
		    this.editorConfig["width"] = width || "700px";
            $(this.editorEl).hide();
			if(window.EWEBEDITOR){
				 var editorInstance = window.EWEBEDITOR.Instances; 
				 var tempEditor = editorInstance[this.eidtorId];
				 if(tempEditor){
					 tempEditor.Remove();
					 delete editorInstance[this.eidtorId];
				 }
			 }
		     this.editor = EWEBEDITOR.Append(this.eidtorId, this.editorConfig);
		     this.editor.IframeId = this.id + "_editor";
		     $(this.editorEl).find("iframe").attr("id",this.id + "_editor");
		     $(this.editorEl).find("iframe").attr("link",this.id);
		     $(this.editorEl).find("iframe").attr("tagName","webEditor");
		     $(this.editorEl).show();
	         $(this.editorEl).width(width);
	         $(this.editorEl).height(height - 105);
	    	 this.setValue(this.value);
	    },
	    setValue: function (value) {
	    	if($.string.isEmpty(value)){
	    		value = "";
	    	}
			var eidtorId = this.eidtorId;
            window[eidtorId] = $(this.editorEl);
			setTimeout(function() {
				var editorEl = window[eidtorId];
				if(editorEl){
                    var iframe = editorEl.find("iframe")[0];
					if(iframe.contentWindow.document.getElementById("eWebEditor")){
						 iframe.contentWindow.document.getElementById("eWebEditor").contentWindow.document.body.innerHTML = value;
					}else{
						if (iframe.attachEvent){
							iframe.attachEvent("onload", function(){
								iframe.contentWindow.document.getElementById("eWebEditor").contentWindow.document.body.innerHTML = value;
							});
						} else {
							iframe.onload = function(){
								iframe.contentWindow.document.getElementById("eWebEditor").contentWindow.document.body.innerHTML = value;
							};
						}
					}
				}
			}, 800);
			this.value = value;
	    },
	    getValue: function () {
            var iframe = $(this.editorEl).find("iframe")[0];
			var host = (window.location.protocol + "//" + window.location.host);
			if(iframe){
               return $.string.replaceAll(iframe.contentWindow.document.getElementById("eWebEditor").contentWindow.document.body.innerHTML,host,"");
			} 
	        return  $.string.replaceAll(this.value,host,"");
	    },
	    doLayout: function() {
	        if (!this.canLayout()) return;
	        mini.Editor.superclass.doLayout.call(this);
	        var This = this;
	        var targetEl = This.getTargetEl();
	        var h = mini.getHeight(targetEl);
	        var w = mini.getWidth(targetEl);
	        setTimeout(function () {
           	     $("#"+This.editorId).find("iframe").width(w);
           	     $("#"+This.editorId).find("iframe").css("border","0");
           }, 500);
	    }
	});
	mini.regClass(mini.Editor, "Editor");
});