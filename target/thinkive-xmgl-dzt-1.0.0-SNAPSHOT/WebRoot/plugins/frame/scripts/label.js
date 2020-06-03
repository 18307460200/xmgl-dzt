/**
 * 百度编辑器的相关操作
 */
define(function(require, exports, module) {
	require("plugins/frame/scripts/labelfield.js");
	mini.ULable = function () {
	    mini.ULable.superclass.constructor.call(this);
	};
	mini.extend(mini.ULable, mini.LabelField, {
	    uiCls: 'mini-ulable',
	    initComponents: function () {
	    	 var targetEl = this.getTargetEl();
	         targetEl.style.padding = 0;
	         $(targetEl).removeClass("mini-textbox-border");
	    	 var textarea = $(this.el).find("textarea");
	    	 textarea.remove();
	    	 this.ulableEl = document.createElement('span');
	         $(this.ulableEl).appendTo(targetEl);
	         var parentObj = $(this.ulableEl).parent();
	         setTimeout(function(){
	        	 var height = targetEl.style.height;
	        	 if(height.replace("px","") > 24){
	        		 parentObj.css("line-height",height);
	        	 }
	         },1);
	    },
	    initULable: function () {
	    },
	    setValue: function (value) {
	    	if($.string.isEmpty(value)){
	    		value = "";
	    	}
	    	this.value = value;
	    	if(this.data && this.data.length > 0){
	    		$(this.ulableEl).text(this.dataMap[this.value]);
	    	}else{
	    		$(this.ulableEl).text(this.value);
	    	}
	    },
	    getValue: function () {
	        return this.value;
	    },
	    setData:function(data){
	    	this.data = data;
	    	this.dataMap = {};
	    	if(this.data && this.data.length > 0){
	    		for(var i = 0; i < data.length; i ++){
	    			var item = data[i];
	    			var valueField = this.getValueField();
	    			var textField = this.getTextField();
	    			var key = item[valueField];
	    			var value = item[textField];
	    			if($.string.isEmpty(value)){
	    	    		value = "";
	    	    	}
	    			this.dataMap[key] = value;
	    		}
	    	}
	    	this.setValue(this.value);
	    },
	    getData:function(){
	    	return this.data || [];
	    },
	    setTextField:function(textField){
	    	this.textField = textField;
	    },
	    getTextField:function(){
	    	return this.textField || "item_name";
	    },
	    setValueField:function(valueField){
	    	this.valueField = valueField;
	    },
	    getValueField:function(){
	    	return this.valueField || "item_value";
	    },
	    doLayout: function() {
	        if (!this.canLayout()) return;
	        mini.ULable.superclass.doLayout.call(this);
	    }
	});
	mini.regClass(mini.ULable, "ULable");
});