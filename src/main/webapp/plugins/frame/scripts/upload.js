/**
 * 上传组件的相关操作
 */
define(function(require, exports, module) {

	var FrameService = require("plugins/frame/scripts/service/frameService");
	
	/**
	 * 构造函数
	 */
	function Upload(uploadId, uploadConfig) {
		mini.parse();
		// 服务通信层
		this.frameService = FrameService.getInstance();
		this.uploadConfig = uploadConfig || {};
		this.miniUploadFiled = mini.get(uploadId);
		// 浏览器上面的入参
		this.urlParam = mini.getParams() || {};
	};

	/**
	 * 初始化界面
	 */
	Upload.prototype.loadViewConfig = function() {
		var processClickUploadButtonFunc = $.bindFunc(this.processClickUploadButtonFunc, this);
		this.miniUploadFiled.on("buttonclick",processClickUploadButtonFunc);
		var processClickDeleteButtonFunc = $.bindFunc(this.processClickDeleteButtonFunc, this);
		this.miniUploadFiled.on("closeclick",processClickDeleteButtonFunc);
	};

	/**
	 * 点击上传业务按钮
	 */
	Upload.prototype.processClickUploadButtonFunc = function(e) {
		var This = this;
		var inputs = this.uploadConfig.inputs;
		if ($.string.isNotEmpty(inputs)) {
			inputs = eval("({" + inputs + "})");
			for ( var key in inputs) {
				var value = inputs[key]+"";
				if ($.string.isEmpty(value)) {
					value = This.urlParam[key];
				}else{
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
		}else{
			inputs = {};
		}
		var paramFunc = this.uploadConfig["paramFunc"];
		if (paramFunc) {
			var param = eval(paramFunc + "()");
			$.copyObjToObj(param, inputs);
		}
		var callbackFunc = this.uploadConfig["callbackFunc"];
		var title = this.uploadConfig["title"] || "上传文件";
		var templateNo = inputs["template_no"] || inputs["_template_no"] || this.uploadConfig["templateNo"] || "e_upload_module";
		delete inputs["template_no"];
		delete inputs["_template_no"];
		var width = this.uploadConfig["width"] || 600;
		var height = this.uploadConfig["height"] || 400;
		var isMax = this.uploadConfig["isMax"] == "true";
		var closeFunc = function(action) {
			if(action == "ok" || action == "close"){
				var iframe = this.getIFrameEl();
				var uploadDataJsonStr = iframe.contentWindow.getUrl();
				if($.string.isEmpty(uploadDataJsonStr)){
					uploadDataJsonStr = "{}";
				}
				var uploadData = $.strToJson(uploadDataJsonStr); 
				var file_name = uploadData["file_name"] || "";
				var upload_id = uploadData["upload_id"] || "";
				var file_path = uploadData["file_path"] || "";
				var is_safe = uploadData["is_safe"] || ""; 
				if(is_safe == "1"){
					This.miniUploadFiled.setValue(upload_id);
				}else{
					This.miniUploadFiled.setValue(file_path);
				}
				
				if($.string.isNotEmpty(file_name)){
					This.miniUploadFiled.setText(file_name);
				}
				This.miniUploadFiled.setIsValid(true);
			}
		    if(callbackFunc){
		    	action = action || "cancel";
				eval(callbackFunc + "('" + action + "'," + uploadDataJsonStr + ")");
		    }
		};
		inputs["_url"] = this.uploadConfig["url"] || inputs["url"] || "";
		inputs["_event_no"] = this.uploadConfig["eventNo"] || inputs["eventNo"] || "";
		inputs["_bcode"] = this.uploadConfig["bcode"] || "";
		inputs["_limitType"] = this.uploadConfig["limitType"] || "";
		var uploadUrl = $.gconfig.global.uploadUrl || "";
		This.frameService.popWindow(title, templateNo, inputs, width, height,
				isMax, null, closeFunc,uploadUrl);
	};
	
	/**
	 * 点击删除业务按钮
	 */
	Upload.prototype.processClickDeleteButtonFunc = function(e) {
//		var This = this;
		this.miniUploadFiled.setValue("");
		this.miniUploadFiled.setText("");
		/*var processSubmitComplete = function(resultVo) {
			if (resultVo.getErrorNo() == 0) {
				This.miniUploadFiled.setValue("");
				This.miniUploadFiled.setText("");
			}
			var errorInfo = resultVo.getErrorInfo();
			if ($.string.isNotEmpty(errorInfo)) {
				window.top.mini.alert(errorInfo);
			}
		};
		var uploadDeleteUrl = $.gconfig.global.uploadDeleteUrl || "";
		var upload_id = this.miniUploadFiled.getValue() || ""; 
		var bcode = this.uploadConfig["bcode"] || "";
		//var token = This.frameService.queryToken("3",bcode);
		window.top.mini.confirm("确定删除吗?", "温馨提示", function(action) {
			if (action == "ok") { 
				if($.string.isNotEmpty(uploadDeleteUrl) && $.string.isNotEmpty(upload_id)){
					var reqParam = {};
					reqParam["business_code"] = bcode;
					reqParam["upload_id"] = upload_id;
					//reqParam["token"] = token;
					This.frameService.processSubmit(processSubmitComplete,
							null, reqParam, null, null, true, uploadDeleteUrl);
				}
			}
		});*/
		
	};
	
	/**
	 * 释放内存工作
	 */
	Upload.prototype.destroy = function() {
		
	};

	window.Upload = Upload;
	// 暴露对外的接口
	module.exports = Upload;
});