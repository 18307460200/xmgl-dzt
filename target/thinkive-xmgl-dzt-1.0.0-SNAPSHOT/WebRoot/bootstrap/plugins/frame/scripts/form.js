/**
 * Form表单的相关操作
 */
define(function(require, exports, module) {
	var CMD = require("bootstrap/plugins/frame/scripts/service/cmd"),
	FrameService = require("bootstrap/plugins/frame/scripts/service/frameService");
	Form.prototype.consts = {containsType : "input,textarea,select,img,div", filterAttr : "button", filterSelect : "select,mulSelect", filterCheckbox:"checkbox,radiobox"};
	
	/**
	 * 构造函数
	 * 
	 * @param formId:表单容器的id值
	 * @returns {Form}
	 */
	function Form(formId, formConfig) { 
		// 网络通信层
		this.frameService = FrameService.getInstance();
		// jQuery对象Form
		this.form = $("#" + formId); 
		this.formIds = [formId];
		// Form组件的ID
		this.formId = formId;
		// Form的配置信息
		this.formConfig = formConfig; 
		// 关联所有的业务功能按钮组
		this.toggleGroup = this.form.find("button[type='button']");
		//按钮的配置
		this.toggleMap = {};
		var toggleConfig = this.formConfig["toolbar"];
		if(toggleConfig){
			for(var i = 0; i < toggleConfig.length; i ++){
				var toggle = toggleConfig[i];
				if(toggle.tagId){
					this.toggleMap[toggle.tagId] = toggle;
				}
			}
		}
	}

	/**
	 * 扩展formId
	 */
	Form.prototype.extendForm = function(formId){
		var index = -1;
		for(var i = 0; i < this.formIds.length; i ++){
		   if(this.formIds[i] == formId){
			  index = i;
			  break;
		   }
		}
		if(index == -1){
		   this.formIds.push(formId);
		}
	};

	/**
	 * 初始化信息
	 */
	Form.prototype.loadViewConfig = function() { 
		// 绑定事件
		this.onRegister();

		// 创建表单赋值
		this.createForm(); 
	};

	/**
	 * 创建表单赋值
	 */
	Form.prototype.createForm = function() {
		var This = this;
		var formId = this.formId;
		$("#"+ formId).find(Form.prototype.consts.containsType+",[tagName='checkbox'],[tagName='radiobox'],[tagName='label']").each(function(i){ 
			   var type = $(this).attr("tagName");
			   if(Form.prototype.consts.filterAttr.indexOf(type) == -1){
					 
			        var value = $.string.trim2($(this).attr("defaultValue"));
			        
			        if($.string.isNotEmpty(value)){
			        	This.setFormElemValue($(this),value);
			        }
			   }
		}); 
		if (this.formConfig["initFunc"]) {
			eval(this.formConfig["initFunc"] + "()");
		}
		var param = {};
		if (this.formConfig["isLoad"] != "false") {
			this.initLoadData(param);
		}
	}

	/**
	 * Form表单注册事件监听
	 */
	Form.prototype.onRegister = function() {
		var This = this;
		// 绑定工具栏按钮上的事件
		if (this.toggleGroup) {
			var processClickButtonFunc = $.bindFunc(this.processClickButtonFunc, this);
			this.toggleGroup.each(function(i) {
				$(this).attr("index", i);
				// 对当前对象绑定事件
				var tagId = $(this).attr("id");
				if($.string.isNotEmpty(tagId)){
					$(this).bindEvent(processClickButtonFunc);
				}
			});
		}
	};
	
	/**
	 * 点击业务按钮
	 */
	Form.prototype.processClickButtonFunc = function(e) {
		var button = $(e.currentTarget); 
		var tagId = button.attr("id");
		var toggle = this.toggleMap[tagId];
		if(toggle){
			this.processAction(toggle);
		}
	};

	/**
	 * 处理相关用户点击动作函数
	 * 
	 * @param config
	 * @param records
	 */
	Form.prototype.processAction = function(config) {
		var This = this;
		var formParam = This.getReqParam(); 
		var isValid = config["isValid"] == "true";
		if(isValid){
			if(!This.validate()){
				return;
			} 
		}
		var isAlert = config["isAlert"] == "true";
		var alertMsg = config["alertMsg"] || "是否确认操作？";
		var isClose = config["isClose"] == "true"; 
		var target = config["target"]; //关联的表格ID 
		var func = config["function"]; 
		var doAction = function() {
			if ($.string.isNotEmpty(func)) { 
				if (func == "reset") {
					This.reset();
				} else {
					var reqParam = {};
					var ginputs = This.formConfig["inputs"];
					if ($.string.isNotEmpty(ginputs)) {
						ginputs = eval("({" + ginputs + "})");
						for ( var key in ginputs) {
							var value = ginputs[key]+"";
							if ($.string.isEmpty(value)) {
								value = formParam[key];
								if ($.string.isEmpty(value)) {
									value = This.urlParam[key];
								}
							}else{
								value = value.replace(/\$(.*?)\$/g,
										function(p0, p1, p2) {
									       var v = formParam[p1];
									       if ($.string.isEmpty(v)) {
									    	   v = This.urlParam[p1];
									       }
										   return v;
										});
							}
							if ($.string.isEmpty(value)) {
								value = "";
							}
							reqParam[key] = value;
						}
					}
					var inputs = config.inputs;
					if(func != "popWindow"  || $.string.isEmpty(inputs)){
						$.copyObjToObj(formParam, reqParam);
					}
					if($.string.isNotEmpty(inputs)){
						inputs = eval("({" + inputs + "})");
						for ( var key in inputs) {
							var value = inputs[key]+"";
							if ($.string.isEmpty(value)) {
								value = formParam[key];
								if ($.string.isEmpty(value)) {
									value = This.urlParam[key];
								}
							}else{
								value = value.replace(/\$(.*?)\$/g,
										function(p0, p1, p2) {
									       var v = formParam[p1];
									       if ($.string.isEmpty(v)) {
									    	   v = This.urlParam[p1];
									       }
										   return v;
										});
							}
							if ($.string.isEmpty(value)) {
								value = "";
							}
							reqParam[key] = value;
						}
					}
					var paramFunc = config["paramFunc"];
					if (paramFunc) {
						var param = eval(paramFunc + "()");
						$.copyObjToObj(param, reqParam);
					}
					var callbackFunc = config["callbackFunc"];
					if (func == "query") {
						if (callbackFunc) {
							eval(callbackFunc + "()");
						}else{
							if(target){
								var dataGrid = $.tkui[target];
								if(dataGrid){
									dataGrid.refresh();
								}
							}
						}
					}else if (func == "submit") {
						var eventNo = config["eventNo"];
						var rightId = config["rightId"];
						var isAysnc = config["isAysnc"] != "false";
						var url = config["url"]; 
						var processSubmitComplete = function(resultVo) {
							if (resultVo.getErrorNo() == 0) { 
								if (callbackFunc) {
									eval(callbackFunc + "("+$.jsonToStr(resultVo.obj)+")");
								}else{
									if(target){
										var dataGrid = $.tkui[target];
										if(dataGrid){
											dataGrid.refresh();
										}
									}
								} 
								var id = window.top.$(".modal-dialog").parent().attr("id");
								window.top.$("#"+id).modal("hide");
								
							}else{
								if (callbackFunc) {
									eval(callbackFunc + "("+$.jsonToStr(resultVo.obj)+")");
								}else{
									if(target){
										var dataGrid = $.tkui[target];
										if(dataGrid){
											dataGrid.refresh();
										}
									}
								} 
							}
							if (!callbackFunc){
								var errorInfo = resultVo.getErrorInfo();
								if ($.string.isNotEmpty(errorInfo)) {
									alert(errorInfo);
								}
							}
						};
						if($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)){
							This.frameService.processSubmit(processSubmitComplete,
									eventNo, reqParam, rightId, null, isAysnc,url);
						}
					}else {
						eval(func + "(" + $.jsonToStr(reqParam) + ")");
					}
				}
			}else{
				 if (isClose) {
					This.frameService.closeWindow("ok");
				}
			}
		};
		if (isAlert) {
			window.top.Ewin.confirm({ msg: alertMsg }).on(function (e) {
				if (!e) {
					return;
				}
				doAction();
			});
		} else {
			doAction();
		}
	};

	/**
	 * 处理参数
	 */
	Form.prototype.processReqParam = function(){
		for(var i = 0; i < this.formIds.length; i ++){
			$("[route='" + this.formIds[i] + "']").find("iframe[tagName='webEditor']").each(function(j){
				var linkId = $(this).attr("link");
				var iframe = $(this)[0];
				var value = iframe.contentWindow.document.getElementById("eWebEditor").contentWindow.document.body.innerHTML;
				var host = (window.location.protocol + "//" + window.location.host);
				value = $.string.replaceAll(value,host,"");
				
				$("#" + linkId).val(value);
			});
			
		}
	};

	/**
	 * 表单组件赋值
	 * @param {} formElem
	 * @param {} value
	 */
	Form.prototype.setFormElemValue = function(formElem,value){
		if(typeof(formElem) == "string"){
			formElem = $(formElem);
		}
		var type = formElem.attr("tagName");
		if(formElem.attr("type") == "radio" || formElem.attr("type") == "checkbox"){
			value = ("," + value + ",");
			if(value.indexOf("," + formElem.val() + ",") > -1){
				formElem.attr("checked",true);
			}else{
				formElem.attr("checked",false);
			}
		}else if(type == "label"){
	        formElem.text(value);
	        //formElem.val(value);
	    }else if(type == "img"){
	        formElem.attr("src",value);
	    }else if(type == "input"){//使重置搜索弹框有效
	    	formElem.val(value);
			return;
	    }else if(type=="select"){
	    	formElem.val(value).trigger("change");
	    }else if(type == "date"){//日期控件
	    	var id = formElem.attr("id");
        	$("#"+id).setDate(value);
	    }else if(type == "ueditor"){
			formElem.val(value);
			formElem.attr("defalutValue",value); 
			var id = $("#"+formElem.attr("id")).children().attr("id");
			var ueditor = $.tkui[id];
        	ueditor.setContent(value); 
		}else if(type == "editor"){
			formElem.val(value);
			formElem.attr("defalutValue",value);
			var editorid = formElem.attr("id")+"_editor";
			var iframe = $("#"+editorid)[0];
			if($.string.isNotEmpty(iframe)){ 
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
		}else if(type == "upload"){
			formElem.attr("file_value",value); 
		}else {
			formElem.val(value);
		}
		formElem.attr("defaultValue",value);
	};
	 
	/**
	 * 得到form表单组件的值
	 * @param {} formElem
	 */
	Form.prototype.getFormElemValue = function(formElem){
		var value = "";
		var type = formElem.attr("tagName");
		if(formElem.attr("type") == "radio" || formElem.attr("type") == "checkbox"){
			 if(formElem.attr("checked")){
				 value = formElem.val(); 	  
			 }
		}else if(type == "label"){
			value = formElem.text();
		}else if(type == "img"){
			value = formElem.attr("src");
		}else if(type == "upload"){
			value = formElem.attr("file_value"); 
		}else if(type == "ueditor"){
			var id = $("#"+formElem.attr("id")).children().attr("id");
			value = $.tkui[id].getContent();
			var host = (window.location.protocol + "//" + window.location.host);
			value = $.string.replaceAll(value,host,"");
		}else{
			value = formElem.val();
		}
		return $.string.trim2(value);
	};

	 /**
	 * 获取表单初始化执行的eventNo
	 */
	Form.prototype.getEventNo = function(){
	    return $("#"+this.formId).attr("eventNo");
	};
	
	/**
	 * 获取表单是否异步初始化
	 */
	Form.prototype.isAsync=function(){
	    var isAsy =  $("#"+this.formId).attr("isAsync");
		if($.string.isEmpty(isAsy)){
			isAsy = "1";
	    }
		return (isAsy == "1");
	};
	  
	/**
	 * 初始化异步加载form表单的数据，多个form表单，只是初始化向服务器发送一次请求，剩下的form表单执行填充操作
	 * @return
	 */
	Form.prototype.initLoadData = function(param){
		var This = this;
		var url = this.formConfig["url"];
		var eventNo = this.formConfig["eventNo"];
		var isAsync = this.formConfig["isAsync"] != "false";
		var rightId = this.formConfig["rightId"];
		if($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)){
			var reqParam = {};
			var inputs = this.formConfig["inputs"];
			if ($.string.isNotEmpty(inputs)) {
				inputs = eval("({" + inputs + "})");
				var formData = this.miniForm.getData(true, false);
				for ( var key in inputs) {
					var value = inputs[key]+"";
					if ($.string.isEmpty(value)){
						if (formData) {
							value = formData[key];
						}
						if ($.string.isEmpty(value)) {
							value = This.urlParam[key];
						}
					}else{
						value = value.replace(/\$(.*?)\$/g,
								function(p0, p1, p2) {
							       var v = "";
							       if (formData) {
									   v = formData[p1];
								   }
							       if ($.string.isEmpty(v)) {
							    	   v = This.urlParam[p1];
							       }
								   return v;
								});
					}
					if ($.string.isEmpty(value)) {
						value = "";
					}
					reqParam[key] = value;
				}
			}
			if (this.formConfig["paramFunc"]) {
				var funcParam = eval(this.formConfig["paramFunc"] + "()");
				if (funcParam) {
					$.copyObjToObj(funcParam, reqParam);
				}
			}
			if (param) {
				$.copyObjToObj(param, reqParam);
			}
			var queryDataComplete = function(resultVo) {
				if (resultVo.getErrorNo() == 0) {
					var result = resultVo.getResults();
					if(result.hasOwnProperty('totalRows')){
						var data = result.data;
						if(data && data.length > 0){
							result = data[0];
						}else{
							result = {};
						}
					}
					This.setFormInitData(result);
					
					if (This.formConfig["loadDataCallBackFunc"]) {
						eval(This.formConfig["loadDataCallBackFunc"] + "("+$.jsonToStr(result)+")");
					}
				} else {
					var errorInfo = resultVo.getErrorInfo();
					if ($.string.isNotEmpty(errorInfo)) {
						window.top.Ewin.alert(errorInfo);
					}
				}
			};
			this.frameService.processQueryList(queryDataComplete, eventNo,
					reqParam, rightId,isAsync,url,false);
		}
	};

	/**
	 * 填充初始化Form表单的数据
	 */
	Form.prototype.setFormInitData = function(initData,flag){
		var This = this;
		var formId = This.formId;
		This.initData = initData;
		if(This.initData){
			$("#" + formId ).find(Form.prototype.consts.containsType).each(function(i){
				var type = $(this).attr("tagName");
				var displaytype = $.trim($(this).attr("type"));
				if(Form.prototype.consts.filterAttr.indexOf(type) == -1){
					var name = $(this).attr("name");
					if($.string.isNotEmpty(name)){
						var value =  initData[name];
					    value = $.string.trim2(value);
					    value = htmlDecode(value);
						if($.string.isNotEmpty(value)){
							//解决多选
							var This1 = $("#"+name+"1");
							if(flag&&This1[0]){
								This.setFormElemValue(This1,value.replace(/\'/g,''));
							}
							This.setFormElemValue($(this),value);
						}
					}
				}
			});
			$("#" + formId).find("[tagName='label']").each(function(i){
				 var name = $(this).attr("name");
				 if($.string.isNotEmpty(name)){
					 var value = initData[name];
					 if($.string.isNotEmpty(value)){
						 This.setFormElemValue($(this),value);
					 }
				 }
			});
		}
	};

	/**
	 * 获取Form表单提交的数据
	 */
	Form.prototype.getReqParam = function(){ 
		//处理ewebeditor编辑器的值
		this.processReqParam();
		var This = this;
		var reqParam = {};
		for(var i = 0; i < this.formIds.length; i++){
			/*$("#" + this.formId).find(Form.prototype.consts.containsType).each(function(j){
				var type = $(this).attr("tagName");
				var displaytype = $(this).attr("type");
				if(Form.prototype.consts.filterAttr.indexOf(type) == -1){
					var name = $(this).attr("name");
					if($.string.isNotEmpty(name)){
						var value = $.trim(This.getFormElemValue($(this)));
						var temp = reqParam[name];
						if(Form.prototype.consts.filterCheckbox.indexOf(displaytype) == -1 || (Form.prototype.consts.filterCheckbox.indexOf(displaytype) != -1 && $(this).attr("checked"))){
							if(Form.prototype.consts.filterCheckbox.indexOf(displaytype) != -1){
								value = $.string.replaceAll(value,",","$@#");
							}
							if ($.string.isNotEmpty(temp)) {
								if($.string.isNotEmpty(value)){
									reqParam[name] = (temp + "," + value);
								}
							}else{
								reqParam[name] = value;
							}
						}
					}
				}
		   });*/
		   $("#" + this.formId).find("[tagName='input'],[tagName='radiobox'],[tagName='checkbox'],[tagName='select'],[tagName='textarea'],[tagName='upload'],[tagName='ueditor'],[tagName='editor']").each(function(j){
			   var name = $(this).attr("name");
			   if($.string.isNotEmpty(name)){
				   var value = $.trim(This.getFormElemValue($(this)));
				   reqParam[name] = value;
			   }
		   });
		}
		return reqParam;
	}; 

	/**
	 * 验证表单
	 */
	Form.prototype.validate = function(){
		var alertMsg = "";
		for(var i = 0; i < this.formIds.length; i++){
			$("#" + this.formId).find("iframe[tagName='webEditor']").each(function(j){
				var linkId = $(this).attr("link");
				var iframe = $(this)[0];
				var value = iframe.contentWindow.document.getElementById("eWebEditor").contentWindow.document.body.innerHTML;
				var host = (window.location.protocol + "//" + window.location.host);
				value = $.string.replaceAll(value,host,"");
				$("#" + linkId).val(value);
			});
			$("#" + this.formId).children().find(Form.prototype.consts.containsType).each(function(j){
				var type = $(this).attr("tagName");
				var vtype = $(this).attr("vtype");
				var nullAble =  $(this).attr("nullAble");
				if(Form.prototype.consts.filterAttr.indexOf(type) == -1) {
					var label = $(this).attr("label");
					if(label){
						label = label.replace(":","");
					    label = label.replace("：","");
					}
					var value = $(this).attr("value");
					if($.string.isNotEmpty(vtype)){
						if(vtype == "equals"){//判断相等操作
							var name2 = $(this).attr("conditionId");
							var formobj = $(this).parents("div[tagname='form']");
							var value2 = formobj.find("input[id=" + name2 + "]").val();
							var label2 = formobj.find("input[id=" + name2 + "]").attr("label");
							if($.string.isNotEmpty(value2)){
								alertMsg += $.checkStrEquals(label,value,label2,value2);
							}
						}else if(vtype == "strongPwd"){
							if(value.length < 8 ){
								alertMsg +="【" + label + "】 的长度不能小于8位！<br>";
							}
							var weight = $.string.passwordStrength(value);
							if(weight == "0"){
								alertMsg +="【" + label + "】 密码强度太弱，建议使用数字+大小写字母+特殊字符组合！<br>";
							}
						}else if(vtype == "maxLength"){ 
							var maxlength = value.length;
							if(maxlength > 3000){
								alertMsg +="【" + label + "】 长度不能超过3000！<br>";
							}
						}else{
							var tempStr = "";
							if(nullAble == "0"){
								tempStr = $(this).checkValid (label, "NotEmpty");
							}
							if($.string.isEmpty(tempStr)){
								 if($.string.isNotEmpty(value)){
									 if((""+vtype).length>10&&vtype.substr(0,7)=="Number("){
										 var a = vtype.indexOf(",");
										 var precision = vtype.substring(7,a);
										 var scale = vtype.substr(a+1,1);
										 alertMsg += $(this).checkValid(label,"Number",null,precision,scale);
									 }else{
									     alertMsg += $(this).checkValid(label, vtype);
									 }
							     }
							}else{
								alertMsg += tempStr;
							}
						}
					}
				}
			});
		}
		if($.string.isNotEmpty(alertMsg)){
			window.top.Ewin.alert(alertMsg);
			return false;
		}else{
			return true;
		}
	};

	/**
	 * 重置
	 */
	Form.prototype.reset = function(){
		var This = this;
		for(var i = 0; i < this.formIds.length; i++){
			$("#"+this.formId ).find(Form.prototype.consts.containsType+",[tagName='checkbox'],[tagName='radiobox'],[tagName='label']").each(function(j){
				var type = $(this).attr("tagName");
				var defaultValue = $(this).attr("defaultValue");
				if($.string.isNotEmpty(type)){
					if(Form.prototype.consts.filterAttr.indexOf(type) == -1) {
						var type1 = $(this).attr("type");
						if(Form.prototype.consts.filterAttr.indexOf(type1) == -1){ 
							This.setFormElemValue($(this),defaultValue);
						}
					} 
					if(Form.prototype.consts.filterCheckbox.indexOf(type) != -1){
						var checkbox_id = $(this).attr("id");
						$("#"+checkbox_id ).find("[type='checkbox'],[type='radio']").each(function(m){
							This.setFormElemValue($(this),defaultValue);
						});
					}
				}
			});
		}
	};

	/**
	 * 转义
	 */
	function htmlDecode(str){
		 if (str == null) {
			 return '';
		 }
		 return String(str).
			replace(/&amp;/g, '&').
			replace(/&lt;/g, '<').
			replace(/&gt;/g, '>').
			replace(/&quot;/g, '"').
			replace(/&#039;/g, "'").
			replace(/&nbsp;/g, " ");
	}
 
	
	/**
	 * 销毁
	 */
	Form.prototype.destroy = function() {
		this.frameService.destroy();
	};

	window.Form = Form;
	
	// 暴露对外的接口
	module.exports = Form;
});