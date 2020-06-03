/**
 * OutLookTree的相关操作
 */
define(function(require, exports, module) {
	var FrameService = require("plugins/frame/scripts/service/frameService");

	/**
	 * 构建树 参数： treeId：树组件的id treeConfig：相关配置
	 */
	function OutLookTreeBus(treeId, treeConfig) {
		mini.parse();
		// 网络通信层
		this.frameService = FrameService.getInstance();
		// jQuery对象Tree
		this.tree = $("#" + treeId);
		// 树的ID
		this.miniTreeId = this.tree.find(".mini-outlooktree").attr("id");
		// MiniUI对象Tree
		this.miniTree = mini.get(this.miniTreeId);
		// 树的配置信息
		this.treeConfig = treeConfig;
		// 是否左键只是响应叶子节点
		this.treeConfig["isOnlyLeaf"] = this.treeConfig["isOnlyLeaf"] || "true";
		// 上次加载的参数
		this.localParam = {};
		// 浏览器上面的入参
		this.urlParam = mini.getParams() || {};
		// 左键配置
		this.leftClick = null;
		var clicks = this.treeConfig["clicks"];
		if (clicks && clicks.length > 0) {
			for ( var i = 0; i < clicks.length; i++) {
				var click = clicks[i];
				if (click["type"] == "left") {
					this.leftClick = click;
				}
			}
		}
	}

	/**
	 * 初始化树的数据
	 */
	OutLookTreeBus.prototype.loadViewConfig = function() {
		// 绑定事件
		this.onRegister();
		// 创建树
		this.createTree();
	};

	/**
	 * 树注册事件监听
	 */
	OutLookTreeBus.prototype.onRegister = function() {
		// 加载前数据监听事件，目的是用我们自己的通信层，拦截MiniUI的默认的URL请求，然后把我们数据赋值给MiniUI
		var onBeforeLoadFunc = $.bindFunc(this.onBeforeLoadFunc, this);
		this.miniTree.on("beforeload", onBeforeLoadFunc);
		var onBeforeExpandFunc = $.bindFunc(this.onBeforeExpandFunc, this);
		// 展开节点前的事件调用，用于实现懒加载模式
		this.miniTree.on("beforeNodeExpand", onBeforeExpandFunc);
		// 点击叶子节点的左键事件调用
		var onNodeClickFunc = $.bindFunc(this.onNodeClickFunc, this);
		this.miniTree.on("nodeClick", onNodeClickFunc);
	};

	/**
	 * 创建树
	 */
	OutLookTreeBus.prototype.createTree = function() {
		if (this.treeConfig["initFunc"]) {
			eval(this.treeConfig["initFunc"] + "()");
		}
		if (this.treeConfig["isLoad"] != "false") {
			this.loadData();
		}
	};

	/** ***********************************树加载数据的相关公开API，一般需要给外面对象调用*********************************** */

	/**
	 * 重新加载页面
	 */
	OutLookTreeBus.prototype.refresh = function() {
		this.loadData();
	};
	
	/**
	 * 加载树
	 * 
	 * @param param
	 */
	OutLookTreeBus.prototype.loadData = function(param,tree, node) {
		var This = this;
		var reqParam = {};
		if (this.localParam) {
			$.copyObjToObj(this.localParam, reqParam);
		}
		var inputs = this.treeConfig["inputs"];
		var idField = this.treeConfig["idField"] || "id";
		var parentField = this.treeConfig["parentField"] || "pid";
		if ($.string.isNotEmpty(inputs)) {
			inputs = eval("({" + inputs + "})");
			for ( var key in inputs) {
				var value = inputs[key]+"";
				if ($.string.isEmpty(value)) {
					if (node) {
						value = node[key];
					}
					if ($.string.isEmpty(value)) {
						value = This.urlParam[key];
					}
				}else{
					value = value.replace(/\$(.*?)\$/g,
							function(p0, p1, p2) {
						        var v = "";
						        if (node) {
									v = node[p1];
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
		if (this.treeConfig["paramFunc"]) {
			var funcParam = eval(this.treeConfig["paramFunc"] + "()");
			if (funcParam) {
				$.copyObjToObj(funcParam, reqParam);
			}
		}
		if (param) {
			$.copyObjToObj(param, reqParam);
		}
		var queryTreeDataComplete = function(resultVo) {
			This.localParam = resultVo.getReqParamVo().getReqParam();
			var results = resultVo.getResults();
			if (resultVo.getErrorNo() == 0) {
				var dataList = resultVo.getResults();
				var dataListStr = $.jsonToStr(dataList);
				dataListStr = $.string.replaceAll(dataListStr, "isleaf",
						"isLeaf");
				dataList = $.strToJson(dataListStr);
				if (tree && node) {
					if (dataList != null && dataList.length > 0) {
						var tempNode = dataList[0];
						if (tempNode[parentField] == node[idField]) {
							var childrenNodes = tree.getChildNodes(node);
							tree.removeNodes(childrenNodes);
							tree.addNodes(dataList, node);
							tree.expandNode(node);
						}
					} else {
						tree.updateNode(node, {
							"isLeaf" : true
						});
					}
				} else {
					This.miniTree.loadList(dataList, idField, parentField);
					if (This.treeConfig["loadDataCallBackFunc"]) {
						eval(This.treeConfig["loadDataCallBackFunc"] + "("+$.jsonToStr(dataList)+")");
					}
				}
			}
		};
		var eventNo = this.treeConfig["eventNo"];
		var isAsync = this.treeConfig["isAsync"] != "false";
		var rightId = this.treeConfig["rightId"];
		var url = this.treeConfig["url"];
//		if(node){
//			url = "/framework/data/testTree.json";
//		}
		if($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)){
			this.frameService.processQueryList(queryTreeDataComplete, eventNo,
					reqParam, rightId, isAsync,url);
		}
	};

	/**
	 * 获取发送的参数
	 * 
	 */
	OutLookTreeBus.prototype.getSendParam = function(selectNode,inputs) {
		var This = this;
		var reqParam = {};
		if (this.localParam) {
			$.copyObjToObj(this.localParam, reqParam);
		}
		if ($.string.isEmpty(inputs)){
			inputs = this.treeConfig["inputs"];
		}else{
			if ($.string.isNotEmpty(this.treeConfig["inputs"])) {
				inputs += ("," + this.treeConfig["inputs"]);
			}
		}
		if ($.string.isNotEmpty(inputs)) {
			inputs = eval("({" + inputs + "})");
			for ( var key in inputs) {
				var value = inputs[key]+"";
				if ($.string.isEmpty(value)) {
					if(selectNode){
						value = selectNode[key];
					}
					if ($.string.isEmpty(value)) {
						value = This.urlParam[key];
					}
				}else{
					value = value.replace(/\$(.*?)\$/g,
							function(p0, p1, p2) {
						        var v0 = "";
						        if(selectNode){
						        	v0 = selectNode[p1];
						        }
								if ($.string.isEmpty(v0)) {
									v0 = This.urlParam[p1];
								}
								return v0;
							});
				}
				if ($.string.isEmpty(value)) {
					value = "";
				}
				reqParam[key] = value;
			}
		}
		return reqParam;
	};

	/** ***********************************树处理事件私有处理，一般不需要给外面对象调用*********************************** */

	/**
	 * 加载前数据监听事件，目的是用我们自己的通信层，拦截MiniUI的默认的URL请求，然后把我们数据赋值给MiniUI
	 */
	OutLookTreeBus.prototype.onBeforeLoadFunc = function(e) {
		e.cancel = true;
	};

	/**
	 * 展开节点前的事件调用，用于实现懒加载模式
	 * 
	 * @param e
	 */
	OutLookTreeBus.prototype.onBeforeExpandFunc = function(e) {
		var node = e.node;
		var tree = e.tree;
		if (!node.children) {
			this.loadData(null,tree,node);
		} else {
			tree.expandNode(node);
		}
		e.cancel = true;
	};

	/**
	 * 左键点击叶子节点的事件调用
	 * 
	 * @param e
	 */
	OutLookTreeBus.prototype.onNodeClickFunc = function(e) {
		var node = e.node;
		var isLeaf = e.isLeaf;
		if(this.leftClick){
			if(this.treeConfig["isOnlyLeaf"] != "false"){
				if(isLeaf){
					this.processClickLeafFunc(node, this.leftClick);
				}
			}else{
				this.processClickLeafFunc(node, this.leftClick);
			}
		}
	};

	/** ***********************************左右键点击事件私有处理，一般不需要给外面对象调用*********************************** */

	/**
	 * 处理左/右键点击函数
	 */
	OutLookTreeBus.prototype.processClickLeafFunc = function(treeNode, click) {
		if (!click)
			return;
		var This = this;
		var event = {};
		event.data = [ click, treeNode];
		var isAlert = click["isAlert"] == "true";
		var alertMsg = click["alertMsg"] || "是否确认操作？";
		var func = click["function"];
		var inputs = click["inputs"];
		var doAction = function() {
			if ($.string.isNotEmpty(func)) {
				var filterFunc = click["filterFunc"];
				if (filterFunc) {
					var flag = eval(filterFunc + "()");
					if(!flag){
						return;
					}
				}
				if (func == "load") {
					This.loadWindowFunc(event);
				}else if (func == "popWindow") {
					This.popWindowFunc(event);
				}else if (func == "upload") {
					This.uploadFunc(event);
				}else if (func == "link") {
					This.linkFunc(event);
				}else {
					var reqParam = This.getSendParam(treeNode,inputs);
					eval(func + "(" + $.jsonToStr(reqParam) + ")");
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
	 * 加载页面
	 * 
	 * @param event
	 */
	OutLookTreeBus.prototype.loadWindowFunc = function(event) {
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		var inputs = click["inputs"];
		var reqParam = this.getSendParam(node,inputs);
		var paramFunc = click["paramFunc"];
		if (paramFunc) {
			var param = eval(paramFunc + "()");
			$.copyObjToObj(param, reqParam);
		}
		var textField = this.treeConfig["textField"] || "text";
		var title = click["title"] || reqParam["title"] || node[textField] || "信息";
		title = title.replace(/\$(.*?)\$/g, function(p0, p1,p2) {
			var value = reqParam[p1];
			if($.string.isEmpty(value) && node){
				value = node[p1];
			}
			if($.string.isEmpty(value)){
				value = "";
			}
			return value;
		});
		var templateNo = reqParam["template_no"] || reqParam["_template_no"] || click["templateNo"];
		delete reqParam["template_no"];
		delete reqParam["_template_no"];
		var loadId = click["loadId"];
		var url = click["url"] || reqParam["url"] || reqParam["link_url"];
		delete reqParam["url"];
		delete reqParam["link_url"];
		var isLoadOne = click["isLoadOne"] != "false";
		var idField = this.treeConfig["idField"] || "id";
		var catalog_id = reqParam["catalog_id"] || reqParam["_catalog_id"] || this.urlParam["_catalog_id"] || node[idField];
		reqParam["catalog_id"] = catalog_id;
		this.frameService.loadWindow(loadId, title, templateNo, reqParam,isLoadOne,url);
		var callbackFunc = click["callbackFunc"];
		if(callbackFunc){
			eval(callbackFunc + "()");
		}
	};

	/**
	 * 弹出窗口
	 */
	OutLookTreeBus.prototype.popWindowFunc = function(event) {
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		var inputs = click["inputs"];
		var reqParam = this.getSendParam(node,inputs);
		var paramFunc = click["paramFunc"];
		if (paramFunc) {
			var param = eval(paramFunc + "()");
			$.copyObjToObj(param, reqParam);
		}
		var textField = this.treeConfig["textField"] || "text";
		var title = click["title"] || reqParam["title"] || node[textField] || "信息";
		title = title.replace(/\$(.*?)\$/g, function(p0, p1,p2) {
			var value = reqParam[p1];
			if($.string.isEmpty(value) && node){
				value = node[p1];
			}
			if($.string.isEmpty(value)){
				value = "";
			}
			return value;
		});
		var templateNo = reqParam["template_no"] || reqParam["_template_no"] || click["templateNo"];
		delete reqParam["template_no"];
		delete reqParam["_template_no"];
		var width = click["width"] || 600;
		var height = click["height"] || 600;
		var isMax = click["isMax"] == "true";
		var callbackFunc = click["callbackFunc"];
		var allowResize = click["allowResize"] == "true";
		var closeFunc = function(action) {
			if (callbackFunc) {
				var iframe = "iframe"+new Date().getTime();
				window[iframe] = this.getIFrameEl();;
				eval(callbackFunc + "('" + action + "'," + iframe
						+ ")");
				delete window[iframe];
			} else {
				if (action == "ok") {
				}
			}
		};
		var url = click["url"] || reqParam["url"] || reqParam["link_url"];
		delete reqParam["url"];
		delete reqParam["link_url"];
		this.frameService.popWindow(title, templateNo, reqParam, width, height,
				isMax, null, closeFunc,url,allowResize);
	};

	/**
	 * 上传函数
	 * @param event
	 */
	OutLookTreeBus.prototype.uploadFunc = function(event){
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		var inputs = click["inputs"];
		var reqParam = this.getSendParam(node,inputs);
		var paramFunc = click["paramFunc"];
		if (paramFunc) {
			var param = eval(paramFunc + "()");
			$.copyObjToObj(param, reqParam);
		}
		var callbackFunc = click["callbackFunc"];
		var title = click["title"] || "上传";
		var templateNo = reqParam["template_no"] || reqParam["_template_no"] || click["templateNo"] || "e_upload_module";
		delete reqParam["template_no"];
		delete reqParam["_template_no"];
		var width = click["width"] || 400;
		var height = click["height"] || 140;
		var isMax = click["isMax"] == "true";
		var allowResize = click["allowResize"] == "true";
		var closeFunc = function(action) {
			if (action == "ok") {
				var iframe = this.getIFrameEl();
				var url = iframe.contentWindow.getUrl();
				if($.string.isEmpty(url)){
					url = "";
				}
			    if(callbackFunc){
			    	if($.string.isNotEmpty(url)){
			    		eval(callbackFunc + "('" + url + "')");
			    	}else{
			    		eval(callbackFunc + "()");
			    	}
			    }
			}
		};
		reqParam["_url"] = click["url"] || "";
		reqParam["_event_no"] = click["eventNo"] || "";
		reqParam["_bcode"] = click["bcode"] || "";
		reqParam["_limitType"] = click["limitType"] || "";
		var uploadUrl = $.gconfig.global.uploadUrl || "";
		This.frameService.popWindow(title, templateNo, reqParam, width, height,
				isMax, null, closeFunc,uploadUrl,allowResize);
	};
	
	/**
	 * 浏览器链接弹窗函数
	 */
	OutLookTreeBus.prototype.linkFunc = function(event) {
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		var inputs = click["inputs"];
		var reqParam = this.getSendParam(node,inputs);
		var paramFunc = click["paramFunc"];
		if (paramFunc) {
			var param = eval(paramFunc + "()");
			$.copyObjToObj(param, reqParam);
		}
		var templateNo = reqParam["template_no"] || reqParam["_template_no"] || click["templateNo"];
		delete reqParam["template_no"];
		delete reqParam["_template_no"];
		var isMax = click["isMax"] == "true";
		var url = click["url"] || reqParam["url"] || reqParam["link_url"];
		delete reqParam["url"];
		delete reqParam["link_url"];
		var isSign = click["isSign"] == "true";
		var eventNo = click["eventNo"];
		if($.string.isNotEmpty(eventNo)){
			reqParam["_event_no"] = eventNo;
		}
		url = This.frameService.getCommonUrl(templateNo,reqParam,url,isSign);
		window.open(url,"_blank");
	};
	
	/**
	 * 释放内存工作
	 */
	OutLookTreeBus.prototype.destroy = function() {
		this.frameService.destroy();
	};

	window.OutLookTreeBus = OutLookTreeBus;
	
	// 暴露对外的接口
	module.exports = OutLookTreeBus;
});