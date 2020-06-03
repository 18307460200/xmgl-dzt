/**
 * Form表单的相关操作
 */
define(function(require, exports, module) {
	var FrameService = require("plugins/frame/scripts/service/frameService");
	
	/****************自定义miniUI的表单验证规则，全局生效**********************/
	function init(){
		mini.VTypes["englishErrorText"] = "必须输入英文";
	    mini.VTypes["english"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		var re = new RegExp("^[a-zA-Z\_]+$");
		        if (re.test(v)) return true;
		        return false;
	    	}
	    	return true;
	    };
	    mini.VTypes["englishAndNumberErrorText"] = "必须输入英文+数字";
	    mini.VTypes["englishAndNumber"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		return $.string.isEnNumeric(v);
	    	}
	    	return true;
	    };
	    mini.VTypes["chineseErrorText"] = "必须输入中文";
	    mini.VTypes["chinese"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		return $.string.isCnAndEn(v);
	    	}
	    	return true;
	    };
	    mini.VTypes["cnAndEnNumericErrorText"] = "必须输入中文+英文+数字";
	    mini.VTypes["cnAndEnNumeric"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		 return $.string.isCnAndEnNumeric(v);
	    	}
	    	return true;
	    };
	    mini.VTypes["idCardErrorText"] = "必须输入正确的身份证";
	    mini.VTypes["idCard"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		return $.string.isCardID(v);
	    	}
	    	return true;
	    };
	    mini.VTypes["mobileErrorText"] = "必须正确的手机号码";
	    mini.VTypes["mobile"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		 return $.string.isMobile(v);
	    	}
	    	return true;
	    };
	    mini.VTypes["phoneErrorText"] = "必须正确的电话号码";
	    mini.VTypes["phone"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		 return $.string.isPhone(v);
	    	}
	    	return true;
	    };
	    mini.VTypes["telErrorText"] = "必须正确的固定电话";
	    mini.VTypes["tel"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		 return $.string.isTel(v);
	    	}
	    	return true;
	    };
	    mini.VTypes["postalCodeErrorText"] = "必须正确的邮政编码";
	    mini.VTypes["postalCode"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		 return $.string.isPostalCode(v);
	    	}
	    	return true;
	    };
	    mini.VTypes["bankCodeErrorText"] = "必须正确的邮政编码";
	    mini.VTypes["bankCode"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		 return $.string.isBankCode(v);
	    	}
	    	return true;
	    };
	    mini.VTypes["strongPwdErrorText"] = "密码强度太弱，建议使用数字+大小写字母+特殊字符组合";
	    mini.VTypes["strongPwd"] = function (v) {
	    	if($.string.isNotEmpty(v)){
	    		var weight = $.string.passwordStrength(v);
	    		if(weight == 0){
	    			return false;
	    		}
	    	}
	    	return true;
	    };
	}
	init();
	
	/**
	 * 构造函数
	 * 
	 * @param formId:表单容器的route值
	 * @returns {Form}
	 */
	function Form(formId, formConfig) {
		mini.parse();
		// 网络通信层
		this.frameService = FrameService.getInstance();
		// jQuery对象Form
		this.form = $("#" + formId);
		// MiniUI对象Form
		this.miniForm = new mini.Form("#" + formId);
		// Form组件的ID
		this.formId = formId;
		// Form的配置信息
		this.formConfig = formConfig;
		// 浏览器上面的入参
		this.urlParam = mini.getParams() || {};
		// 关联所有的业务功能按钮组
		this.toggleGroup = this.form.find(".mini-button");
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
		//元素配置
		this.formItemMap = {};
		var formItemConfig = this.formConfig["formitem"];
		if(formItemConfig){
			for(var i = 0; i < formItemConfig.length; i ++){
				var formItem = formItemConfig[i];
				if(formItem.tagId){
					this.formItemMap[formItem.tagId] = formItem;
				}
			}
		}
	}

	/**
	 * 初始化信息
	 */
	Form.prototype.loadViewConfig = function() {
		// 绑定事件
		this.onRegister();
		// 创建表单
		this.createForm();
	};
	
	/**
	 * Form表单注册事件监听
	 */
	Form.prototype.onRegister = function() {
		var This = this;
		// 绑定工具栏按钮上的事件
		if (this.toggleGroup) {
			var processClickButtonFunc = $.bindFunc(
					this.processClickButtonFunc, this);
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
	 * 创建表单
	 */
	Form.prototype.createForm = function() {
		var This = this;
		var formfields = This.miniForm.getFields();
		$.each(formfields, function(n, formField) {
			var id = formField.id;
			var formItem = This.formItemMap[id];
			if(formItem){
				var dataType = formItem["dataType"];
				var format = formItem["format"];
				var inputs = formItem["inputs"];
				var url = formItem["url"];
				var isDefaultSelected = formItem["isDefaultSelected"] == "true";
				if ($.string.isNotEmpty(inputs)) {
					inputs = eval("({" + inputs + "})");
				}else{
					inputs = {};
				}
				for(var key in inputs){
					var value = inputs[key]+"";
					if ($.string.isNotEmpty(value)){
						value = value.replace(/\$(.*?)\$/g,
								function(p0, p1, p2) {
								   return This.urlParam[p1];
								});
					}
					if ($.string.isEmpty(value)) {
						value = "";
					}
					inputs[key] = value;
				}
				var paramFunc = formItem["paramFunc"];
				if (paramFunc) {
					var param = eval(paramFunc + "()");
					$.copyObjToObj(param, inputs);
				}
				if(dataType == "url"){
					if($.string.isNotEmpty(format)){
						formField.setValue(This.urlParam[format]);
					}
				}else if(dataType == "select"){
					var textField = formItem["textField"];
					var valueField = formItem["valueField"];
					if($.string.isNotEmpty(textField)){
						formField.setTextField(textField);
					}
					if($.string.isNotEmpty(valueField)){
						formField.setValueField(valueField);
					}
					var queryDictsComplete = function(resultVo) {
						if(resultVo.getErrorNo() == 0){
							var result =  resultVo.getResults();
							var dicList = result[format];
							if(dicList && dicList.length > 0){
								dicList = $.strToJson(dicList);
								formField.setData(dicList);
								if(formField.el.className.indexOf("mini-combobox")!=-1 ){
									if(isDefaultSelected){
										var valueField = formField.getValueField() || "item_value";
										formField.setValue(dicList[0][valueField]);
									}
								}
							}
						}
					};
					This.frameService.queryDicts(inputs, format,
							false, queryDictsComplete);
				}else if(dataType == "event_tree"){
					var queryDataComplete = function(resultVo) {
						if(resultVo.getErrorNo() == 0){
							var dataList = resultVo.getResults();
							var dataListStr = $.jsonToStr(dataList);
							dataListStr = $.string.replaceAll(dataListStr, "isleaf",
									"isLeaf");
							dataList = $.strToJson(dataListStr);
							dataList = This.buildTreeDataList(formField,dataList);
							formField.setData(dataList);
						}
					};
					This.frameService.processQueryList(queryDataComplete, format,
							inputs, format, false,url);
				}else if(dataType == "event_list"){
					var queryDataComplete = function(resultVo) {
						if(resultVo.getErrorNo() == 0){
							var dataList = resultVo.getResults();
							if(dataList && dataList.length > 0){
								var data = dataList[0];
								if(data.hasOwnProperty('totalRows')){
									dataList = data.data;
								}
							}
							formField.addItems(dataList);
						}
					};
					This.frameService.processQueryList(queryDataComplete, format,
							inputs, format, false,url);
				}else if(dataType == "popWindow"){
					formField.on("buttonclick",function(){
						var formParam = This.getReqParam();
						var inputs0 = formItem["inputs"];
						if ($.string.isNotEmpty(inputs0)) {
							inputs0 = eval("({" + inputs0 + "})");
							for(var k in inputs0){
								var v = inputs0[k]+"";
								if($.string.isEmpty(v)){
									if(formParam){
										v = formParam[k];
									}  
									if($.string.isEmpty(v)){
										v = This.urlParam[k];
									}
								}else{
									v = v.replace(/\$(.*?)\$/g,
											function(p0, p1, p2) {
										        var v0 = "";
												if(formParam){
													v0 = formParam[p1];
												}  
												if($.string.isEmpty(v0)){
													v0 = This.urlParam[p1];
												}
												return v0;
											});
								}
								if ($.string.isEmpty(v)) {
									v = "";
								}
								inputs[k] = v;
							}
						}
						if (paramFunc) {
							var param = eval(paramFunc + "()");
							$.copyObjToObj(param, inputs);
						}
						var callbackFunc = formItem["callbackFunc"];
						var title = formItem["title"] || "信息";
						var templateNo = format;
						var width = formItem["width"] || 600;
						var height = formItem["height"] || 600;
						var isMax = formItem["isMax"] == "true";
						var allowResize = formItem["allowResize"] == "true";
						var closeFunc = function(action) {
							if (callbackFunc) {
								var iframe = "iframe"+new Date().getTime();
								window[iframe] = this.getIFrameEl();;
								eval(callbackFunc + "('" + action + "'," + iframe
										+ ")");
							} else {
								if (action == "ok") {
								}
							}
						};
						var url = formItem["url"];
						This.frameService.popWindow(title, templateNo, inputs, width, height,
								isMax, null, closeFunc,url,allowResize);
					});
				}
			}
			var className = formField.el.className;
			//写数据到下拉框,多选下拉框
			if(className.indexOf("mini-combobox")!=-1 || className.indexOf("mini-treeselect") != -1) {
				formField.on("closeclick",function(e){
					var obj = e.sender;
		            obj.setText("");
		            obj.setValue("");
				});
				formField.on("validation",function(e){
					if($.string.isNotEmpty(e.value + "")){
						var items = this.findItems(e.value);
			            if (!items || items.length == 0) {
			                e.isValid = false;
			                e.errorText = "输入值不在下拉数据中";
			            }
					}
				});
			}else if(className.indexOf("mini-htmlfile")!=-1) {
				This.processUploadLimitType(formField);
			}else if(className.indexOf("mini-buttonedit")!=-1) {
				if($.string.isNotEmpty(id)){
					if($("#"+id).next().attr("tagName") == "javascript"){
						return;
					}
				}
				formField.on("closeclick",function(e){
					var obj = e.sender;
		            obj.setText("");
		            obj.setValue("");
				});
			}
		});
		if (this.formConfig["initFunc"]) {
			eval(this.formConfig["initFunc"] + "()");
		}
		var param = {};
		if (this.formConfig["isLoad"] != "false") {
			this.loadData(param);
		}
	};
	
	/**
	 * 构建树型结构
	 * @param dataList
	 */
	Form.prototype.buildTreeDataList = function(formField,dataList){
		var dataAry = [];
		dataAry = dataAry.concat(dataList);
		for (var i = 0; i < dataAry.length; i ++){
			var catalog = dataAry[i];
			var children = [];
			for (var j = 0; j < dataList.length;){
				//根据正则表达式得到子栏目的在catalogs链表中的位置
				var index = this.getChildCatalogIndex(formField,catalog, dataList);
				if (index >= 0){
					var child = dataList[index];
					children.add(child);
					$.array.removeByIndex(dataList,index);
				}else{
					break;
				}
			}
			//如果有子栏目则添加到栏目的DataRow当中，key是children
			if (children.length > 0){
				catalog["children"] = children;
			}
		}
		return dataList;
	};
	
	/**
	 * 查找子节点
	 * @param catalog
	 * @param dataList
	 */
	Form.prototype.getChildCatalogIndex = function(formField,data, dataList){
		var pid = formField.getParentField();
		var id = formField.getValueField();
		for (var i = 0; i < dataList.length; i++){
			var catalog = dataList[i];
			if(catalog[pid] == data[id]){
				return i;
			}
		}
		return -1;
	};
	
	/** ***********************************Form表单加载数据的相关公开API，一般需要给外面对象调用*********************************** */
	
	/**
	 * 重新加载页面
	 */
	Form.prototype.refresh = function() {
		this.loadData();
	};
	
	/**
	 * 初始化Form表单
	 * 
	 * @param param
	 */
	Form.prototype.loadData = function(param) {
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
					//This.miniForm.setData(result, false);// 设置form数据
					var formfields = This.miniForm.getFields();
					$.each(formfields, function(n, formField) {
						var name = formField.name;
						if(result.hasOwnProperty(name)){
							var value = result[name] + "";
							if($.string.isEmpty(value)){
								value = "";
							}
							value = htmlDecode(value);
							var className = formField.el.className;
							if(className.indexOf("mini-buttonedit")!=-1) {
								formField.setValue(value);
								var textKey = name + "_text";
								if(result.hasOwnProperty(textKey)){
									var textValue = result[textKey];
									textValue = htmlDecode(textValue);
									if($.string.isEmpty(textValue)){
										textValue = "";
									}
									formField.setText(textValue);
								}
							}else{
								formField.setValue(value);
							}
						}
					});
					This.form.find("[tagName='ceditor']").each(function(i){
						var id = $(this).find(".mini-textarea").attr("id");
						var name = $(this).find(".mini-textbox-input").attr("name");
						var ceditor = $.tkui[id];
						if(ceditor){
							var content = result[name]+ "";
							content = htmlDecode(content);
							if($.string.isEmpty(content)){
								content = "";
							}
							ceditor.setContent(content);
						}
					});
					This.form.find("[tagName='calendar']").each(function(i){
						var id = $(this).attr("id");
						var name = $(this).attr("name");
						var calendar = $.tkui[id];
						if(calendar){
							var content = result[name]+ "";
							content = htmlDecode(content);
							if($.string.isEmpty(content)){
								content = "";
							}
							calendar.setValue(content);
						}
					});
					if (This.formConfig["loadDataCallBackFunc"]) {
						eval(This.formConfig["loadDataCallBackFunc"] + "("+$.jsonToStr(result)+")");
					}
				} else {
					var errorInfo = resultVo.getErrorInfo();
					if ($.string.isNotEmpty(errorInfo)) {
						window.top.mini.alert(errorInfo);
					}
				}
			};
			this.frameService.processQueryList(queryDataComplete, eventNo,
					reqParam, rightId,isAsync,url,false);
		}
	};
	
	/**
	 * 获取Form表单提交的数据
	 */
	Form.prototype.getReqParam = function(flag){
		var formData = {};
		var formfields = this.miniForm.getFields();
		$.each(formfields, function(n, formField) {
			var name = formField.name;
			if($.string.isNotEmpty(name)){
				var value = formField.getValue();
				var className = formField.el.className;
				if(className.indexOf("mini-datepicker")!=-1 || className.indexOf("mini-timespinner")!=-1){
					value = formField.getText();
				}
				if($.string.isEmpty(value)){
					value = "";
				}
				formData[name] = value;
			}
		});
		if(flag){
			this.form.find("[tagName='ceditor']").each(function(i){
				var id = $(this).find(".mini-textarea").attr("id");
				var name = $(this).find(".mini-textbox-input").attr("name");
				var ceditor = $.tkui[id];
				if(ceditor){
					var content = ceditor.getContent();
					formData[name] = content;
				}
			});
		}
		this.form.find("[tagName='calendar']").each(function(i){
			var id = $(this).attr("id");
			var name = $(this).attr("name");
			var calendar = $.tkui[id];
			if(calendar){
				var content = calendar.getValue();
				formData[name] = content;
			}
		});
		return formData;
	};
	
	/*************************************Form栏按钮事件私有处理，一般不需要给外面对象调用*********************************** */

	/**
	 * 点击业务按钮
	 */
	Form.prototype.processClickButtonFunc = function(e) {
		var button = $(e.currentTarget);
		if(button.hasClass("mini-button-disabled")){
			return;
		}
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
		var formParam = This.getReqParam(true);
		var isValid = config["isValid"] == "true";
		if(isValid){
			This.miniForm.validate();
			if(!This.miniForm.isValid()){
				return;
			}
		}
		var isAlert = config["isAlert"] == "true";
		var alertMsg = config["alertMsg"] || "是否确认操作？";
		var isClose = config["isClose"] == "true";
		var target = config["target"]; //关联的表格ID 
		var func = config["function"];
		var freshDictId = config["freshDictId"];
		var doAction = function() {
			if ($.string.isNotEmpty(func)) {
				var filterFunc = config["filterFunc"];
				if (filterFunc) {
					var flag = eval(filterFunc + "()");
					if(!flag){
						return;
					}
				}
				if (func == "reset") {
					This.miniForm.reset();
				} else if (func == "clear") {
					This.miniForm.clear();
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
					if((func != "popWindow" && func != "upload") || $.string.isEmpty(inputs)){
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
									dataGrid.loadData(reqParam,This.formId);
								}
							}
						}
						if (isClose) {
							This.frameService.closeWindow("ok");
						}
					} else if (func == "popWindow") {
						var title = config["title"] || reqParam["title"] || "信息";
						title = title.replace(/\$(.*?)\$/g, function(p0, p1,p2) {
							var value = reqParam[p1];
							if($.string.isEmpty(value) && formParam){
								value = formParam[p1];
							}
							if($.string.isEmpty(value)){
								value = "";
							}
							return value;
						});
						var templateNo = reqParam["template_no"] || reqParam["_template_no"] || config["templateNo"];
						delete reqParam["template_no"];
						delete reqParam["_template_no"];
						var width = config["width"] || 600;
						var height = config["height"] || 600;
						var isMax = config["isMax"] == "true";
						var allowResize = config["allowResize"] == "true";
						var closeFunc = function(action) {
							if (callbackFunc) {
								var iframe = "iframe"+new Date().getTime();
								window[iframe] = this.getIFrameEl();;
								eval(callbackFunc + "('" + action + "'," + iframe
										+ ")");
							} else {
								if (action == "ok") {
								}
							}
						};
						var url = config["url"] || reqParam["url"] || reqParam["link_url"];
						delete reqParam["url"];
						delete reqParam["link_url"];
						This.frameService.popWindow(title, templateNo, reqParam, width, height,
								isMax, null, closeFunc,url,allowResize);
					}else if (func == "upload") {
						var title = config["title"] || reqParam["title"] || "信息";
						title = title.replace(/\$(.*?)\$/g, function(p0, p1,p2) {
							var value = reqParam[p1];
							if($.string.isEmpty(value) && formParam){
								value = formParam[p1];
							}
							if($.string.isEmpty(value)){
								value = "";
							}
							return value;
						});
						var templateNo = reqParam["template_no"] || reqParam["_template_no"] || config["templateNo"] || "e_upload_module";
						delete reqParam["template_no"];
						delete reqParam["_template_no"];
						var width = config["width"] || 600;
						var height = config["height"] || 400;
						var isMax = config["isMax"] == "true";
						var allowResize = config["allowResize"] == "true";
						var closeFunc = function(action) {
							if (action == "ok") {
								var iframe = this.getIFrameEl();
								var uploadDataJsonStr = iframe.contentWindow.getUrl();
								if($.string.isEmpty(uploadDataJsonStr)){
									uploadDataJsonStr = "{}";
								}
							    if(callbackFunc){
							    	if($.string.isNotEmpty(uploadDataJsonStr)){
							    		eval(callbackFunc + "(" + uploadDataJsonStr + ")");
							    	}else{
							    		eval(callbackFunc + "()");
							    	}
							    }
							}
						};
						reqParam["_url"] = config["url"] || reqParam["url"] || "";
						reqParam["_event_no"] = config["eventNo"] || reqParam["eventNo"] || "";
						reqParam["_bcode"] = config["bcode"] || "";
						reqParam["_limitType"] = config["limitType"] || "";
						var uploadUrl = $.gconfig.global.uploadUrl || "";
						This.frameService.popWindow(title, templateNo, reqParam, width, height,
								isMax, null, closeFunc,uploadUrl,allowResize);
					}else if (func == "link") {
						var eventNo = config["eventNo"];
						var templateNo = reqParam["template_no"] || reqParam["_template_no"] || config["templateNo"];
						delete reqParam["template_no"];
						delete reqParam["_template_no"];
						var url = config["url"] || reqParam["url"] || reqParam["link_url"];
						delete reqParam["url"];
						delete reqParam["link_url"];
						var isSign = config["isSign"] == "true";
						if($.string.isNotEmpty(eventNo)){
							reqParam["_event_no"] = eventNo;
						}
						url = This.frameService.getCommonUrl(templateNo,reqParam,url,isSign);
						window.open(url,"_blank");
					}else if (func == "submit") {
						var eventNo = config["eventNo"];
						var rightId = config["rightId"];
						var isAysnc = config["isAysnc"] != "false";
						var url = config["url"];
						var isAlertResultInfo = config["isAlertResultInfo"] != "false";
						var processSubmitComplete = function(resultVo) {
							if (resultVo.getErrorNo() == 0) {
								if($.string.isNotEmpty(freshDictId)){
									This.frameService.clearCacheDicts(freshDictId);
								}
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
								if (isClose) {
									This.frameService.closeWindow("ok");
								}
							}else{
								if (callbackFunc) {
									eval(callbackFunc + "("+$.jsonToStr(resultVo.obj)+")");
								}
							}
							if (!callbackFunc || isAlertResultInfo){
								var errorInfo = resultVo.getErrorInfo();
								if ($.string.isNotEmpty(errorInfo)) {
									window.top.mini.alert(errorInfo);
								}
							}
						};
						if($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)){
							This.frameService.processSubmit(processSubmitComplete,
									eventNo, reqParam, rightId, null, isAysnc,url);
						}
					} else if (func == "submit_upload") {
						var eventNo = reqParam["_event_no"] || config["eventNo"];
						var rightId = config["rightId"];
						var isAysnc = config["isAysnc"] != "false";
						var isAlertResultInfo = config["isAlertResultInfo"] != "false";
						var url = This.urlParam["_url"] || reqParam["_url"] || config["url"];
						if($.string.isNotEmpty(eventNo)){
							url = $.gconfig.global.server;
						}
						$.copyObjToObj(This.urlParam, reqParam);
						var processSubmitComplete = function(resultVo) {
							if (resultVo.getErrorNo() == 0) {
								var result = resultVo.getResults();
								var uploadId = config["formItem"];
								var uploadIdAry = uploadId.split(",");
								for(var k = 0; k < uploadIdAry.length; k ++){
									var upload = mini.get("uploadurl_" + uploadIdAry[k]);
									var uploadDataJsonStr = $.jsonToStr(result);
									if($.string.isEmpty(uploadDataJsonStr)){
										uploadDataJsonStr = "{}";
									}
									upload.setValue(uploadDataJsonStr);
								}
								if (callbackFunc) {
									eval(callbackFunc + "("+$.jsonToStr(resultVo.obj)+")");
								}
								if (isClose) {
									This.frameService.closeWindow("ok");
								}
							}else{
								if (callbackFunc) {
									eval(callbackFunc + "("+$.jsonToStr(resultVo.obj)+")");
								}
							}
							if (!callbackFunc || isAlertResultInfo){
								var errorInfo = resultVo.getErrorInfo();
								if ($.string.isNotEmpty(errorInfo)) {
									window.top.mini.alert(errorInfo);
								}
							}
						};
						if($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)){
							var uploadId = config["formItem"];
							var uploadIdAry = uploadId.split(",");
							var fidStr = "";
							for(var k = 0; k < uploadIdAry.length; k ++){
								var upload = mini.get(uploadIdAry[k]);
								var value = upload.getValue();
								value = value.toLowerCase(); 
								if($.string.endsWith(value,".jsp") || $.string.endsWith(value,".dll") || $.string.endsWith(value,".exe") || $.string.endsWith(value,".so") || $.string.endsWith(value,".jspx")){
									window.top.mini.alert("上传文件格式错误!");
									return;
								}
								var fileId = "#"+uploadIdAry[k]+" > input:file";
								var fid = $(fileId).attr("id");
								if($.string.isEmpty(fid)){
									fid = upload.name; 
									$(fileId).attr("id",fid);
								}
								fidStr += (fid + ",");
								delete reqParam[upload.name];
							}
							if(fidStr.length > 0){
								fidStr = fidStr.substring(0, fidStr.length - 1);
							}
							This.frameService.processUpload(processSubmitComplete,fidStr,eventNo,reqParam,rightId,isAysnc,url);
						}
					}else {
						eval(func + "(" + $.jsonToStr(reqParam) + ")");
					}
				}
			}else{
				if (isClose) {
					This.frameService.closeWindow("cancel");
				}
			}
		};
		if (isAlert) {
			window.top.mini.confirm(alertMsg, "温馨提示", function(action) {
				if (action == "ok") {
					doAction();
				}
			});
		} else {
			doAction();
		}
	};
	
	/**
	 * 预处理上传按钮
	 * @param tagId
	 */
	Form.prototype.processUploadLimitType = function(formField){
		var This = this;
		var limitType = this.urlParam["_limitType"];
		if($.string.isNotEmpty(limitType)){
			formField.setLimitType(limitType);
		}else{
			var bcode = this.urlParam["_bcode"];
			if($.string.isNotEmpty(bcode)){
				var uploadLimitTypeUrl = $.gconfig.global.uploadLimitTypeUrl || "";
				var callBackFunc = function(resultVo){
					if (resultVo.getErrorNo() == 0) {
						var result = resultVo.getResults();
						var type = result["ext_name"];
						if($.string.isNotEmpty(type)){
							formField.setLimitType(type);
						}
					}else{
						var errorInfo = resultVo.getErrorInfo();
						if ($.string.isNotEmpty(errorInfo)) {
							window.top.mini.alert(errorInfo);
						}
						This.frameService.closeWindow("ok");
					}
				};
				var reqPram = {};
				reqPram["business_code"] = bcode;
				This.frameService.processQueryList(callBackFunc, null,
						reqPram, null,true,uploadLimitTypeUrl,false);
			}
		}
	};
	
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