/**
 * Tree的相关操作
 */
define(function(require, exports, module) {
	var FrameService = require("plugins/frame/scripts/service/frameService");

	/**
	 * 构建树 参数： treeId：树组件的id treeConfig：相关配置
	 */
	function TreeBus(treeId, treeConfig) {
		mini.parse();
		// 网络通信层
		this.frameService = FrameService.getInstance();
		// jQuery对象Tree
		this.tree = $("#" + treeId);
		// 树的ID
		this.miniTreeId = this.tree.find(".mini-tree").attr("id");
		// MiniUI对象Tree
		this.miniTree = mini.get(this.miniTreeId);
		// Tree下面的小的Form MiniUI组件
		this.miniForm = new mini.Form("#" + treeId);
		// 树的配置信息
		this.treeConfig = treeConfig;
		// 是否懒加载
		this.treeConfig["isLazy"] = this.treeConfig["isLazy"] || "true";
		// 是否左键只是响应叶子节点
		this.treeConfig["isOnlyLeaf"] = this.treeConfig["isOnlyLeaf"] || "true";
		// 上次加载的参数
		this.localParam = {};
		// 浏览器上面的入参
		this.urlParam = mini.getParams() || {};
		// 左键配置
		this.leftClick = null;
		// 右键配置
		this.rightClickMap = {};
		var clicks = this.treeConfig["clicks"];
		if (clicks && clicks.length > 0) {
			for ( var i = 0; i < clicks.length; i++) {
				var click = clicks[i];
				if (click["type"] == "left") {
					this.leftClick = click;
				} else {
					if(click.tagId){
						this.rightClickMap[click.tagId] = click;
					}
				}
			}
		}
		// 关联所有的业务功能按钮组
		this.toggleGroup = this.tree.find(".mini-button");
		this.toggleMap = {};
		var toggleConfig = this.treeConfig["toolbar"];
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
	 * 初始化树的数据
	 */
	TreeBus.prototype.loadViewConfig = function() {
		// 绑定事件
		this.onRegister();
		// 创建树
		this.createTree();
	};

	/**
	 * 树注册事件监听
	 */
	TreeBus.prototype.onRegister = function() {
		// 加载前数据监听事件，目的是用我们自己的通信层，拦截MiniUI的默认的URL请求，然后把我们数据赋值给MiniUI
		var onBeforeLoadFunc = $.bindFunc(this.onBeforeLoadFunc, this);
		this.miniTree.on("beforeload", onBeforeLoadFunc);
		var onBeforeExpandFunc = $.bindFunc(this.onBeforeExpandFunc, this);
		// 展开节点前的事件调用，用于实现懒加载模式
		this.miniTree.on("beforeExpand", onBeforeExpandFunc);
		// 点击叶子节点的左键事件调用
		var onNodeClickFunc = $.bindFunc(this.onNodeClickFunc, this);
		this.miniTree.on("nodeClick", onNodeClickFunc);
		// 点击叶子节点的右键事件调用
		var onNodeRightClickFunc = $.bindFunc(this.onNodeRightClickFunc, this);
		window[this.miniTreeId + "_rightClick"] = onNodeRightClickFunc;
		// 绑定工具栏按钮上的事件
		if (this.toggleGroup) {
			var processClickButtonFunc = $.bindFunc(
					this.processClickButtonFunc, this);
			this.toggleGroup.each(function(i) {
				$(this).attr("index", i);
				// 对当前对象绑定事件
				if($.string.isNotEmpty($(this).attr("id"))){
					$(this).bindEvent(processClickButtonFunc);
				}
			});
		}
	};

	/**
	 * 创建树
	 */
	TreeBus.prototype.createTree = function() {
		if (this.treeConfig["initFunc"]) {
			eval(this.treeConfig["initFunc"] + "()");
		}
		if (this.treeConfig["isLoad"] != "false") {
			this.loadData();
		}
		var contextMenu = this.treeConfig["contextMenu"];
		if ($.string.isNotEmpty(contextMenu)) {
			if ($.string.startWith(contextMenu, "#")) {
				contextMenu = contextMenu.substring(1, contextMenu.length);
			}
			$("#" + contextMenu).find(".mini-menuitem").each(function(i) {
				$(this).attr("index", i);
			});
		}
	};

	/** ***********************************树加载数据的相关公开API，一般需要给外面对象调用*********************************** */

	/**
	 * 刷新树
	 * 
	 * @param mode
	 *            (0:刷新整个树，1：刷新当前节点--比如新增，2：刷新当前父节点---比如修改)
	 */
	TreeBus.prototype.refresh = function(mode) {
		var node = this.miniTree.getSelectedNode();
		if (mode == 1) {
			this.loadData(null, node);
		} else if (mode == 2) {
			var pNode = this.miniTree.getParentNode(node);
			this.loadData(null, pNode);
		} else {
			this.loadData();
		}
	};

	/**
	 * 加载树
	 * 
	 * @param param
	 */
	TreeBus.prototype.loadData = function(param, node, isExpand) {
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
				if (node) {
					if (dataList != null && dataList.length > 0) {
						var tempNode = dataList[0];
						if (tempNode[parentField] == node[idField]) {
							var childrenNodes = This.miniTree
									.getChildNodes(node);
							This.miniTree.removeNodes(childrenNodes);
							This.miniTree.addNodes(dataList, node);
							This.miniTree.expandNode(node);
						}
					} else {
						This.miniTree.updateNode(node, {
							"isLeaf" : true
						});
					}
				} else {
					This.miniTree.loadList(dataList, idField, parentField);
					if (isExpand) {
						This.miniTree.expandAll();
					}
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
		if($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)){
			this.frameService.processQueryList(queryTreeDataComplete, eventNo,
					reqParam, rightId, isAsync,url);
		}
	};

	/**
	 * 获取发送的参数
	 * 
	 * @param isCheck
	 */
	TreeBus.prototype.getSendParam = function(isCheck,inputs) {
		var selectNodes = [];
		if (isCheck) {
			selectNodes = this.miniTree.getCheckedNodes();
		} else {
			var selectNode =  this.miniTree.getSelectedNode();
			if(selectNode){
				selectNodes = [selectNode];
			}
		}
		if(selectNodes.length == 0){
			selectNodes.push({});
		}
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
				var value = "";
				for ( var i = 0; i < selectNodes.length; i++) {
					var v = inputs[key]+"";
					var node = selectNodes[i];
					if ($.string.isEmpty(v)) {
						if(node){
							v = node[key];
						}
						if ($.string.isEmpty(v)) {
							v = This.urlParam[key];
						}
					}else{
						v = v.replace(/\$(.*?)\$/g,
								function(p0, p1, p2) {
									var v0 = "";
									if(node){
										v0 = node[p1];
									}
									if ($.string.isEmpty(v0)) {
										v0 = This.urlParam[p1];
									}
									return v0;
								});
					}
					if ($.string.isEmpty(v)) {
						v = "";
					}else{
						v = $.string.replaceAll(v + "", ",", "$@#");
					}
					if (i < (selectNodes.length - 1)) {
						value += v + ",";
					} else {
						value += v;
					}
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
	TreeBus.prototype.onBeforeLoadFunc = function(e) {
		e.cancel = true;
	};

	/**
	 * 展开节点前的事件调用，用于实现懒加载模式
	 * 
	 * @param e
	 */
	TreeBus.prototype.onBeforeExpandFunc = function(e) {
		var node = e.node;
		if (!node.children) {
			this.loadData(null, node);
		} else {
			this.miniTree.expandNode(node);
		}
		e.cancel = true;
	};

	/**
	 * 左键点击叶子节点的事件调用
	 * 
	 * @param e
	 */
	TreeBus.prototype.onNodeClickFunc = function(e) {
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

	/**
	 * 右键点击叶子节点的事件调用
	 * 
	 * @param e
	 */
	TreeBus.prototype.onNodeRightClickFunc = function(e) {
		var contextMenu = this.treeConfig["contextMenu"];
		if ($.string.startWith(contextMenu, "#")) {
			contextMenu = contextMenu.substring(1, contextMenu.length);
		}
		var currentItem = $("#" + contextMenu).find(".mini-menuitem-hover");
		var id = currentItem.attr("id");
		var click = this.rightClickMap[id];
		if(click){
			var node = this.miniTree.getSelectedNode();
			this.processClickLeafFunc(node, click);
		}
	};

	/**
	 * 点击业务按钮
	 */
	TreeBus.prototype.processClickButtonFunc = function(e) {
		var toggleConfig = this.treeConfig["toolbar"];
		var button = $(e.currentTarget);
		var tagId = button.attr("id");
		var toggle = this.toggleMap[tagId];
		if(toggle){
			var node = this.miniTree.getSelectedNode();
			if (!node) {
				node = {};
			}
			this.processClickLeafFunc(node, toggle);
		}
	};

	/** ***********************************左右键点击事件私有处理，一般不需要给外面对象调用*********************************** */

	/**
	 * 处理左/右键点击函数
	 */
	TreeBus.prototype.processClickLeafFunc = function(treeNode, click) {
		if (!click)
			return;
		var This = this;
		var event = {};
		event.data = [ click, treeNode ];
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
				}else if (func == "refresh") {
					This.loadChildrenFunc(event);
				} else if (func == "delete") {
					This.deleteFunc(event);
				} else if (func == "submit") {
					This.submitFunc(event);
				} else if (func == "query") {
					var reqParam = {};
					if (This.miniForm) {
						var formParam = This.miniForm.getData(true, false);
						if (formParam) {
							$.copyObjToObj(formParam, reqParam);
						}
					}
					var paramFunc = click["paramFunc"];
					if (paramFunc) {
						var param = eval(paramFunc + "()");
						$.copyObjToObj(param, reqParam);
					}
					if (This.treeConfig["isLazy"] != "false") {
						This.localParam = {};
						This.loadData(reqParam, null, true);
					} else {
						var textField = This.treeConfig["textField"];
						var key = reqParam[textField];
						This.miniTree.filter(function(node) {
							if ($.string.isEmpty(key)) {
								return true;
							}
							var text = node[textField] ? node[textField]
									.toLowerCase() : "";
							if (text.indexOf(key) != -1) {
								return true;
							}
						});
						This.miniTree.expandAll();
					}
				} else {
					var reqParam = This.getSendParam(false,inputs);
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
	TreeBus.prototype.loadWindowFunc = function(event) {
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		var inputs = click["inputs"];
		var reqParam = this.getSendParam(false,inputs);
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
		var idField = this.treeConfig["idField"];
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
	TreeBus.prototype.popWindowFunc = function(event) {
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		var inputs = click["inputs"];
		var reqParam = this.getSendParam(false,inputs);
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
		var allowResize = click["allowResize"] == "true";
		var mode = click["refreshMode"]; // (0:刷新整个树，1：刷新当前节点--比如新增，2：刷新当前父节点---比如修改)
		var callbackFunc = click["callbackFunc"];
		var closeFunc = function(action) {
			if (callbackFunc) {
				var iframe = "iframe"+new Date().getTime();
				window[iframe] = this.getIFrameEl();;
				eval(callbackFunc + "('" + action + "'," + iframe
						+ ")");
				delete window[iframe];
			} else {
				if (action == "ok") {
					if (mode == 1) {
						This.loadData(null, node);
					} else if (mode == 2) {
						var pNode = This.miniTree.getParentNode(node);
						This.loadData(null, pNode);
					} else if (mode == 0){
						This.loadData();
					}
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
	TreeBus.prototype.uploadFunc = function(event){
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		var inputs = click["inputs"];
		var reqParam = this.getSendParam(false,inputs);
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
		var width = click["width"] || 600;
		var height = click["height"] || 400;
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
	TreeBus.prototype.linkFunc = function(event) {
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		var inputs = click["inputs"];
		var reqParam = this.getSendParam(false,inputs);
		var paramFunc = click["paramFunc"];
		if (paramFunc) {
			var param = eval(paramFunc + "()");
			$.copyObjToObj(param, reqParam);
		}
		var templateNo = reqParam["template_no"] || reqParam["_template_no"] || click["templateNo"];
		delete reqParam["template_no"];
		delete reqParam["_template_no"];
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
	 * 刷新节点
	 * 
	 * @param event
	 */
	TreeBus.prototype.loadChildrenFunc = function(event) {
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		this.loadData(null, node);
	};

	/**
	 * 提交功能
	 */
	TreeBus.prototype.submitFunc = function(event) {
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		var inputs = click["inputs"];
		var reqParam = this.getSendParam(false,inputs);
		var paramFunc = click["paramFunc"];
		if (paramFunc) {
			var param = eval(paramFunc + "()");
			$.copyObjToObj(param, reqParam);
		}
		var isReLoad = click["isReLoad"] != "false";
		var url = click["url"];
		var eventNo = click["eventNo"];
		var rightId = click["rightId"];
		var isAysnc = click["isAysnc"] != "false";
		var mode = click["refreshMode"]; // (0:刷新整个树，1：刷新当前节点--比如新增，2：刷新当前父节点---比如修改)
		var callbackFunc = click["callbackFunc"];
		var isAlertResultInfo = click["isAlertResultInfo"] != "false";
		var freshDictId = click["freshDictId"];
		var processSubmitComplete = function(resultVo) {
			if (resultVo.getErrorNo() == 0) {
				if($.string.isNotEmpty(freshDictId)){
					This.frameService.clearCacheDicts(freshDictId);
				}
				if(isReLoad){
					if (mode == 1) {
						This.loadData(null, node);
					} else if (mode == 2) {
						var pNode = This.miniTree.getParentNode(node);
						This.loadData(null, pNode);
					} else if (mode == 0){
						This.loadData();
					}
				}
			}
			if (callbackFunc) {
				eval(callbackFunc + "("+$.jsonToStr(resultVo.obj)+")");
			}
			if(!callbackFunc || isAlertResultInfo){
				var errorInfo = resultVo.getErrorInfo();
				if ($.string.isNotEmpty(errorInfo)) {
					window.top.mini.alert(errorInfo);
				}
			}
		};
		if($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)){
			this.frameService.processSubmit(processSubmitComplete, eventNo,
					reqParam, rightId, null, isAysnc,url);
		}
	};

	/**
	 * 
	 * 删除节点
	 */
	TreeBus.prototype.deleteFunc = function(event) {
		var This = this;
		var eventData = event.data;
		var click = eventData[0];
		var node = eventData[1];
		if (this.miniTree.isLeaf(node)) {
			var inputs = click["inputs"];
			var reqParam = this.getSendParam(false,inputs);
			var paramFunc = click["paramFunc"];
			if (paramFunc) {
				var param = eval(paramFunc + "()");
				$.copyObjToObj(param, reqParam);
			}
			var url = click["url"];
			var isReLoad = click["isReLoad"] != "false";
			var eventNo = click["eventNo"];
			var rightId = click["rightId"];
			var isAysnc = click["isAysnc"] != "false";
			var callbackFunc = click["callbackFunc"];
			var isAlertResultInfo = click["isAlertResultInfo"] != "false";
			var freshDictId = click["freshDictId"];
			var processSubmitComplete = function(resultVo) {
				if (resultVo.getErrorNo() == 0) {
					if($.string.isNotEmpty(freshDictId)){
						This.frameService.clearCacheDicts(freshDictId);
					}
					var pNode = This.miniTree.getParentNode(node);
					This.miniTree.removeNode(node);
					var childrenNodes = This.miniTree.getChildNodes(pNode);
					if(childrenNodes.length <= 0){
						This.miniTree.updateNode(pNode,{isLeaf:true});
					}
				} 
				if (callbackFunc) {
					eval(callbackFunc + "("+$.jsonToStr(resultVo.obj)+")");
				}
				if(!callbackFunc || isAlertResultInfo){
					var errorInfo = resultVo.getErrorInfo();
					if ($.string.isNotEmpty(errorInfo)) {
						window.top.mini.alert(errorInfo);
					}
				}
			};
			if($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)){
				this.frameService.processSubmit(processSubmitComplete, eventNo,
						reqParam, rightId, null, isAysnc,url);
			}
		} else {
			window.top.mini.alert("请先删除子节点！");
		}
	};

	/**
	 * 释放内存工作
	 */
	TreeBus.prototype.destroy = function() {
		this.frameService.destroy();
	};

	window.TreeBus = TreeBus;
	
	// 暴露对外的接口
	module.exports = TreeBus;
});