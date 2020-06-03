/**
 * 非现场开户服务类
 */
define("plugins/frame/scripts/service/frameService", function (require, exports, module) {

    function FrameService() {
        this.service = new $.domain.Service();
        this.signKey = "";
        this.submitMap = {};
    }

    /**
     * 功能：获取通用的URL
     * 参数：templateNo:模板编号
     *       param:参数,json格式
     *       url:请求地址
     */
    FrameService.prototype.getCommonUrl = function (templateNo, param, url, isSignData) {
        if (!param) {
            param = {};
        }
        if ($.string.isEmpty(url)) {
            url = $.gconfig.platRoot + 'servlet/ModuleView';
        }
		//var urlParam = mini.getParams();
		var urlParam = $.net.getUrlParameter();
        var version_id = param.version_id || param._version_id || urlParam._version_id || "";
        var _module_id = param._module_id || urlParam._module_id || param.module_id || "";
        var catalog_id = param._catalog_id || urlParam._catalog_id || param.catalog_id || "";
        var _version_type = param._version_type || urlParam._version_type;
        templateNo = templateNo || urlParam._template_no || "";
        if ($.string.isNotEmpty(window.top.analysisAppId)) {
        	param["_app_id"] = window.top.analysisAppId;
        }
        if ($.string.isEmpty(_version_type)) {
            _version_type = "1";
        }
        param["_version_id"] = version_id;
        param["_module_id"] = _module_id;
        param["_catalog_id"] = catalog_id;
        param["_template_no"] = templateNo;
        param["_version_type"] = _version_type;
        if (url.indexOf("_version_id") > 0) {
            delete param["_version_id"];
        }
        if (url.indexOf("_module_id") > 0) {
            delete param["_module_id"];
        }
        if (url.indexOf("_catalog_id") > 0) {
            delete param["_catalog_id"];
        }
        if (url.indexOf("_template_no") > 0) {
            delete param["_template_no"];
        }
        if (isSignData) {
            param = this.signData(param);
        }
        if (param) {
            for (var key in param) {
                var value = param[key];
                if (typeof(value) == "undefined" || value === null || value === "") {
                    param[key] = "";
                }
            }
        }
        var paramStr = $.objectToString(param, "&", "=");
        if (url.indexOf("?") > 0) {
            url += ("&" + paramStr);
        } else {
            url += ("?" + paramStr);
        }
        return url;
    },

        /**
         * 功能：弹出窗口
         * 参数: title :窗口标题
         *      templateNo:模板编号
         *      param:参数,json格式
         *      width:窗口宽度
         *      height:窗口高度
         *      isMax：是否最大窗口
         *      onloadCallBack：窗口加载完成函数
         *      ondestroyCallBack：窗口关闭函数
         *
         */
        FrameService.prototype.popWindow = function (title, templateNo, param, width, height, isMax, onloadCallBack, ondestroyCallBack, url, allowResize) {
            allowResize = (typeof(allowResize) == "undefined" || allowResize === null || allowResize === "") ? false : allowResize;
            url = this.getCommonUrl(templateNo, param, url);
            var win = mini.open({
                url: url,
                title: title,
                width: width,
                height: height,
                onload: onloadCallBack,
                ondestroy: ondestroyCallBack,
                allowResize: allowResize
            });
            if (isMax) {
                win.max();
            }
        };

    /**
     *  功能：关闭弹层
     *  @param action 动作
     */
    FrameService.prototype.closeWindow = function (action) {
        action = action || "ok";
        if (window.CloseOwnerWindow) {
            window.CloseOwnerWindow(action);
        } else {
            window.close();
        }
    };

    /**
     * 功能：加载界面
     * @param loadId  右侧Tab容器的ID
     * @param title   标题
     * @param templateNo  模块编号
     * @param param ,json格式
     */
    FrameService.prototype.loadWindow = function (loadId, title, templateNo, param, isLoadOne, url) {
        url = this.getCommonUrl(templateNo, param, url);
        var reqParam = $.net.getUrlParam(url + "");
        var catalog_id = reqParam["_catalog_id"];
        var tabs = mini.get(loadId);
        if (isLoadOne) {
            var index = tabs.getTabs().length - 1;
            var operTab = tabs.getTab(index);
            var frame = tabs.getTabIFrameEl(operTab);
            if (!frame) {
                var tab = {};
                tab.url = url;
                tab.title = title;
                tabs.addTab(tab);
                tabs.activeTab(tab);
            } else {
                tabs.updateTab(operTab, {title: title});
                $(frame).attr("src", url);
                tabs.activeTab(operTab);
            }
        } else {
            var tab = tabs.getTab(catalog_id);
            if (!tab) {
                tab = {};
                tab._nodeid = catalog_id;
                tab.name = catalog_id;
                tab.title = title;
                tab.showCloseButton = true;
                tab.url = url;
                tabs.addTab(tab);
                tabs.activeTab(tab);
            }
            tabs.activeTab(tab);
        }
    };

    /**
     * 删除前端缓存的数据字典
     * @param dictId  为空清除所有
     */
    FrameService.prototype.clearCacheDicts = function (dictId) {
        var dicMap = window.top.$.gconfig.global.dicMap;
        if (dicMap) {
            if ($.string.isNotEmpty(dictId)) {
                dictId += ":";
                for (var key in dicMap) {
                    if ($.string.startWith(key, dictId)) {
                        delete window.top.$.gconfig.global.dicMap[key];
                    }
                }
            }
            window.top.$.gconfig.global.dicMap = {};
        }
    };

    /**
     * 功能:查询数字字典
     * 参数: inputs:入参{key:value,key:value}
     *      dictId:数据字典id
     *      isAsync:是否异步
     *      callBackFunc(resultVo):回调函数
     */
    FrameService.prototype.queryDicts = function (inputs, dictId, isAsync, callBackFunc) {
        var reqParam = {};
        if (inputs) {
            $.copyObjToObj(inputs, reqParam);
        }
        reqParam["dictNo"] = dictId;
        var key = dictId + ":" + $.jsonToStr(reqParam);
        if (!window.top.$.gconfig.global.dicMap) {
            window.top.$.gconfig.global.dicMap = {};
        }
        var resultVoJson = window.top.$.gconfig.global.dicMap[key];
        if ($.string.isNotEmpty(resultVoJson)) {
            var resultObj = $.strToJson(resultVoJson);
            var resultVo = new $.domain.ResultVo();
            var reqParamVo = new $.domain.ReqParamVo();
            reqParamVo.obj = resultObj.reqParamVo.obj;
            resultVo.obj = resultObj;
            resultVo.setReqParamVo(reqParamVo);
            callBackFunc(resultVo);
        } else {
            var reqParamVo = $.getReqParamVo();
            reqParamVo.setUrl($.gconfig.platRoot + "servlet/DictAction");
            reqParamVo.setReqParam(reqParam);
            reqParamVo.setIsShowWait(false);
            reqParamVo.setSendType("get"); //请求方式
            if ($.string.isNotEmpty(isAsync + "")) {
                reqParamVo.setIsAsync(isAsync);
            }
            var queryDictsComplete = function (resultVo) {
                if (resultVo.getErrorNo() == 0) {
                    var resultVoJson = $.jsonToStr(resultVo.obj);
                    window.top.$.gconfig.global.dicMap[key] = resultVoJson;
                }
                if (callBackFunc) {
                    callBackFunc(resultVo);
                }
            };
            this.invoke(reqParamVo, queryDictsComplete, false);
        }
    };

    /**
     * 功能:统一提交数据，默认返回回过来的数据为DataRow
     * 参数: callBackFunc:回调函数
     *       eventNo:功能号
     *       inputs:入参,{key:value,key:value,.....}
     *       rightId:权限id，暂时没用，扩展的时候考虑下
     *       protocol:协议
     *       isAysnc:是否异步，默认异步
     *       url:服务器的地址，传空，默认取配置文件配置的全局地址：$.gconfig.global.server
     *       isReturnList:是否返回回过来的数据为DataRow，传空，默认为DataRow
     */
    FrameService.prototype.processSubmit = function (callBackFunc, eventNo, inputs, rightId, protocol, isAysnc, url, isReturnList,isShowWait) {
        var reqParam = {};
        if (inputs) {
            $.copyObjToObj(inputs, reqParam);
        }
        reqParam["_event_no"] = eventNo;
        reqParam["_rightId"] = rightId;
        var reqParamVo = $.getReqParamVo();
        var reqUrl = url;
        if ($.string.isEmpty(reqUrl)) {
            reqUrl = $.gconfig.global.server;
        }
        var param = $.net.getUrlParam(reqUrl);
        if (param) {
            $.copyObjToObj(param, reqParam, false);
        }
        reqUrl = reqUrl.split("?")[0];
        reqParamVo.setUrl(reqUrl);
        reqParamVo.setReqParam(reqParam);
        isShowWait = (typeof(isShowWait) == "undefined" || isShowWait === null || isShowWait === "") ? false : isShowWait;
        reqParamVo.setIsShowWait(isShowWait);
        isReturnList = (typeof(isReturnList) == "undefined" || isReturnList === null || isReturnList === "") ? false : isReturnList;
        reqParamVo.setSendType("post");
        if ($.string.isNotEmpty(protocol)) {
            reqParamVo.setProtocol(protocol);
        }
        if ($.string.isNotEmpty(isAysnc + "")) {
            reqParamVo.setIsAsync(isAysnc);
        }
        var This = this;
        var callBackFunc1 = function (resultVo) {
            if (callBackFunc) {
                callBackFunc(resultVo);
            }
            delete This.submitMap[submitKey];
        };
        var submitKey = reqUrl + "?" + $.objectToString(reqParam, "&", "=");
        if (!This.submitMap[submitKey]) {
            This.submitMap[submitKey] = true;
            This.invoke(reqParamVo, callBackFunc1, isReturnList);
        }
    };

    /**
     * 功能:统一查询数据，默认返回过来的数据为List
     * 参数: callBackFunc:回调函数
     *       eventNo:功能号
     *       inputs:入参,{key:value,key:value,.....}
     *       rightId:权限id，暂时没用，扩展的时候考虑下
     *       isAysnc:是否异步，默认异步
     *       url:服务器的地址，传空，默认取配置文件配置的全局地址：$.gconfig.global.server
     *       isReturnList:是否返回回过来的数据为List，传空，默认为List
     */
    FrameService.prototype.processQueryList = function (callBackFunc, eventNo, inputs, rightId, isAysnc, url, isReturnList) {
        var reqParam = {};
        if (inputs) {
            $.copyObjToObj(inputs, reqParam);
        }
        reqParam["_event_no"] = eventNo;
        reqParam["_rightId"] = rightId;
        var reqParamVo = $.getReqParamVo();
        var reqUrl = url;
        if ($.string.isEmpty(reqUrl)) {
            reqUrl = $.gconfig.global.server;
        }
        var param = $.net.getUrlParam(reqUrl);
        if (param) {
            $.copyObjToObj(param, reqParam, false);
        }
        reqUrl = reqUrl.split("?")[0];
        reqParamVo.setUrl(reqUrl);
        reqParamVo.setReqParam(reqParam);
        reqParamVo.setIsShowWait(false);
        isReturnList = (typeof(isReturnList) == "undefined" || isReturnList === null || isReturnList === "") ? true : isReturnList;
        reqParamVo.setSendType("get");
        if ($.string.isNotEmpty(isAysnc + "")) {
            reqParamVo.setIsAsync(isAysnc);
        }
        this.invoke(reqParamVo, callBackFunc, isReturnList);
    };

    /**
     * 上传到服务器
     * @param callBackFunc
     * @param fileId 多个用，分割
     * @param eventNo
     * @param inputs
     * @param rightId
     * @param isAysnc
     * @param url
     */
    FrameService.prototype.processUpload = function (callBackFunc, fileId, eventNo, inputs, rightId, isAysnc, url) {
        var reqParam = {};
        if (inputs) {
            $.copyObjToObj(inputs, reqParam);
        }
        reqParam["_event_no"] = eventNo;
        reqParam["_rightId"] = rightId;
        var reqParamVo = $.getReqParamVo();
        if ($.string.startWith(url, "http://") || $.string.startWith(url, "https://")) {
            var reqUrl = url;
            var param = $.net.getUrlParam(reqUrl);
            if (param) {
                $.copyObjToObj(param, reqParam, false);
            }
            var _bcode = reqParam["_bcode"] || reqParam["business_code"];
            var token = this.queryToken("1", _bcode);
            reqParam["token"] = token;
            var currentDomain = window.location.protocol + "//" + window.location.host;
            if (!$.string.startWith(reqUrl, currentDomain)) {
                reqParam["redirectUrl"] = currentDomain + $.gconfig.viewsPath + "include/upload.html";
            }
            reqUrl = reqUrl.split("?")[0];
            reqParamVo.setUrl(reqUrl);
            reqParamVo.setReqParam(reqParam);
            reqParamVo.setIsShowWait(false);
            reqParamVo.setSendType("post"); //请求方式
            if ($.string.isNotEmpty(isAysnc + "")) {
                reqParamVo.setIsAsync(isAysnc);
            }
            this.service.uploadFile(fileId, reqParamVo, callBackFunc, false);
        } else {
            var reqUrl = url;
            var _bcode = reqParam["_bcode"] || reqParam["business_code"];
            if (_bcode == "module_import") {
                reqUrl = $.gconfig.global.importModule;
            }
            if ($.string.isNotEmpty(eventNo)) {
                reqUrl = $.gconfig.global.server;
            }
            var param = $.net.getUrlParam(reqUrl);
            if (param) {
                $.copyObjToObj(param, reqParam, false);
            }
            reqUrl = reqUrl.split("?")[0];
            reqParamVo.setUrl(reqUrl);
            reqParamVo.setReqParam(reqParam);
            reqParamVo.setIsShowWait(false);
            if ($.string.isNotEmpty(isAysnc + "")) {
                reqParamVo.setIsAsync(isAysnc);
            }
            this.invoke(reqParamVo, callBackFunc, false, fileId);
        }

    };


    /**
     * 上传本地
     * @param callBackFunc
     * @param fileId 多个用，分割
     * @param eventNo
     * @param inputs
     * @param rightId
     * @param isAysnc
     * @param url
     */
    FrameService.prototype.processUploadLocal = function (callBackFunc, fileId, eventNo, inputs, rightId, isAysnc, url) {
        var reqParam = {};
        if (inputs) {
            $.copyObjToObj(inputs, reqParam);
        }
        reqParam["_event_no"] = eventNo;
        reqParam["_rightId"] = rightId;
        reqParam["isExport"] = "1";
        var reqParamVo = $.getReqParamVo();
        var reqUrl = url;
        if ($.string.isEmpty(reqUrl)) {
            reqUrl = $.gconfig.global.server;
        }
        var param = $.net.getUrlParam(reqUrl);
        if (param) {
            $.copyObjToObj(param, reqParam, false);
        }
        reqUrl = reqUrl.split("?")[0];
        reqParamVo.setUrl(reqUrl);
        reqParamVo.setReqParam(reqParam);
        reqParamVo.setIsShowWait(false);
        if ($.string.isNotEmpty(isAysnc + "")) {
            reqParamVo.setIsAsync(isAysnc);
        }
        this.service.uploadFile(fileId, reqParamVo, callBackFunc, false);
    };


    /**
     * 功能：excel导出功能
     * 参数: exportFuncNo:导出数据的来源请求功能号
     *       exportPage:导出的页码
     *       startPage:导出的开始页码
     *       endPage:导出的截止页码
     *       records：导出的记录数
     *       fileName:导出的文件名称
     *       titles:导出表的中文表头名称
     *       fields:导出表的数据库字段名称
     *       dicts:需要翻译的数据字典字段名称
     *       localParam:数据来源的请求的参数
     */
    FrameService.prototype.exportExcel = function (exportFuncNo, exportPage, records, fileName, titles, fields, dicts, fmtType, localParam,callBackFunc) {
    	var reqParam = {};
	    if (localParam) {
	    	$.copyObjToObj(localParam , reqParam);
	    }
		reqParam["_event_no"] = "900900";
		reqParam["exportFuncNo"] = exportFuncNo;
		reqParam["isExport"] = "1";
		reqParam["exportPage"] = exportPage;
		reqParam["records"] = records;
		reqParam["fileName"] = fileName;
		reqParam["titles"] = titles;
		reqParam["fields"] = fields;
		reqParam["fmtType"] = fmtType;
		reqParam["dicts"] = dicts;
		reqParam["app_id"] = window.top.analysisAppId;
		reqParam["resultType"] = "list";
		if(reqParam){
			for ( var key in reqParam) {
				var value = reqParam[key];
				if (typeof(value) == "undefined" || value === null || value === "") {
					reqParam[key] = "";
				} else {
					value = encodeURIComponent(value + "");
					reqParam[key] = value;
				}
			}
		}
		// 发送查询表格数据的请求
		var reqParamVo = $.getReqParamVo();
		reqParamVo.setUrl($.gconfig.global.exportServer);
		reqParamVo.setReqParam(reqParam);
		reqParamVo.setSendType("post"); //请求方式
		this.service.downLoadFile(reqParamVo,callBackFunc,false);

    	
    	/*var reqParam = {};
        if (localParam) {
            $.copyObjToObj(localParam, reqParam);
        }
        reqParam["_event_no"] = "900900";
        reqParam["exportFuncNo"] = exportFuncNo;
        reqParam["isExport"] = "1";
        reqParam["exportPage"] = exportPage;
        reqParam["records"] = records;
        reqParam["fileName"] = fileName;
        reqParam["titles"] = titles;
        reqParam["fields"] = fields;
        reqParam["fmtType"] = fmtType;
        reqParam["dicts"] = dicts;
        reqParam["app_id"] = window.top.analysisAppId;
        reqParam["resultType"] = "list";
        if (reqParam) {
            for (var key in reqParam) {
                var value = reqParam[key];
                if (typeof(value) == "undefined" || value === null || value === "") {
                    reqParam[key] = "";
                } else {
                    value = encodeURIComponent(value + "");
                    reqParam[key] = value;
                }
            }
        }
        // 发送查询表格数据的请求
        var reqParamVo = $.getReqParamVo();
        reqParamVo.setUrl($.gconfig.global.exportServer);
        reqParamVo.setReqParam(reqParam);
        reqParamVo.setSendType("get"); //请求方式
        reqParamVo.setProtocol("open");
        this.service.invoke(reqParamVo);*/
    };

    /**
     * 功能:请求服务
     * 入参: reqParamVo:请求对象
     *       callBackFunc：回调函数
     *       isReturnList:返回的结果集是否是数组，否则就是单个对象 默认是true
     */
    FrameService.prototype.invoke = function (reqParamVo, callBackFunc, isReturnList, fileId) {
        var filterParamFunc = $.bindFunc(this.signData, this);
        if ($.string.isNotEmpty(fileId)) {
            this.service.uploadFile(fileId, reqParamVo, callBackFunc, isReturnList, filterParamFunc);
        } else {
            this.service.invoke(reqParamVo, callBackFunc, isReturnList, filterParamFunc);
        }
    };

    /**
     * 功能:创建文件服务器的token值
     * 参数: type_token:获取token的类型
     *      business_code:类型
     */
    FrameService.prototype.queryToken = function (type_token, business_code) {
        var reqParam = {};
        var reqParamVo = $.getReqParamVo();
        reqParam["type_token"] = type_token;
        reqParam["business_code"] = business_code;
        reqParamVo.setUrl($.gconfig.platRoot + "servlet/CreateToken");
        reqParamVo.setReqParam(reqParam);
        reqParamVo.setIsShowWait(false);
        reqParamVo.setSendType("post"); //请求方式
        reqParamVo.setIsAsync(false);
        var token = "";
        this.invoke(reqParamVo, function (resultVo) {
            if (resultVo.getErrorNo() == 0) {
                token = resultVo.obj.results.results[0].token;
            } else {
                window.top.mini.alert(resultVo.getErrorInfo());
            }
        }, false);
        return token;
    };


    /**
     * 审核数据
     * @param flowType 流程类型
     * @param flowId 流程编号
     * @param dataId 数据编号
     * @param title 数据标题
     * @param callback 回调函数
     */
    FrameService.prototype.examineData = function (flowType, flowId, dataId, title, callback) {
        var reqParam = {};
        var reqParamVo = $.getReqParamVo();
        reqParam["flow_type"] = flowType;
        reqParam["flow_id"] = flowId;
        reqParam["data_id"] = dataId;
        reqParam["title"] = title;
        reqParamVo.setUrl($.gconfig.platRoot + "servlet/SubmitExamineFunction");
        reqParamVo.setReqParam(reqParam);
        reqParamVo.setIsShowWait(false);
        reqParamVo.setSendType("post"); //请求方式
        reqParamVo.setIsAsync(false);
        this.invoke(reqParamVo, function (resultVo) {
            window.top.mini.alert(resultVo.getErrorInfo());
            if (callback) {
                callback();
            }
        }, false);
    };

    /**
     * 签名参数
     * @param param
     */
    FrameService.prototype.signData = function (param) {
        //预处理入参
        //var urlParam = mini.getParams();
		var urlParam = $.net.getUrlParameter();
        //$.copyObjToObj($.net.getUrlParameter (),urlParam);
        var version_id = urlParam._version_id;
        if ($.string.isEmpty(version_id)) {
            version_id = "";
        }
        var module_id = urlParam._module_id;
        if ($.string.isEmpty(module_id)) {
            module_id = "";
        }
        var catalog_id = urlParam._catalog_id;
        if ($.string.isEmpty(catalog_id)) {
            catalog_id = "";
        }
        var _version_type = urlParam._version_type;
        if ($.string.isEmpty(_version_type)) {
            _version_type = "1";
        }
        var _app_id = urlParam._app_id; 
        if (!param) {
            param = {};
        }
        if ($.string.isEmpty(param["_version_id"])) {
            param["_version_id"] = version_id;
        }
        if ($.string.isEmpty(param["_module_id"])) {
            param["_module_id"] = module_id;
        }
        if ($.string.isEmpty(param["_catalog_id"])) {
            param["_catalog_id"] = catalog_id;
        }
        if ($.string.isEmpty(param["_event_no"])) {
            param["_event_no"] = "";
        }
        if ($.string.isEmpty(_app_id)) {
            param["_app_id"] =window.top.analysisAppId ;
        }else{
        	param["_app_id"] = _app_id;
        }
        if ($.string.isEmpty(param["_version_type"])) {
            param["_version_type"] = _version_type;
        } 
        var _tksendtype = param["_tksendtype"];
        delete param["_tksendtype"];
        for (var key in param) {
            var value = param[key];
            if (value) {
                param[key] = $.trim(value);
            }
        }
        var reqParam = {};
        //1：加签不加密
        if ($.gconfig.global.requestMode == "1") {
            if ($.string.isEmpty(this.signKey)) {
                var signKey = $.gconfig.global.signKey;
                var aesKey = "thinkive";
                for (var i = 0; i < 2; i++) {
                    aesKey += aesKey;
                }
                this.signKey = $.crypto.aes.decrypt(aesKey, signKey);
            }
            var paramStr = "";
            if (param) {
                paramStr = $.jsonToStr(param);
            }
            reqParam["data"] = paramStr;
            var timestamp = new Date().getTime();
            reqParam["timestamp"] = timestamp;
            var signStr = ("data=" + paramStr + "&");
            if (_tksendtype == "post") {
                var requestId = $.crypto.uuid.getUUID();
                signStr += ("reactFlag=1&");
                signStr += ("requestId=" + requestId + "&");
                reqParam["requestId"] = requestId;
                reqParam["reactFlag"] = "1";
            }
            signStr += ("signKey=" + this.signKey + "&");
            signStr += ("timestamp=" + timestamp);
            signStr = $.crypto.md5.encode(signStr);
            reqParam["sign"] = signStr;
        } else {
            reqParam = param;
        }
        return reqParam;
    };

    /**
     * 释放操作
     */
    FrameService.prototype.destroy = function () {
        this.service.destroy();
    };

    /**
     * 实例化对象
     */
    function getInstance() {
        return new FrameService();
    }

    var frameService = {
        "getInstance": getInstance
    };

    window.FrameService = frameService;

    // 暴露对外的接口
    module.exports = frameService;
});
