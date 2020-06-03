/**
 * DataGridBus的相关操作
 */
define(function(require, exports, module) {
	require("bootstrap/plugins/modal/modal.js");
	var FrameService = require("bootstrap/plugins/frame/scripts/service/frameService");

	/**
	 * 构造函数 参数: dataGridId:表格的容器的route dataGridConfig:表格的配置
	 */
	function DataGridBus(dataGridId, dataGridConfig) {

		this.componentBusMap = $.gconfig.global.componentBusMap;
		// 服务通信层
		this.frameService = FrameService.getInstance();
		// 表格配置
		this.dataGridConfig = dataGridConfig;

		this.uniqueId = this.dataGridConfig.uniqueId || "id";
		// dataGrid Jquery组件
		this.dataGrid = $("#" + dataGridId);
		// 表头配置
		this.tableHeaders = dataGridConfig["fields"];
		this.tableHeaderMap = [];

		// 关联所有的业务功能按钮组
		this.toggleGroup = $(dataGridConfig["buttonsToolbar"]).find(".btn");
		// 按钮的配置
		this.toggleMap = {};
		var toggleConfig = this.dataGridConfig["toolbar"];
		if (toggleConfig) {
			for (var i = 0; i < toggleConfig.length; i++) {
				var toggle = toggleConfig[i];
				if (toggle.tagId) {
					this.toggleMap[toggle.tagId] = toggle;
				}
			}
		}
		// 数据字典
		this.dictsMap = {};
		// 需要转化的数据字典列
		this.dictsColumn = {};

		// 浏览器上面的入参
		this.urlParam = $.net.getUrlParameter() || {};

	}
	;

	/**
	 * 初始化信息
	 */
	DataGridBus.prototype.loadViewConfig = function() {
		// 创建表格，加载数据
		this.createTable();
		// 先预加载表格整体的绑定事件
		this.onRegister();
		
		function reset_height() {
			var win_height = $(window).height();
			var panel_height = $(".panel.panel-default").outerHeight(true);
			var btn_height = $(".panel-body #toolbar").outerHeight(true);
			var table_header_height = $(".panel-body .fixed-table-header").outerHeight(true);
			var table_pagination_height = $(".panel-body .fixed-table-pagination").outerHeight(true);
			var table_body_heigth = win_height - panel_height - btn_height -table_header_height - table_pagination_height - 40; 
			
			$(".panel-body .fixed-table-body").css("height", table_body_heigth+"px");
			
		}			
		
		$(window).load(function(){
			reset_height();
		});
		$(window).resize(function() {
			reset_height();
		});

	};

	/**
	 * 表格注册事件监听
	 */
	DataGridBus.prototype.onRegister = function() {
		var This = this;
	
		// 表格的行选中状态改变事件的处理
		var selectRowChangedFunc = $.bindFunc(this.selectRowChangedFunc, this);
		this.dataGrid.on("check.bs.table", selectRowChangedFunc);
		//表格的行取消选中状态改变事件的处理
		var selectRowChangedFunc = $.bindFunc(this.selectRowChangedFunc, this);
		this.dataGrid.on("uncheck.bs.table", selectRowChangedFunc);
		//单击事件，选中选择的行
		var onClickRowChangedFunc = $.bindFunc(this.onClickRowChangedFunc, this);
		this.dataGrid.on("click-row.bs.table", onClickRowChangedFunc);
		//双击事件，弹出第一个弹层的页面
		var doubleClickRowFunc = $.bindFunc(this.doubleClickRowFunc, this);
		this.dataGrid.on("dbl-click-row.bs.table", doubleClickRowFunc);
		

		// 绑定工具栏按钮上的事件
		if (this.toggleGroup) {
			var processClickButtonFunc = $.bindFunc(
					this.processClickButtonFunc, this);
			this.toggleGroup.each(function(i) {
				$(this).attr("index", i);
				var tagId = $(this).attr("id");
				if ($.string.isNotEmpty(tagId)) {
					var toggle = This.toggleMap[tagId];
					if (toggle) {
						if (toggle["isSelect"] == "true"
								|| toggle["isMulSelect"] == "true") {
							$(this).addClass('disabled');
						}
						// 对当前对象绑定事件
						$(this).bindEvent(processClickButtonFunc);
					}
				}
			});
		}
		
		this.dataGrid.bindChildEvent("a[type='javascript']", function () {
			var rowNum = $(this).attr("rownum_");
			var record = This.dataGrid.bootstrapTable('getRowByUniqueId',rowNum);
            var field = $(this).attr("field");
            var header = This.tableHeaderMap[field];
            var index = $(this).attr("index");
            if (header) {
                var items = header.items;
                if (items && items.length > 0) {
                    var item = items[index];
                    var records = [record];
                    This.processAction(item, records);
                }
            }
        });
	};

	/**
	 * 创建表格
	 */
	DataGridBus.prototype.createTable = function() {
		var This = this;

		var columns = new Array();

		if (this.tableHeaders != null && this.tableHeaders.length > 0) {
			for (var i = 0; i < this.tableHeaders.length; i++) {
				var header = this.tableHeaders[i];
				this.tableHeaderMap[header.field] = header;
				var column = {};
				for ( var key in header) {
					column[key] = header[key];
				}
				var formatter = function(value, record, index) {
					var items = header.items;
					var html = "";
					if (items && items.length > 0) {
						for (var j = 0; j < items.length; j++) {
							var item = items[j];
							var displayName = item.title;
							var func = item["function"];
							if (func == "link") {
								var selectRow = {};
								var inputs = item.inputs;
								if ($.string.isNotEmpty(inputs)) {
									inputs = eval("({" + inputs + "})");
									for ( var key in inputs) {
										var value = inputs[key] + "";
										if ($.string.isEmpty(value)) {
											value = record[key];
											if ($.string.isEmpty(value)) {
												value = This.urlParam[key];
											}
										} else {
											value = value
													.replace(
															/\$(.*?)\$/g,
															function(p0, p1, p2) {
																var v = record[p1];
																if ($.string
																		.isEmpty(v)) {
																	v = This.urlParam[p1];
																}
																return v;
															});
										}
										if ($.string.isEmpty(value)) {
											value = "";
										}
										selectRow[key] = value;
									}
								}
								var paramFunc = item["paramFunc"];
								if (paramFunc) {
									var param = eval(paramFunc + "()");
									$.copyObjToObj(param, selectRow);
								}
								var isSign = item["isSign"] == "true";
								var isEncodeURI = item["isEncodeURI"] != "false";
								var href = item["url"];
								var eventNo = item["eventNo"];
								if ($.string.isNotEmpty(eventNo)) {
									selectRow["_event_no"] = eventNo;
								}
								var templateNo = selectRow["template_no"]
										|| selectRow["_template_no"]
										|| item["templateNo"];
								if (isEncodeURI && selectRow) {
									for ( var sk in selectRow) {
										var sv = selectRow[sk];
										if (typeof (sv) == "undefined"
												|| sv === null || sv === "") {
											selectRow[sk] = "";
										} else {
											sv = encodeURIComponent(sv + "");
											selectRow[sk] = sv;
										}
									}
								}
								href = This.frameService.getCommonUrl(
										templateNo, selectRow, href, isSign);
								html += "<a  href='"
										+ href
										+ "' type='link' target='_blank' index='"
										+ j + "' field='" + column.field + "'>"
										+ displayName + "</a>";
							} else {
								var tagId = item["tagId"];
								if ($.string.isEmpty(tagId)) {
									tagId = "";
								} 
								var uniqueId = This.uniqueId;
								html += "<a  href='javascript:void(0)'  type='javascript' tagId='"
										+ tagId
										+ "' index='"
										+j
										+"' rownum_ =  '"
										+ record[uniqueId]
										+ "' field='"
										+ column.field
										+ "'>"
										+ displayName
										+ "</a>";
							}
							 if (j < (items.length - 1)) {
		                            html += "&nbsp;";
		                        }
						}
					}
					return  html;
				}
				if (header.dataType == "javascript") {
					column.formatter = formatter;
				}
				columns.push(column);

				if (header.dataType == "select") {
					var dictId = header.format;
					this.dictsColumn[header['field']] = dictId;
					var inputs = header.inputs;
					if ($.string.isNotEmpty(inputs)) {
						inputs = eval("({" + inputs + "})");
					} else {
						inputs = {};
					}
					for ( var key in inputs) {
						var value = inputs[key] + "";
						if ($.string.isNotEmpty(value)) {
							value = value.replace(/\$(.*?)\$/g, function(p0,
									p1, p2) {
								return This.urlParam[p1];
							});
						}
						if ($.string.isEmpty(value)) {
							value = "";
						}
						inputs[key] = value;
					}
					var paramFunc = header["paramFunc"];
					if (paramFunc) {
						var param = eval(paramFunc + "()");
						$.copyObjToObj(param, inputs);
					}
					var queryDictsComplete = function(resultVo) {
						if (resultVo.getErrorNo() == 0) {
							var result = resultVo.getResults();
							var dicMap = {};
							var dicList = result[dictId];
							if (dicList && dicList.length > 0) {
								dicList = $.strToJson(dicList);
								for (var k = 0; k < dicList.length; k++) {
									var dicData = dicList[k];
									var key = dicData["item_value"];
									var value = dicData["item_name"];
									dicMap[key] = value;
								}
							}
							This.dictsMap[column.field] = dicMap;

						}
					};
					This.frameService.queryDicts(inputs, dictId, false,
							queryDictsComplete);
				}
			}
		}
		var initTableData = function(e) {
			var error_no = e.error_no;
			if (error_no == 0) {
				var data = e.results;
				var tableData = {};
				tableData.total = data[0].totalRows;
				tableData.rows = data[0].data;
				// 处理数据字典需求
				if (This.dictsColumn != null) {
					for ( var key in This.dictsColumn) {
						var dic = This.dictsMap[key];
						for (var i = 0; i < tableData.rows.length; i++) {
							var dictValue = dic[tableData.rows[i][key]];
							tableData.rows[i][key] = dictValue;
						}
					}
				}
				return tableData;
			}
		}

		this.dataGrid.bootstrapTable({
			url : "/servlet/ModuleEvent",
			dataType : "json",
			method : "get",
			pagination : this.dataGridConfig.pagination, // 分页
			singleSelect : false,
			uniqueId:	This.uniqueId,
			sidePagination : this.dataGridConfig.sidePagination, // 服务端处理分页
			height : this.dataGridConfig.height,
			pageSize : this.dataGridConfig.pageSize,
			columns : columns,
			responseHandler : initTableData,
			queryParams : function(params) {
				var param = This.urlParam;
				param._event_no = This.dataGridConfig.eventNo;
				param.pageIndex = (params.offset / params.limit) + 1;
				param.pageSize = params.limit;
				param.isExport = 1;
				return param;
			}
		});
	};

	/** ***********************************表格创建加载数据的相关公开API，一般需要给外面对象调用*********************************** */

	/**
	 * 重新加载页面
	 */
	DataGridBus.prototype.refresh = function() {
		this.dataGrid.bootstrapTable('refresh');
	};

	/**
	 * 得到翻页数据
	 * 
	 * @return {}
	 */
	DataGridBus.prototype.getPage = function() {
		return this.page;
	};

	/**
	 * 得到表格所有选中的数据，是一个数组
	 */
	DataGridBus.prototype.getSelectedItems = function() {
		return this.dataGrid.bootstrapTable('getAllSelections');
	}; 

	/**
	 * 得到选择的指定列的值
	 */
	DataGridBus.prototype.getSelectFiled = function(filed) {
		var value = "";
		var selectedItems = this.getSelectedItem();
		for (var j = 0; j < selectedItems.length; j++) {
			var selectedItem = selectedItems[j];
			var v = selectedItem[filed] + "";
			if ($.string.isEmpty(v)) {
				v = "";
			}
			v = $.string.replaceAll(v + "", ",", "$@#");
			value += (v + ",");
		}
		if (value.length > 1) {
			value = fileds.substring(0, value.length - 1);
		}
		return value;
	};

	/**
	 * 设置翻页数据
	 * 
	 * @param {}
	 *            pageData
	 */
	DataGridBus.prototype.putPageData = function(pageData) {
		this.page = pageData;
		var tableData = {};
		tableData.total = this.page.totalRows;
		tableData.rows = this.page.data;
		this.dataGrid.bootstrapTable('load', tableData);
		this.dataGrid.bootstrapTable('hideLoading');
	};

	/**
	 * 释放内存工作
	 */
	DataGridBus.prototype.destroy = function() {
		// 清空数据
		this.dataGrid.bootstrapTable('destroy');
		this.frameService.destroy();
	};

	/** ***********************************表格处理事件私有处理，一般不需要给外面对象调用*********************************** */

	/**
	*   表格的单击事件处理 
	*/
	DataGridBus.prototype.onClickRowChangedFunc = function(e,row,$element){
		
		var index= $element.data('index');
		//$("tr[data-index="+index+"]").attr("class","selected");
		//$("input[data-index="+index+"]").attr("checked",true);
		$("input[data-index="+index+"]").click();
		//this.selectRowChangedFunc();
	}

	/**
	 * 表格的双击事件处理
	 */
	DataGridBus.prototype.doubleClickRowFunc = function(e) {
		This = this; 
		var totalCount = this.dataGrid.bootstrapTable('getData').length;
		if ( totalCount > 0) {
			if (this.toggleGroup) {
				this.toggleGroup.each(function (i) {
					var tagId = $(this).attr("id");
					if ($.string.isNotEmpty(tagId)) {
						var toggle = This.toggleMap[tagId];
						if (toggle) {
							if (toggle["isSelect"] == "true"
								&& toggle["function"] == "popWindow") {
								if (!($(this).css("display") == "none")) {
									$(this).click();
									//return false;
								}
							}
						}
					}
				});
			}
		}
	};

	/**
	 * 表格的行选中状态改变事件的处理
	 */
	DataGridBus.prototype.selectRowChangedFunc = function(e) {
		var This = this;
		var totalCount = this.dataGrid.bootstrapTable('getData').length;
		if (this.toggleGroup) {
			var selectItems = this.getSelectedItems();
			var selectItem = this.dataGrid.bootstrapTable('getSelections');
			this.toggleGroup.each(function(i) {
				var tagId = $(this).attr("id");
				if ($.string.isNotEmpty(tagId)) {
					var toggle = This.toggleMap[tagId];
					if (toggle) {
						if (toggle["isSelect"] == "true") {
							if (selectItem && totalCount > 0
									&& selectItems.length == 1) {
								$(this).removeClass("disabled");
							} else {
								$(this).addClass('disabled');
							}
						} else if (toggle["isMulSelect"] == "true") {
							if (selectItems && selectItems.length > 0
									&& totalCount > 0) {
								$(this).removeClass("disabled");
							} else {
								$(this).addClass('disabled');
							}
						} else {
							$(this).removeClass("disabled");
						}
					}
				}
			});
		}
	};

	/** ***********************************工具栏按钮事件私有处理，一般不需要给外面对象调用*********************************** */

	/**
	 * 点击业务按钮
	 */
	DataGridBus.prototype.processClickButtonFunc = function(e) {
		var button = $(e.currentTarget);
		if (button.hasClass("disabled")) {
			return;
		}
		var tagId = button.attr("id");
		var toggle = this.toggleMap[tagId];
		if (toggle) {
			var selectItems = this.getSelectedItems();
			var selectItem = this.dataGrid.bootstrapTable('getSelections');
			var totalCount = this.dataGrid.bootstrapTable('getData').length;
			if (toggle["isSelect"] == "true") {
				if (!(selectItem && totalCount > 0 && selectItems.length < 2)) {
					window.top.Ewin.alert({
						message : "请选择一行数据进行操作！"
					});
					return;
				} else if (toggle["isMulSelect"] == "true") {
					if (!(selectItems && selectItems.length > 0 && totalCount > 0)) {
						window.top.Ewin.alert({
							message : "请选择需要操作的数据！"
						});
						return;
					}
				}
			}
			var records = [];
			if (toggle["isSelect"] == "true") {
				var selectItem = this.dataGrid.bootstrapTable('getSelections');
				records = [ selectItem ][0];
			} else if (toggle["isMulSelect"] == "true") {
				records = this.getSelectedItems();
			}
			this.processAction(toggle, records);
		}
	};

	/**
	 * 处理相关用户点击动作函数
	 * 
	 * @param config
	 * @param records
	 */
	DataGridBus.prototype.processAction = function(config, records) {
		var This = this;
		var isAlert = config["isAlert"] == "true";
		var alertMsg = config["alertMsg"] || "是否确认操作？";
		var isClose = config["isClose"] == "true";
		var func = config["function"];
		var doAction = function() {
			if ($.string.isNotEmpty(func)) {
				var filterFunc = config["filterFunc"];
				if (filterFunc) {
					var flag = eval(filterFunc + "()");
					if (!flag) {
						return;
					}
				}
				if (func == "refresh") {
					This.refresh();
				} else if (func == "export") {
					var param = {};
                    var paramFunc = config["paramFunc"];
                    if (paramFunc) {
                        param = eval(paramFunc + "()");
                    }
                    var event_no = config["eventNo"];
                    This.exportExcel(event_no, param);
				} else {
					var selectRow = {};
					var inputs = config.inputs;
					if ($.string.isNotEmpty(inputs)) {
						inputs = eval("({" + inputs + "})");
						// var formParam = This.miniForm.getData(true, false);
						for ( var key in inputs) {
							var value = "";
							if (records && records.length > 0) {
								for (var i = 0; i < records.length; i++) {
									var v = inputs[key] + "";
									var record = records[i];
									if ($.string.isEmpty(v)) {
										v = record[key];
										// if ($.string.isEmpty(v)) {
										// if (formParam) {
										// v = formParam[key];
										// }
										// }
										if ($.string.isEmpty(v)) {
											v = This.urlParam[key];
										}
									} else {
										v = v.replace(/\$(.*?)\$/g, function(
												p0, p1, p2) {
											var v0 = record[p1];
											// if ($.string.isEmpty(v0)) {
											// if (formParam) {
											// v0 = formParam[p1];
											// }
											// }
											if ($.string.isEmpty(v0)) {
												v0 = This.urlParam[p1];
											}
											return v0;
										});
									}
									if ($.string.isEmpty(v)) {
										v = "";
									} else {
										v = $.string.replaceAll(v + "", ",",
												"$@#");
									}
									if (i < (records.length - 1)) {
										value += v + ",";
									} else {
										value += v;
									}
								}
							} else {
								value = inputs[key] + "";
								if ($.string.isEmpty(value)) {
									// if (formParam) {
									// value = formParam[key];
									// }
									if ($.string.isEmpty(value)) {
										value = This.urlParam[key];
									}
								} else {
									value = value.replace(/\$(.*?)\$/g,
											function(p0, p1, p2) {
												var v0 = "";
												// if (formParam) {
												// v0 = formParam[p1];
												// }
												if ($.string.isEmpty(v0)) {
													v0 = This.urlParam[p1];
												}
												return v0;
											});
								}
								if ($.string.isEmpty(value)) {
									value = "";
								}
							}
							selectRow[key] = value;
						}
					}
					var paramFunc = config["paramFunc"];
					if (paramFunc) {
						var param = eval(paramFunc + "()");
						$.copyObjToObj(param, selectRow);
					}
					var callbackFunc = config["callbackFunc"];
					if (func == "query") {

					} else if (func == "popWindow") {
						var title = config["title"] || selectRow["title"]
								|| "信息";
						var selectItem = This.dataGrid
								.bootstrapTable('getSelections');
						title = title.replace(/\$(.*?)\$/g,
								function(p0, p1, p2) {
									var value = selectRow[p1];
									if ($.string.isEmpty(value) && selectItem) {
										value = selectItem[p1];
									}
									if ($.string.isEmpty(value)) {
										value = "";
									}
									return value;
								});
						var templateNo = selectRow["template_no"]
								|| selectRow["_template_no"]
								|| config["templateNo"];
						delete selectRow["template_no"];
						delete selectRow["_template_no"];
						var width = config["width"] || 600;
						var height = config["height"] || 600;
						var popWidth = config["popWidth"] || "600px";
						var isMax = config["isMax"] == "true";
						var allowResize = config["allowResize"] == "true";
						var closeFunc = function(action) {
							if (callbackFunc) {
								var iframe = "iframe" + new Date().getTime();
								window[iframe] = this.getIFrameEl();
								eval(callbackFunc + "('" + action + "',"
										+ iframe + ")");
							} else {
								if (action == "ok") {
									This.selectPageMaps = {};
									This.refresh();
								}
							}
						};
						var url = config["url"] || selectRow["url"]
								|| selectRow["link_url"];
						delete selectRow["url"];
						delete selectRow["link_url"];
						var isSign = config["isSign"] == "true";
						var templateUrl = This.frameService.getCommonUrl(
								templateNo, selectRow, url, isSign);
						window.top.Ewin.dialog({
							url : templateUrl,
							title : title,
							width : width,
							height : height,
							popWidth : popWidth
						});
					} else if (func == "upload") {

					} else if (func == "link") {
						var eventNo = config["eventNo"];
						var templateNo = selectRow["template_no"]
								|| selectRow["_template_no"]
								|| config["templateNo"];
						delete selectRow["template_no"];
						delete selectRow["_template_no"];
						var url = config["url"] || selectRow["url"]
								|| selectRow["link_url"];
						delete selectRow["url"];
						delete selectRow["link_url"];
						var isEncodeURI = config["isEncodeURI"] != "false";
						var isSign = config["isSign"] == "true";
						if ($.string.isNotEmpty(eventNo)) {
							selectRow["_event_no"] = eventNo;
						}
						if (isEncodeURI && selectRow) {
							for ( var sk in selectRow) {
								var sv = selectRow[sk];
								if (typeof (sv) == "undefined" || sv === null
										|| sv === "") {
									selectRow[sk] = "";
								} else {
									sv = encodeURIComponent(sv + "");
									selectRow[sk] = sv;
								}
							}
						}
						url = This.frameService.getCommonUrl(templateNo,
								selectRow, url, isSign);
						window.open(url, "_blank");
					} else if (func == "submit" || func == "delete"
							|| func == "save") {
						This.selectPageMaps = {};
						var isReLoad = config["isReLoad"] != "false";
						var eventNo = config["eventNo"];
						var rightId = config["rightId"];
						var isAysnc = config["isAysnc"] != "false";
						var isAlertResultInfo = config["isAlertResultInfo"] != "false";
						var url = config["url"];
						var freshDictId = config["freshDictId"];
						if (func == "save") {
							// var data = This.miniDataGrid.getChanges();
							// if (data && data.length > 0) {
							// var dataStr = $.jsonToStr(data);
							// selectRow["data"] = dataStr;
							// }
						}
						var processSubmitComplete = function(resultVo) {
							if (resultVo.getErrorNo() == 0) {
								if ($.string.isNotEmpty(freshDictId)) {
									This.frameService
											.clearCacheDicts(freshDictId);
								}
							}
							if (resultVo.getErrorNo() == 0 && isReLoad) {
								if (callbackFunc) {
									eval(callbackFunc + "("
											+ $.jsonToStr(resultVo.obj) + ")");
								} else {
									This.refresh();
								}
								if (isClose) {
									This.frameService.closeWindow("ok");
								}
							} else {
								if (callbackFunc) {
									eval(callbackFunc + "("
											+ $.jsonToStr(resultVo.obj) + ")");
								}
							}
							if (!callbackFunc || isAlertResultInfo) {
								var errorInfo = resultVo.getErrorInfo();
								if ($.string.isNotEmpty(errorInfo)) {
									window.top.Ewin.alert({
										message : errorInfo
									});
								}
							}
						};
						if ($.string.isNotEmpty(eventNo)
								|| $.string.isNotEmpty(url)) {
							This.frameService.processSubmit(
									processSubmitComplete, eventNo, selectRow,
									rightId, null, isAysnc, url);
						}
					} else if (func == "examine") {

					} else {
						eval(func + "(" + $.jsonToStr(selectRow) + ")");
					}
				}
			} else {
				if (isClose) {
					This.frameService.closeWindow("cancel");
				}
			}
		};
		if (isAlert) {
			window.top.Ewin.confirm({
				message : alertMsg
			}).on(function(e) {
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
     * 导出Excel
     *
     * @param {}
     *            buttonObj
     */
    DataGridBus.prototype.exportExcel = function (event_no, params) 
	{ 
		var totalCount = this.dataGrid.bootstrapTable('getData').length;
        if (!this.dataGrid || totalCount == 0) { 
			window.top.Ewin.alert({
				message : "暂无可导出的数据！"
			});
        } else {
            var titles = "";
            var fields = "";
            var fmtType = "";
            var dicts = "";
            var columns = this.tableHeaders;
            if (columns != null && columns.length > 0) {
                for (var i = 0; i < columns.length; i++) {
                    var column = columns[i];  
					if ( column.checkbox) {
						
					}else{ 
						var formatType = column.dataType;
						if (formatType == "select") { 
							var dictId = column.format;
							var inputs = column.inputs;
							dicts += (dictId + ";" + inputs + "|"); 
						} else {
							dicts += " |";
						}
						fields += column.field + "|";
						titles += column.title + "|";
						fmtType += formatType == "" ? formatType + " |" : formatType
							+ "|";
					}
				} 
            }
            if (titles.length > 0) {
                titles = titles.substring(0, titles.length - 1);
            }
            if (fields.length > 0) {
                fields = fields.substring(0, fields.length - 1);
            }
            if (fmtType.length > 0) {
                fmtType = fmtType.substring(0, fmtType.length - 1);
            }
            if (dicts.length > 0) {
                dicts = dicts.substring(0, dicts.length - 1);
            }
            if ($.string.isEmpty(event_no)) {
                event_no = this.dataGridConfig["eventNo"];
            }
            var pageIndex = this.dataGrid.bootstrapTable('getOptions').pageNumber;
            var pageSize  = this.dataGrid.bootstrapTable('getOptions').pageSize; 
            var param = new Object();
            var url = $.gconfig.platRoot + "servlet/BootstrapExport";
            /*param.titles = encodeURI(encodeURI($.string.replaceAll(titles,"undefined","")));*/
            fields = $.string.replaceAll(fields, "undefined", " ");
            fmtType = $.string.replaceAll(fmtType, "undefined", " ");
            dicts = $.string.replaceAll(dicts, "undefined", " ");
            titles = encodeURIComponent(titles);
//			param.fields = fields;
//			param.fmtType = fmtType;
//			param.dicts = dicts; 
            param.totalCount = totalCount;
            param.pageIndex = pageIndex;
            param.pageSize = pageSize; 
            if (params) {
                $.copyObjToObj(params, param, false);
            }
            var closeFunc = function(e) {  
				var data = window.top.GetExportData;  
				if(data != null){
					param.pageIndex = data.exportPageIndex;
					param.pageSize = data.exportPageSize;
					param.startPage = data.startPage;
					param.endPage = data.endPage;
					param.records = data.records;
					param.export_type = data.export_type;
					window.top.GetExportData = null;
					var frameService = FrameService.getInstance();
					frameService.exportExcel(event_no,data.exportPage,data.records,data.fileName,titles,fields,dicts,fmtType,param,"");
				} 
    		}
            this.frameService.popWindow("导出", "", param, "600", "500","", null,closeFunc, url, "");
			 
        }
    };
 

	window.DataGridBus = DataGridBus;
	// 暴露对外的接口
	module.exports = DataGridBus;

});
