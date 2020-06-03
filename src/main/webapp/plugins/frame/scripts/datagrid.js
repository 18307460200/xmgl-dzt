/**
 * DataGridBus的相关操作
 */
define(function (require, exports, module) {
    require("plugins/frame/scripts/jquery.zclip.min.js");
    var FrameService = require("plugins/frame/scripts/service/frameService");

    /**
     * 构造函数 参数: dataGridId:表格的容器的route dataGridConfig:表格的配置
     */
    function DataGridBus(dataGridId, dataGridConfig) {
        mini.parse();
        this.componentBusMap = $.gconfig.global.componentBusMap;
        // 服务通信层
        this.frameService = FrameService.getInstance();
        // 表格配置
        this.dataGridConfig = dataGridConfig;
        // dataGrid Jquery组件
        this.dataGrid = $("#" + dataGridId);
        // dataGrid MiniUI组件
        this.miniDataGrid = mini.get(this.dataGrid.find(".mini-datagrid").attr(
            "id"));
        // dataGrid 下面的小的Form MiniUI组件
        this.miniForm = new mini.Form("#" + dataGridId);
        // jQuery表格对象
        this.tableComponet = this.dataGrid.find(".mini-datagrid");
        // var sorter = new MultiSort(this.miniDataGrid);
        // 表头配置
        this.tableHeaders = dataGridConfig["fields"];
        this.tableHeaderMap = {};
        // 数据字典
        this.dictsMap = {};
        // 关联所有的业务功能按钮组
        this.toggleGroup = this.dataGrid.find(".mini-button");
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
        // 翻页对象
        this.page = null;
        // 默认关联form表单
        this.formPanleId = dataGridConfig["defaultForm"];
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
        //是否支持跨行选择
        this.isMulPageSelect = this.dataGridConfig["isMulPageSelect"] == "true";
        //是否支持单元格复制
        this.isCellCopy = this.dataGridConfig["isCellCopy"] == "true";

		//点击表头的排序值
		this.sortField ="";
		this.sortOrder ="";
    }
    ;

    /**
     * 初始化信息
     */
    DataGridBus.prototype.loadViewConfig = function () {
        // 先预加载表格整体的绑定事件
        this.onRegister();
        // 创建表格，加载数据
        this.createTable();
    };

    /**
     * 表格注册事件监听
     */
    DataGridBus.prototype.onRegister = function () {
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
		
		// 表头单元格点击时发生事件的处理
        var HeaderCellClickFunc = $.bindFunc(this.HeaderCellClickFunc, this);
        this.miniDataGrid.on("headercellclick", HeaderCellClickFunc);

        // 表格点击单元格事件处理
        if (this.isCellCopy) {
            var copyMenuId = "copyMenu_" + this.dataGrid.attr("id");
            this.miniDataGrid.on("cellmousedown", function (e) {
                var content = $(e.htmlEvent.target);
                if (content) {
                    content = content.text();
                }
                var oncontextmenu = function (event) {
                    if ($.net.getBrowser().ie) {
                        $(".zclip").html("");
                        $(".zclip").remove();
                    }
                    if (window.event) {
                        window.event.returnValue = false;
                    } else {
                        event.cancelBubble = true;
                        event.returnValue = false;
                        event.preventDefault();
                    }
                    var e = event || window.event;
                    var scrollX = document.documentElement.scrollLeft
                        || document.body.scrollLeft;
                    var scrollY = document.documentElement.scrollTop
                        || document.body.scrollTop;
                    var x = e.pageX || e.clientX + scrollX;
                    var y = e.pageY || e.clientY + scrollY;
                    mini.get("" + copyMenuId).showAtPos(x, y);
                    if ($.net.getBrowser().ie) {
                        var currentItem = $("#" + copyMenuId).find(".mini-menuitem");
                        currentItem.zclip({
                            path: $.gconfig.platRoot
                            + 'plugins/frame/scripts/ZeroClipboard.swf',
                            copy: function () {
                                if (window["copyDataGridCell"]) {
                                    return window["copyDataGridCell"]();
                                }
                                return "";
                            },
                            beforeCopy: function () {
                            },
                            afterCopy: function () {
                                mini.get("" + copyMenuId).hide();
                                $(".zclip").html("");
                                $(".zclip").remove();
                            }
                        });
                    }
                    window["copyDataGridCell"] = function () {
                        return content;
                    };
                    return false;
                };
                var target = e.htmlEvent.target;
                target.oncontextmenu = oncontextmenu;
            });
        }
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
     * 创建表格
     */
    DataGridBus.prototype.createTable = function () {
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
        if (this.dataGridConfig["initFunc"]) {
            eval(this.dataGridConfig["initFunc"] + "()");
        }
        var param = {};
        if (this.dataGridConfig["isLoad"] != "false") {
            this.miniDataGrid.load(param);
        } else {
            this.localParam = param;
        }
        if (this.isCellCopy) {
            var copyMenuId = "copyMenu_" + this.dataGrid.attr("id");
            if (this.dataGrid.find("#" + copyMenuId).size() == 0) {
                var html = "<ul id='" + copyMenuId
                    + "' class='mini-contextmenu'><li iconCls='icon-edit'>复制单元格</li></ul>";
                this.dataGrid.append(html);
                mini.parse();
                if (!$.net.getBrowser().ie) {
                    mini.get("" + copyMenuId).show();
                    var currentItem = $("#" + copyMenuId).find(".mini-menuitem");
                    currentItem.zclip({
                        path: $.gconfig.platRoot
                        + 'plugins/frame/scripts/ZeroClipboard.swf',
                        copy: function () {
                            if (window["copyDataGridCell"]) {
                                return window["copyDataGridCell"]();
                            }
                            return "";
                        },
                        beforeCopy: function () {
                        },
                        afterCopy: function () {
                            mini.get("" + copyMenuId).hide();
                        }
                    });
                    mini.get("" + copyMenuId).hide();
                }
            }
        }
        if (this.dataGridConfig["isPage"] != "false") {
            this.miniDataGrid.setShowPager(true);
        } else {
            this.miniDataGrid.setShowPager(false);
        }
    };

    /**
     * 各个浏览器复制剪切板的方法，暂时不用，体验不好
     * @param txt
     * @returns {Boolean}
     */
    DataGridBus.prototype.copyToClipboard = function (txt) {
        if (window.clipboardData) {
            window.clipboardData.clearData();
            clipboardData.setData("Text", txt);

        } else if (navigator.userAgent.indexOf("Opera") != -1) {
            window.location = txt;
        } else if (window.netscape) {
            try {
                netscape.security.PrivilegeManager
                    .enablePrivilege("UniversalXPConnect");
            } catch (e) {
                alert(
                    "被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将 'signed.applets.codebase_principal_support'设置为'true'");
            }
            var clip = Components.classes['@mozilla.org/widget/clipboard;1']
                .createInstance(Components.interfaces.nsIClipboard);
            if (!clip) {
                return;
            }
            var trans = Components.classes['@mozilla.org/widget/transferable;1']
                .createInstance(Components.interfaces.nsITransferable);
            if (!trans) {
                return;
            }
            trans.addDataFlavor("text/unicode");
            var str = new Object();
            var len = new Object();
            var str = Components.classes["@mozilla.org/supports-string;1"]
                .createInstance(Components.interfaces.nsISupportsString);
            var copytext = txt;
            str.data = copytext;
            trans.setTransferData("text/unicode", str, copytext.length * 2);
            var clipid = Components.interfaces.nsIClipboard;
            if (!clip) {
                return false;
            }
            clip.setData(trans, null, clipid.kGlobalClipboard);
        }
    };

    /** ***********************************表格创建加载数据的相关公开API，一般需要给外面对象调用*********************************** */

    /**
     * 加载表格数据
     */
    DataGridBus.prototype.loadData = function (param, formPanelId, event_no) {
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
    DataGridBus.prototype.refresh = function () {
        this.miniDataGrid.reload();
    };

    /**
     * 得到翻页数据
     *
     * @return {}
     */
    DataGridBus.prototype.getPage = function () {
        return this.page;
    };

    /**
     * 得到表格所有选中的数据，是一个数组
     */
    DataGridBus.prototype.getSelectedItems = function () {
        if (this.isMulPageSelect) {
            var data = [];
            for (var pageIndex in this.selectPageMaps) {
                var rows = this.selectPageMaps[pageIndex];
                data.addRange(rows);
            }
            return data;
        } else {
            return this.miniDataGrid.getSelecteds();
        }
    };

    /**
     * 得到表格当前选中的数据，是一个对象
     */
    DataGridBus.prototype.getSelectedItem = function () {
        return this.miniDataGrid.getSelected();
    };

    /**
     * 得到行数据
     *
     * @param {}
     *            rowId
     */
    DataGridBus.prototype.getRowData = function (rowId) {
        return this.miniDataGrid.getRowByUID(rowId);
    };

    /**
     * 得到选择的指定列的值
     */
    DataGridBus.prototype.getSelectFiled = function (filed) {
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
    DataGridBus.prototype.putPageData = function (pageData) {
        this.page = pageData;
        this.miniDataGrid.deselectAll(true);
        if (this.dataGridConfig["isPage"] != "false") {
            if (!this.page || this.page.totalRows == 0) {
                this.dataGrid
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
                this.dataGrid
                    .find(".mini-grid-rowstable")
                    .html(
                        '<tbody><tr style="height:0px;"><td class="mini-grid-emptyText" style="text-align:center" colspan="100">没有返回的数据</td></tr></tbody>');
                this.miniDataGrid.setTotalCount(0);
            } else {
                this.miniDataGrid.setData(this.page);
                this.miniDataGrid.setTotalCount(this.page.length);
            }
        }
        if (this.isMulPageSelect) {
            var rows = this.selectPageMaps[this.miniDataGrid.getPageIndex()];
            if (rows) {
            	var selectRows = [];
            	for(var key=0; key < rows.length; key++){
            		selectRows.push(rows[key].rownum_  - 1 - this.miniDataGrid.getPageIndex()*this.miniDataGrid.getPageSize());
            	}
                this.miniDataGrid.selects(selectRows);
            }
        }
    };

    /**
     * 重新绘制表格
     */
    DataGridBus.prototype.reDrawTable = function (param) {

    };

    /**
     * 释放内存工作
     */
    DataGridBus.prototype.destroy = function () {
        // 清空数据
        this.miniDataGrid.clearRows();
        this.frameService.destroy();
    };

    /** ***********************************表格处理事件私有处理，一般不需要给外面对象调用*********************************** */

    /**
     * 加载前数据监听事件，目的是用我们自己的通信层，拦截MiniUI的默认的URL请求，然后把我们数据赋值给MiniUI
     */
    DataGridBus.prototype.onBeforeLoadFunc = function (e) {
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
    DataGridBus.prototype.onDrawCellFunc = function (e) {
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
    DataGridBus.prototype.onCellEventFunc = function (e) {
        var This = this;
        this.tableComponet.find("a[type='javascript'],a[type='link']").each(
            function (i) {
                $(this).show();
                if (This.dataGridConfig["drawCellFunc"]) {
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
                    eval(This.dataGridConfig["drawCellFunc"] + "('" + id + "',"
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
    DataGridBus.prototype.doubleClickRowFunc = function (e) {
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
    DataGridBus.prototype.selectRowChangedFunc = function (e) {
        var This = this;
        if (this.isMulPageSelect) {
            var rows = this.miniDataGrid.getSelecteds();
            this.selectPageMaps[this.miniDataGrid.getPageIndex()] = rows;
        }
        var totalCount = this.miniDataGrid.getTotalCount();
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
    DataGridBus.prototype.processClickButtonFunc = function (e) {
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
    DataGridBus.prototype.processAction = function (config, records) {
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
                	This.selectPageMaps = {};
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
                    	This.selectPageMaps = {};
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
                                	This.selectPageMaps = {};
                                    This.refresh();
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
                    	This.selectPageMaps = {};
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
                                    This.refresh();
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
                    	This.selectPageMaps = {};
                        var isReLoad = config["isReLoad"] != "false";
                        var flowType = config["flowType"];
                        var flowId = config["flowId"];
                        var dataId = selectRow["dataId"];
                        var title = selectRow["title"];
                        This.frameService.examineData(flowType, flowId, dataId, title, function () {
                            if (isReLoad) {
                                This.refresh();
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
     * 表头单元格点击时发生
     * 
     */
	DataGridBus.prototype.HeaderCellClickFunc = function(e){ 
		this.sortField = e.sender.sortField;
		this.sortOrder = e.sender.sortOrder;
	}

    /**
     * 导出Excel
     *
     * @param {}
     *            buttonObj
     */
    DataGridBus.prototype.exportExcel = function (event_no, params) {
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
                        if (type == "checkcolumn" || column.dataType=="javascript") {
                            
                        }else{
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
                event_no = this.dataGridConfig["eventNo"];
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
			if($.string.isEmpty(params.sortField)){
				param.sortField = this.sortField;
			}
			if($.string.isEmpty(params.sortOrder)){
				param.sortOrder = this.sortOrder;
			}
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
       				param.startPage = data.startPage;
       				param.endPage = data.endPage;
       				param.records = data.records;
					param.export_type = data.export_type;
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
    DataGridBus.prototype.processUpdateTableContent = function (param) {
        var This = this;
        var reqParam = {};
        if (This.localParam) {
            $.copyObjToObj(This.localParam, reqParam);
        }
        var inputs = This.dataGridConfig["inputs"];
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
        if (This.dataGridConfig["paramFunc"]) {
            var funcParam = eval(this.dataGridConfig["paramFunc"] + "()");
            if (funcParam) {
                $.copyObjToObj(funcParam, reqParam);
            }
        }
        if (param) {
            $.copyObjToObj(param, reqParam);
        }
        reqParam["isPage"] = This.dataGridConfig["isPage"] || "true";
        var eventNo = reqParam["_event_no"];
        if ($.string.isEmpty(eventNo)) {
            eventNo = This.dataGridConfig["eventNo"];
        }
        var isAsync = This.dataGridConfig["isAsync"] != "false";
        var rightId = This.dataGridConfig["rightId"];
        var url = This.dataGridConfig["url"];
        This.miniDataGrid.loading();
        var queryTableContentComplete = function (resultVo) {
            This.miniDataGrid.unmask();
            This.localParam = resultVo.getReqParamVo().getReqParam();
            if (resultVo.getErrorNo() == 0) {
                This.page = resultVo.getResults();
                This.putPageData(This.page);
                if (This.dataGridConfig["loadDataCallBackFunc"]) {
                    eval(This.dataGridConfig["loadDataCallBackFunc"] + "(" + $.jsonToStr(
                        This.page) + ")");
                }
            } else {
                This.miniDataGrid.deselectAll(true);
                This.dataGrid
                    .find(".mini-grid-rowstable")
                    .html(
                        '<tbody><tr style="height:0px;"><td class="mini-grid-emptyText" style="text-align:center" colspan="100">'
                        + resultVo.getErrorInfo()
                        + '</td></tr></tbody>');
                This.miniDataGrid.setTotalCount(0);
            }
        };
        if ($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)) {
            if (This.dataGridConfig["isPage"] != "false") {
                This.frameService.processQueryList(queryTableContentComplete,
                    eventNo, reqParam, rightId, isAsync, url, false);
            } else {
                This.frameService.processQueryList(queryTableContentComplete,
                    eventNo, reqParam, rightId, isAsync, url);
            }
        }
    };

    window.DataGridBus = DataGridBus;
    // 暴露对外的接口
    module.exports = DataGridBus;

});
