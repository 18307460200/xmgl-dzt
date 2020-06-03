/**
 * TreeGridBus的相关操作
 */
define(function (require, exports, module) {
    require("plugins/frame/scripts/jquery.zclip.min.js");
    var FrameService = require("plugins/frame/scripts/service/frameService");

    /**
     * 构造函数 参数: treeGridId:表格的容器的route treeGridConfig:表格的配置
     */
    function TreeGridBus(treeGridId, treeGridConfig) {
        mini.parse();
        this.componentBusMap = $.gconfig.global.componentBusMap;
        // 服务通信层
        this.frameService = FrameService.getInstance();
        // 表格配置
        this.treeGridConfig = treeGridConfig;
        // treeGrid Jquery组件
        this.treeGrid = $("#" + treeGridId);
        // treeGrid MiniUI组件
        this.miniDataGrid = mini.get(this.treeGrid.find(".mini-treegrid").attr(
            "id"));
        // treeGrid 下面的小的Form MiniUI组件
        this.miniForm = new mini.Form("#" + treeGridId);
        // jQuery表格对象
        this.tableComponet = this.treeGrid.find(".mini-treegrid");
        // var sorter = new MultiSort(this.miniDataGrid);
        // 表头配置
        this.tableHeaders = treeGridConfig["fields"];
        this.tableHeaderMap = {};
        // 数据字典
        this.dictsMap = {};
        // 关联所有的业务功能按钮组
        this.toggleGroup = this.treeGrid.find(".mini-button");
        // 按钮的配置
        this.toggleMap = {};
        var toggleConfig = this.treeGridConfig["toolbar"];
        if (toggleConfig) {
            for (var i = 0; i < toggleConfig.length; i++) {
                var toggle = toggleConfig[i];
                if (toggle.tagId) {
                    this.toggleMap[toggle.tagId] = toggle;
                }
            }
        }
        // 翻页对象
        this.page = null;
        // 默认关联form表单
        this.formPanleId = treeGridConfig["defaultForm"];
        if (this.formPanleId) {
            // 前一次查询的参数，默认取关联的form表单对象里面的参数
            var form = $.tkui[this.formPanleId];
            if (form) {
                this.localParam = form.getReqParam();
            } else {
                this.localParam = {};
            }
        }
        // 浏览器上面的入参
        this.urlParam = mini.getParams() || {};
        //选择的数据
        this.selectPageMaps = {};
        
    };

    /**
     * 初始化信息
     */
    TreeGridBus.prototype.loadViewConfig = function () {
        // 先预加载表格整体的绑定事件
        this.onRegister();
        // 创建表格，加载数据
        this.createTable();
    };

    /**
     * 表格注册事件监听
     */
    TreeGridBus.prototype.onRegister = function () {
        var This = this;
        // 加载前数据监听事件，目的是用我们自己的通信层，拦截MiniUI的默认的URL请求，然后把我们数据赋值给MiniUI
        var onBeforeLoadFunc = $.bindFunc(this.onBeforeLoadFunc, this);
        this.miniDataGrid.on("beforeload", onBeforeLoadFunc);
        // 单元格渲染处理事件,处理每行数据的展示，可能要格式化，计算，数据字典转换之类
        var onDrawCellFunc = $.bindFunc(this.onDrawCellFunc, this);
        this.miniDataGrid.on("drawcell", onDrawCellFunc);
        // 渲染完成后，绑定处理自定义的单元格的事件
        var onCellEventFunc = $.bindFunc(this.onCellEventFunc, this);
        this.miniDataGrid.on("update", onCellEventFunc);
        this.miniDataGrid.on("cellbeginedit", function () {
            setTimeout(onCellEventFunc, 1)
        });
        this.miniDataGrid.on("cellendedit", onCellEventFunc);
        // 表格的双击事件处理
        var doubleClickRowFunc = $.bindFunc(this.doubleClickRowFunc, this);
        this.miniDataGrid.on("rowdblclick", doubleClickRowFunc);
        // 表格的行选中状态改变事件的处理
        var selectRowChangedFunc = $.bindFunc(this.selectRowChangedFunc, this);
        this.miniDataGrid.on("selectionchanged", selectRowChangedFunc);
        
        // 绑定工具栏按钮上的事件
        if (this.toggleGroup) {
            var processClickButtonFunc = $.bindFunc(
                this.processClickButtonFunc, this);
            this.toggleGroup.each(function (i) {
                $(this).attr("index", i);
                var tagId = $(this).attr("id");
                if ($.string.isNotEmpty(tagId)) {
                    var toggle = This.toggleMap[tagId];
                    if (toggle) {
                        if (toggle["isSelect"] == "true"
                            || toggle["isMulSelect"] == "true") {
                            $(this).attr("class",
                                "mini-button mini-button-disabled");
                        }
                        // 对当前对象绑定事件
                        $(this).bindEvent(processClickButtonFunc);
                    }
                }
            });
        }
    };
    
    
    /**
	 * 构建树型结构
	 * @param dataList
	 */
    TreeGridBus.prototype.buildTreeDataList = function(formField,dataList){
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
	TreeGridBus.prototype.getChildCatalogIndex = function(formField,data, dataList){
		var pid = formField.getParentField();
		var id = formField.getIdField();
		for (var i = 0; i < dataList.length; i++){
			var catalog = dataList[i];
			if(catalog[pid] == data[id]){
				return i;
			}
		}
		return -1;
	};
	
    /**
     * 创建表格
     */
    TreeGridBus.prototype.createTable = function () {
        var This = this;
        var columns = this.miniDataGrid.columns;
        if (this.tableHeaders != null && this.tableHeaders.length > 0) {
            for (var i = 0; i < this.tableHeaders.length; i++) {
                var header = this.tableHeaders[i];
                this.tableHeaderMap[header.field] = header;
            }
        }
        var lastColumns = [];
        var buildColumns = function (columns) {
            if (columns != null && columns.length > 0) {
                for (var i = 0; i < columns.length; i++) {
                    var column = columns[i];
                    if (column.columns && column.columns.length > 0) {
                        buildColumns(column.columns);
                    } else {
                        lastColumns.push(column);
                    }
                }
            }
        };
        buildColumns(columns);
        if (lastColumns != null && lastColumns.length > 0) {
            for (var i = 0; i < lastColumns.length; i++) {
                var column = lastColumns[i];
                if (column.dataType == "int" || column.dataType == "float"
                    || column.dataType == "currency") {
                    var header = this.tableHeaderMap[column.field];
                    if (header && $.string.isNotEmpty(header.format)) {
                        column.numberFormat = header.format;
                    }
                } else if (column.dataType == "date") {
                    var header = this.tableHeaderMap[column.field];
                    if (header && $.string.isNotEmpty(header.format)) {
                        column.dateFormat = header.format;
                    }
                } else if (column.dataType == "select" || column.type
                    == "comboboxcolumn") {
                    var header = this.tableHeaderMap[column.field];
                    if (header) {
                        var dictId = header.format;
                        var inputs = header.inputs;
                        var data = header.data;
                        if (data && data.length > 0) {
                            var dicts = {};
                            for (var j = 0; j < data.length; j++) {
                                var result = data[j];
                                dicts[result.item_value] = result.item_name;
                            }
                            This.dictsMap[column.field] = dicts;
                        } else {
                            if ($.string.isNotEmpty(inputs)) {
                                inputs = eval("({" + inputs + "})");
                            } else {
                                inputs = {};
                            }
                            for (var key in inputs) {
                                var value = inputs[key] + "";
                                if ($.string.isNotEmpty(value)) {
                                    value = value.replace(/\$(.*?)\$/g,
                                        function (p0, p1, p2) {
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
                            var queryDictsComplete = function (resultVo) {
                                if (resultVo.getErrorNo() == 0) {
                                    var result = resultVo.getResults();
                                    var dicMap = {};
                                    var dicList = result[dictId];
                                    var gendersData = [];
                                    if (dicList && dicList.length > 0) {
                                        dicList = $.strToJson(dicList);
                                        for (var k = 0; k < dicList.length; k++) {
                                            var dicData = dicList[k];
                                            var key = dicData["item_value"];
                                            var value = dicData["item_name"];
                                            dicMap[key] = value;
                                            var gender = {"id": key, "text": value};
                                            gendersData.push(gender);
                                        }
                                    }
                                    This.dictsMap[column.field] = dicMap;
                                    if (column.type == "comboboxcolumn") {
                                        window[column.field + "Genders"] = gendersData;
                                    }
                                }
                            };
                            This.frameService.queryDicts(inputs, dictId,
                                false, queryDictsComplete);
                        }
                    }
                }
            }
        }
        if (this.treeGridConfig["initFunc"]) {
            eval(this.treeGridConfig["initFunc"] + "()");
        }
        var param = {};
        if (this.treeGridConfig["isLoad"] != "false") {
            this.miniDataGrid.load(param);
        } else {
            this.localParam = param;
        }
        if (this.treeGridConfig["isPage"] != "false") {
            this.miniDataGrid.setShowPager(true);
        } else {
            this.miniDataGrid.setShowPager(false);
        }
    };


    /** ***********************************表格创建加载数据的相关公开API，一般需要给外面对象调用*********************************** */

    /**
     * 加载表格数据
     */
    TreeGridBus.prototype.loadData = function (param, formPanelId, event_no) {
        if (param) {
            if ($.string.isNotEmpty(event_no)) {
                param["_event_no"] = event_no;
            }
            this.localParam = param;
        }
        if (formPanelId) {
            this.formPanleId = formPanelId;
        }
        this.miniDataGrid.setPageIndex(0);
        this.selectPageMaps = {};
        this.miniDataGrid.load(param);
    };

    /**
     * 重新加载页面
     */
    TreeGridBus.prototype.refresh = function () {
        this.miniDataGrid.reload();
    };

    /**
     * 得到翻页数据
     *
     * @return {}
     */
    TreeGridBus.prototype.getPage = function () {
        return this.page;
    };

    /**
     * 得到表格所有选中的数据，是一个数组
     */
    TreeGridBus.prototype.getSelectedItems = function () {
    	return this.miniDataGrid.getSelecteds();
    };

    /**
     * 得到表格当前选中的数据，是一个对象
     */
    TreeGridBus.prototype.getSelectedItem = function () {
        return this.miniDataGrid.getSelected();
    };

    /**
     * 得到行数据
     *
     * @param {}
     *            rowId
     */
    TreeGridBus.prototype.getRowData = function (rowId) {
        return this.miniDataGrid.getRowByUID(rowId);
    };

    /**
     * 得到选择的指定列的值
     */
    TreeGridBus.prototype.getSelectFiled = function (filed) {
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
    TreeGridBus.prototype.putPageData = function (pageData) {
        this.page = pageData;
        this.miniDataGrid.deselectAll(true);
        if (this.treeGridConfig["isPage"] != "false") {
            if (!this.page || this.page.totalRows == 0) {
                this.treeGrid
                    .find(".mini-grid-rowstable")
                    .html(
                        '<tbody><tr style="height:0px;"><td class="mini-grid-emptyText" style="text-align:center" colspan="100">没有返回的数据</td></tr></tbody>');
                this.miniDataGrid.setTotalCount(0);
            } else {
                var data = this.page.data;
                this.miniDataGrid.setData(data);
                this.miniDataGrid.setTotalCount(this.page.totalRows);
            }
        } else {
            if (!this.page || this.page.length == 0) {
                this.treeGrid
                    .find(".mini-grid-rowstable")
                    .html(
                        '<tbody><tr style="height:0px;"><td class="mini-grid-emptyText" style="text-align:center" colspan="100">没有返回的数据</td></tr></tbody>');
                this.miniDataGrid.setTotalCount(0);
            } else { 
				this.page = this.buildTreeDataList(this.miniDataGrid,this.page);
                this.miniDataGrid.setData(this.page);
                this.miniDataGrid.setTotalCount(this.page.length);
            }
        }
    };

    /**
     * 重新绘制表格
     */
    TreeGridBus.prototype.reDrawTable = function (param) {

    };

    /**
     * 释放内存工作
     */
    TreeGridBus.prototype.destroy = function () {
        // 清空数据
        this.miniDataGrid.clearRows();
        this.frameService.destroy();
    };

    /** ***********************************表格处理事件私有处理，一般不需要给外面对象调用*********************************** */

    /**
     * 加载前数据监听事件，目的是用我们自己的通信层，拦截MiniUI的默认的URL请求，然后把我们数据赋值给MiniUI
     */
    TreeGridBus.prototype.onBeforeLoadFunc = function (e) {
        var This = this;
        var sender = e.sender;
        var param = e.data;
        var doLoad = function () {
            var reqParam = {};
            for (var key in param) {
                if (key == "pageIndex") {
                    reqParam["pageIndex"] = param["pageIndex"] + 1;
                } else if (key == "pageSize") {
                    reqParam["pageSize"] = param["pageSize"];
                } else if (key == "sortField") {
                    reqParam["sortField"] = param["sortField"];
                } else if (key == "sortOrder") {
                    reqParam["sortOrder"] = param["sortOrder"];
                } else {
                    reqParam[key] = param[key];
                }
            }
            This.miniDataGrid.setPageSize(param["pageSize"]);
            This.miniDataGrid.setPageIndex(param["pageIndex"]);
            This.processUpdateTableContent(reqParam);
        };
        if (this.miniDataGrid.getChanges().length > 0) {
            window.top.mini.confirm("有增删改的数据未保存，是否取消本次操作？", "温馨提示",
                function (action) {
                    if (action != "ok") {
                        doLoad();
                    }
                });
        } else {
            doLoad();
        }
        e.cancel = true;
    };

    /**
     * 单元格渲染处理事件,处理每行数据的展示，可能要格式化，计算，数据字典转换之类
     *
     * @param e
     */
    TreeGridBus.prototype.onDrawCellFunc = function (e) {
        var This = this;
        var record = e.record, column = e.column, field = e.field,
            value = (e.value + "");
        if (column.dataType == "select" || column.type == "comboboxcolumn") {
            var dic = this.dictsMap[column.field];
            var str = "";
            if ($.string.isNotEmpty(value)) {
                var temp = value.split(",");
                for (var i = 0; i < temp.length; i++) {
                    var v = temp[i];
                    if (dic && dic[v]) {
                        str += (dic[v] + ",");
                    }
                }
                if (str.length > 0) {
                    str = str.substring(0, str.length - 1);
                }
            }
            e.cellHtml = str;
        } else if (column.dataType == "javascript") {
            var header = this.tableHeaderMap[column.field];
            if (header) {
                var items = header.items;
                if (items && items.length > 0) {
                    e.cellStyle = "text-align:center";
                    var html = "";
                    for (var i = 0; i < items.length; i++) {
                        var item = items[i];
                        var displayName = item.displayName;
                        var func = item["function"];
                        if (func == "link") {
                            var selectRow = {};
                            var inputs = item.inputs;
                            if ($.string.isNotEmpty(inputs)) {
                                inputs = eval("({" + inputs + "})");
                                for (var key in inputs) {
                                    var value = inputs[key] + "";
                                    if ($.string.isEmpty(value)) {
                                        value = record[key];
                                        if ($.string.isEmpty(value)) {
                                            value = This.urlParam[key];
                                        }
                                    } else {
                                        value = value.replace(/\$(.*?)\$/g,
                                            function (p0, p1, p2) {
                                                var v = record[p1];
                                                if ($.string.isEmpty(v)) {
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
                                || selectRow["_template_no"] || item["templateNo"];
                            if (isEncodeURI && selectRow) {
                                for (var sk in selectRow) {
                                    var sv = selectRow[sk];
                                    if (typeof(sv) == "undefined" || sv === null || sv === "") {
                                        selectRow[sk] = "";
                                    } else {
                                        sv = encodeURIComponent(sv + "");
                                        selectRow[sk] = sv;
                                    }
                                }
                            }
                            href = This.frameService.getCommonUrl(templateNo, selectRow, href,
                                isSign);
                            html += "<a style='display:none;' href='" + href
                                + "' type='link' target='_blank' index='" + i
                                + "' field='" + column.field + "' rownum='"
                                + (record._uid) + "'>" + displayName
                                + "</a>";
                        } else {
                            var tagId = item["tagId"];
                            if ($.string.isEmpty(tagId)) {
                                tagId = "";
                            }
                            html += "<a style='display:none;' href='javascript:void(0)' type='javascript' tagId='"
                                + tagId + "' index='"
                                + i
                                + "' field='"
                                + column.field
                                + "' rownum='"
                                + (record._uid)
                                + "'>"
                                + displayName + "</a>";
                        }
                        if (i < (items.length - 1)) {
                            html += "&nbsp;";
                        }
                    }
                    e.cellHtml = html;
                }
            }
        }
    };

    /**
     * 渲染完成后，绑定处理自定义的单元格的事件
     */
    TreeGridBus.prototype.onCellEventFunc = function (e) {
        var This = this;
        this.tableComponet.find("a[type='javascript'],a[type='link']").each(
            function (i) {
                $(this).show();
                if (This.treeGridConfig["drawCellFunc"]) {
                    var field = $(this).attr("field");
                    var header = This.tableHeaderMap[field];
                    var rowNum = $(this).attr("rownum");
                    var record = This.miniDataGrid.getRowByUID(rowNum);
                    var index = $(this).attr("index");
                    var recordJson = $.jsonToStr(record);
                    var id = $(this).attr("id");
                    if ($.string.isEmpty(id)) {
                        id = index + "_" + field + "_" + rowNum;
                        $(this).attr("id", id);
                    } else {
                        id = id + "_" + field + "_" + rowNum;
                        $(this).attr("id", id);
                    }
                    eval(This.treeGridConfig["drawCellFunc"] + "('" + id + "',"
                        + recordJson + ")");
                }
            });
        this.tableComponet.bindChildEvent("a[type='javascript']", function () {
            var field = $(this).attr("field");
            var header = This.tableHeaderMap[field];
            var rowNum = $(this).attr("rownum");
            var record = This.miniDataGrid.getRowByUID(rowNum);
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
        this.selectRowChangedFunc();
    };

    /**
     * 表格的双击事件处理
     */
    TreeGridBus.prototype.doubleClickRowFunc = function (e) {
        var This = this;
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
                                return false;
                            }
                        }
                    }
                }
            });
        }
    };

    /**
     * 表格的行选中状态改变事件的处理
     */
    TreeGridBus.prototype.selectRowChangedFunc = function (e) {
        var This = this;
        var totalCount = This.miniDataGrid.getTotalCount();
        if (this.toggleGroup) {
            var selectItems = this.getSelectedItems();
            var selectItem = this.miniDataGrid.getSelected();
            this.toggleGroup.each(function (i) {
                var tagId = $(this).attr("id");
                if ($.string.isNotEmpty(tagId)) {
                    var toggle = This.toggleMap[tagId];
                    if (toggle) {
                        if (toggle["isSelect"] == "true") {
                            if (selectItem && totalCount > 0 && selectItems.length < 2) {
                                $(this).attr("class", "mini-button");
                            } else {
                                $(this).attr("class",
                                    "mini-button mini-button-disabled");
                            }
                        } else if (toggle["isMulSelect"] == "true") {
                            if (selectItems && selectItems.length > 0 && totalCount > 0) {
                                $(this).attr("class", "mini-button");
                            } else {
                                $(this).attr("class",
                                    "mini-button mini-button-disabled");
                            }
                        } else {
                            $(this).attr("class", "mini-button");
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
    TreeGridBus.prototype.processClickButtonFunc = function (e) {
        var button = $(e.currentTarget);
        if (button.hasClass("mini-button-disabled")) {
            return;
        }
        var tagId = button.attr("id");
        var toggle = this.toggleMap[tagId];
        if (toggle) {
            var selectItems = this.getSelectedItems();
            var selectItem = this.miniDataGrid.getSelected();
            var totalCount = this.miniDataGrid.getTotalCount();
            if (toggle["isSelect"] == "true") {
                if (!(selectItem && totalCount > 0 && selectItems.length < 2)) {
                    window.top.mini.alert("请选择一行数据进行操作！");
                    return;
                }
                else if (toggle["isMulSelect"] == "true") {
                    if (!(selectItems && selectItems.length > 0 && totalCount > 0)) {
                        window.top.mini.alert("请选择需要操作的数据！");
                        return;
                    }
                }
            }
            var records = [];
            if (toggle["isSelect"] == "true") {
                var selectItem = this.miniDataGrid.getSelected();
                records = [selectItem];
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
    TreeGridBus.prototype.processAction = function (config, records) {
        var This = this;
        var isAlert = config["isAlert"] == "true";
        var alertMsg = config["alertMsg"] || "是否确认操作？";
        var isClose = config["isClose"] == "true";
        var func = config["function"];
        var doAction = function () {
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
                        var formParam = This.miniForm.getData(true,
                            false);
                        for (var key in inputs) {
                            var value = "";
                            if (records && records.length > 0) {
                                for (var i = 0; i < records.length; i++) {
                                    var v = inputs[key] + "";
                                    var record = records[i];
                                    if ($.string.isEmpty(v)) {
                                        v = record[key];
                                        if ($.string.isEmpty(v)) {
                                            if (formParam) {
                                                v = formParam[key];
                                            }
                                        }
                                        if ($.string.isEmpty(v)) {
                                            v = This.urlParam[key];
                                        }
                                    } else {
                                        v = v.replace(/\$(.*?)\$/g,
                                            function (p0, p1, p2) {
                                                var v0 = record[p1];
                                                if ($.string.isEmpty(v0)) {
                                                    if (formParam) {
                                                        v0 = formParam[p1];
                                                    }
                                                }
                                                if ($.string.isEmpty(v0)) {
                                                    v0 = This.urlParam[p1];
                                                }
                                                return v0;
                                            });
                                    }
                                    if ($.string.isEmpty(v)) {
                                        v = "";
                                    } else {
                                        v = $.string.replaceAll(v + "", ",", "$@#");
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
                                    if (formParam) {
                                        value = formParam[key];
                                    }
                                    if ($.string.isEmpty(value)) {
                                        value = This.urlParam[key];
                                    }
                                } else {
                                    value = value.replace(/\$(.*?)\$/g,
                                        function (p0, p1, p2) {
                                            var v0 = "";
                                            if (formParam) {
                                                v0 = formParam[p1];
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
                        if (This.miniForm) {
                            var formParam = This.miniForm.getData(true, false);
                            if (formParam) {
                                $.copyObjToObj(formParam, selectRow);
                            }
                        }
                        This.loadData(selectRow);
                        if (isClose) {
                            This.frameService.closeWindow("ok");
                        }
                    } else if (func == "popWindow") {
                        var title = config["title"] || selectRow["title"] || "信息";
                        var selectItem = This.miniDataGrid.getSelected();
                        title = title.replace(/\$(.*?)\$/g,
                            function (p0, p1, p2) {
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
                            || selectRow["_template_no"] || config["templateNo"];
                        delete selectRow["template_no"];
                        delete selectRow["_template_no"];
                        var width = config["width"] || 600;
                        var height = config["height"] || 600;
                        var isMax = config["isMax"] == "true";
                        var allowResize = config["allowResize"] == "true";
                        var closeFunc = function (action) {
                            if (callbackFunc) {
                                var iframe = "iframe" + new Date().getTime();
                                window[iframe] = this.getIFrameEl();
                                ;
                                eval(callbackFunc + "('" + action + "'," + iframe
                                    + ")");
                            } else {
                                if (action == "ok") {
                                    This.loadData();
                                }
                            }
                        };
                        var url = config["url"] || selectRow["url"]
                            || selectRow["link_url"];
                        delete selectRow["url"];
                        delete selectRow["link_url"];
                        This.frameService.popWindow(title, templateNo, selectRow, width,
                            height,
                            isMax, null, closeFunc, url, allowResize);
                    } else if (func == "upload") {
                        var title = config["title"] || selectRow["title"] || "信息";
                        var selectItem = This.miniDataGrid.getSelected();
                        title = title.replace(/\$(.*?)\$/g,
                            function (p0, p1, p2) {
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
                            || selectRow["_template_no"] || config["templateNo"]
                            || "e_upload_module";
                        delete selectRow["template_no"];
                        delete selectRow["_template_no"];
                        var width = config["width"] || 400;
                        var height = config["height"] || 140;
                        var isMax = config["isMax"] == "true";
                        var allowResize = config["allowResize"] == "true";
                        var closeFunc = function (action) {
                            if (action == "ok") {
                                var iframe = this.getIFrameEl();
                                var uploadDataJsonStr = iframe.contentWindow.getUrl();
                                if ($.string.isEmpty(uploadDataJsonStr)) {
                                    uploadDataJsonStr = "{}";
                                }
                                var uploadDataJson = $.strToJson(uploadDataJsonStr);
                                var record = records[0];
                                $.copyObjToObj(uploadDataJson, record);
                                uploadDataJsonStr = $.jsonToStr(record);
                                if (callbackFunc) {
                                    if ($.string.isNotEmpty(uploadDataJsonStr)) {
                                        eval(callbackFunc + "(" + uploadDataJsonStr + ")");
                                    } else {
                                        eval(callbackFunc + "()");
                                    }
                                }
                            }
                        };
                        selectRow["_url"] = config["url"] || "";
                        selectRow["_event_no"] = config["eventNo"] || "";
                        selectRow["_bcode"] = config["bcode"] || "";
                        selectRow["_limitType"] = config["limitType"] || "";
                        var uploadUrl = $.gconfig.global.uploadUrl || "";
                        This.frameService.popWindow(title, templateNo, selectRow, width,
                            height,
                            isMax, null, closeFunc, uploadUrl, allowResize);
                    } else if (func == "link") {
                        var eventNo = config["eventNo"];
                        var templateNo = selectRow["template_no"]
                            || selectRow["_template_no"] || config["templateNo"];
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
                            for (var sk in selectRow) {
                                var sv = selectRow[sk];
                                if (typeof(sv) == "undefined" || sv === null || sv === "") {
                                    selectRow[sk] = "";
                                } else {
                                    sv = encodeURIComponent(sv + "");
                                    selectRow[sk] = sv;
                                }
                            }
                        }
                        url = This.frameService.getCommonUrl(templateNo, selectRow, url,
                            isSign);
                        window.open(url, "_blank");
                    } else if (func == "submit" || func == "delete" || func == "save") {
                        var isReLoad = config["isReLoad"] != "false";
                        var eventNo = config["eventNo"];
                        var rightId = config["rightId"];
                        var isAysnc = config["isAysnc"] != "false";
                        var isAlertResultInfo = config["isAlertResultInfo"] != "false";
                        var url = config["url"];
                        var freshDictId = config["freshDictId"];
                        if (func == "save") {
                            var data = This.miniDataGrid.getChanges();
                            if (data && data.length > 0) {
                                var dataStr = $.jsonToStr(data);
                                selectRow["data"] = dataStr;
                            }
                        }
                        var processSubmitComplete = function (resultVo) {
                            if (resultVo.getErrorNo() == 0) {
                                if ($.string.isNotEmpty(freshDictId)) {
                                    This.frameService.clearCacheDicts(freshDictId);
                                }
                            }
                            if (resultVo.getErrorNo() == 0 && isReLoad) {
                                if (callbackFunc) {
                                    eval(callbackFunc + "(" + $.jsonToStr(resultVo.obj) + ")");
                                } else {
                                    This.loadData();
                                }
                                if (isClose) {
                                    This.frameService.closeWindow("ok");
                                }
                            } else {
                                if (callbackFunc) {
                                    eval(callbackFunc + "(" + $.jsonToStr(resultVo.obj) + ")");
                                }
                            }
                            if (!callbackFunc || isAlertResultInfo) {
                                var errorInfo = resultVo.getErrorInfo();
                                if ($.string.isNotEmpty(errorInfo)) {
                                    window.top.mini.alert(errorInfo);
                                }
                            }
                        };
                        if ($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)) {
                            This.frameService.processSubmit(
                                processSubmitComplete, eventNo, selectRow,
                                rightId, null, isAysnc, url);
                        }
                    } else if (func == "examine") {
                        var isReLoad = config["isReLoad"] != "false";
                        var flowType = config["flowType"];
                        var flowId = config["flowId"];
                        var dataId = selectRow["dataId"];
                        var title = selectRow["title"];
                        This.frameService.examineData(flowType, flowId, dataId, title, function () {
                            if (isReLoad) {
                                This.loadData();
                            }
                        });
                    }
                    else {
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
            window.top.mini.confirm(alertMsg, "温馨提示", function (action) {
                if (action == "ok") {
                    doAction();
                }
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
    TreeGridBus.prototype.exportExcel = function (event_no, params) {
        var totalCount = this.miniDataGrid.getTotalCount();
        if (!this.miniDataGrid || totalCount == 0) {
            window.top.mini.alert("暂无可导出的数据！");
        } else {
            var titles = "";
            var fields = "";
            var fmtType = "";
            var dicts = "";
            var columns = this.miniDataGrid.columns;
            if (columns != null && columns.length > 0) {
                for (var i = 0; i < columns.length; i++) {
                    var column = columns[i];
                    if (column.visible) {
                        var type = column.type;
                        if (type != "checkcolumn") {
                            varfiled = column.header;
                            var formatType = column.dataType;
                            if (formatType == "select") {
                                var header = this.tableHeaderMap[column.field];
                                if (header) {
                                    var dictId = header.format;
                                    var inputs = header.inputs;
                                    dicts += (dictId + ";" + inputs + "|");
                                }
                            } else {
                                dicts += " |";
                            }
                            fields += column.field + "|";
                            titles += column.header + "|";
                            fmtType += formatType == "" ? formatType + " |" : formatType
                                + "|";
                        }
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
                event_no = this.treeGridConfig["eventNo"];
            }
            var pageIndex = this.miniDataGrid.getPageIndex();
            var pageSize = this.miniDataGrid.getPageSize();
            var param = new Object();
            var url = $.gconfig.platRoot + "servlet/Export";
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
            var closeFunc = function(action,iframe) {
    			if(action == "ok"){
    				 var iframe = this.getIFrameEl();
					//获取选中、编辑的结果
					var data = iframe.contentWindow.GetData(); 
					param.pageIndex = data.exportPageIndex;
       				param.pageSize = data.exportPageSize;
    				var frameService = FrameService.getInstance();
    				frameService.exportExcel(event_no,data.exportPage,data.records,data.fileName,titles,fields,dicts,fmtType,param,"");
    			} 
    		}
            this.frameService.popWindow("导出", "", param, "600", "470","", null,closeFunc, url, "");
        }
    };

    /** ***********************************表格加载数据的相关私有API，一般不需要给外面对象调用*********************************** */

    /**
     * 更新表格内容
     */
    TreeGridBus.prototype.processUpdateTableContent = function (param) {
        var This = this;
        var reqParam = {};
        if (This.localParam) {
            $.copyObjToObj(This.localParam, reqParam);
        }
        var inputs = This.treeGridConfig["inputs"];
        if ($.string.isNotEmpty(inputs)) {
            inputs = eval("({" + inputs + "})");
            for (var key in inputs) {
                var value = inputs[key] + "";
                if ($.string.isEmpty(value)) {
                    value = reqParam[key];
                    if ($.string.isEmpty(value)) {
                        value = This.urlParam[key];
                    }
                } else {
                    value = value.replace(/\$(.*?)\$/g,
                        function (p0, p1, p2) {
                            var v = reqParam[p1];
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
        if (This.treeGridConfig["paramFunc"]) {
            var funcParam = eval(this.treeGridConfig["paramFunc"] + "()");
            if (funcParam) {
                $.copyObjToObj(funcParam, reqParam);
            }
        }
        if (param) {
            $.copyObjToObj(param, reqParam);
        }
        reqParam["isPage"] = This.treeGridConfig["isPage"] || "true";
        var eventNo = reqParam["_event_no"];
        if ($.string.isEmpty(eventNo)) {
            eventNo = This.treeGridConfig["eventNo"];
        }
        var isAsync = This.treeGridConfig["isAsync"] != "false";
        var rightId = This.treeGridConfig["rightId"];
        var url = This.treeGridConfig["url"];
        This.miniDataGrid.loading();
        var queryTableContentComplete = function (resultVo) {
            This.miniDataGrid.unmask();
            This.localParam = resultVo.getReqParamVo().getReqParam();
            if (resultVo.getErrorNo() == 0) {
                This.page = resultVo.getResults();
                This.putPageData(This.page);
                if (This.treeGridConfig["loadDataCallBackFunc"]) {
                    eval(This.treeGridConfig["loadDataCallBackFunc"] + "(" + $.jsonToStr(
                        This.page) + ")");
                }
            } else {
                This.miniDataGrid.deselectAll(true);
                This.treeGrid
                    .find(".mini-grid-rowstable")
                    .html(
                        '<tbody><tr style="height:0px;"><td class="mini-grid-emptyText" style="text-align:center" colspan="100">'
                        + resultVo.getErrorInfo()
                        + '</td></tr></tbody>');
                This.miniDataGrid.setTotalCount(0);
            }
        };
        if ($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)) {
            if (This.treeGridConfig["isPage"] != "false") {
                This.frameService.processQueryList(queryTableContentComplete,
                    eventNo, reqParam, rightId, isAsync, url, false);
            } else {
                This.frameService.processQueryList(queryTableContentComplete,
                    eventNo, reqParam, rightId, isAsync, url);
            }
        }
    };

    window.TreeGridBus = TreeGridBus;
    // 暴露对外的接口
    module.exports = TreeGridBus;

});
