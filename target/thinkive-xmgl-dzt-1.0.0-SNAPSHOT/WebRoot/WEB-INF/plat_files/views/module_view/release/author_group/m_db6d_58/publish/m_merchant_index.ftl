<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit">
<title></title>
<script src="${ctxPath}/plugins/miniui/jquery.min.js" type="text/javascript"></script>
<script src="${ctxPath}/plugins/miniui/scripts/miniui/miniui.js" type="text/javascript"></script>
<script src="${ctxPath}/plugins/miniui/template/index/navtree.js" type="text/javascript"></script>
<link href="${ctxPath}/plugins/miniui/scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
<link href="${ctxPath}/plugins/miniui/scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
<link href="${ctxPath}/plugins/miniui/scripts/miniui/themes/thinkive/skin.css" rel="stylesheet" type="text/css" />
<link href="${ctxPath}/plugins/miniui/template/core.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body{
margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
}
</style>
</head>
<body id="bodyContent">
<div id="splitter_41b34591" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_e05870cc" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_6ce10353" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_19fa0d15" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_df1e31a3" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_6beb7260" style="width:100%;" tagname="toolbar">
<a id="button_9baa9d58" class="mini-button" iconCls="icon-add">增加</a>
<a id="button_3e359cb1" class="mini-button" iconCls="icon-edit">编辑</a>
<a id="button_027a8568" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
<td id="group_5b8f5a75" style="white-space:nowrap;" tagname="toolbar">
<input id="textbox_07ddf101" style="width:120px;" name="merchant_name" class="mini-textbox" emptyText="商户姓名："/>
<input id="textbox_ab3872c7" style="width:120px;" name="merchant_no" class="mini-textbox" emptyText="商户编号："/>
<a id="button_564b2bcc" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" pageSize="20" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_merchant" frozenStartColumn="-1" multiSelect="true" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_7805462d" property="columns">
<div field="field_b74b00c6" id="field_b74b00c6" allowSort="true" headerAlign="center" type="checkcolumn">
序号
</div>
<div id="field_71b74a3c" field="merchant_name" allowSort="true" width="100" headerAlign="center">
商户名称
</div>
<div id="field_6d1efbc9" field="merchant_no" allowSort="true" width="120" headerAlign="center">
商户编号
</div>
<div id="field_241bcc58" field="status" dataType="select" allowSort="true" width="80" headerAlign="center" format="merchant_status">
状态
</div>
<div id="field_c3adcfa9" field="expiry_date" allowSort="true" width="100" headerAlign="center">
有效期
</div>
<div id="field_ebc9f583" field="register_date" allowSort="true" width="100" headerAlign="center">
注册时间
</div>
<div id="field_a54355da" field="modified_date" allowSort="true" width="100" headerAlign="center">
最后修改时间
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_19fa0d15",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"m_add_merchant","title":"添加商户信息","height":"450","width":"600","tagId":"button_9baa9d58","function":"popWindow"},{"templateNo":"m_edit_merchant","title":"修改商户信息","isSelect":"true","height":"500","inputs":"merchant__id:''","width":"650","tagId":"button_3e359cb1","function":"popWindow"},{"tagId":"button_027a8568","function":"refresh"},{"isMulSelect":"false","isSelect":"false","inputs":"","tagId":"button_564b2bcc","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","pageSize":"20","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_merchant","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","allowAlternating":"true","showEmptyText":"true","isPage":"true","fields":[{"id":"field_b74b00c6","field":"field_b74b00c6","allowSort":"true","headerAlign":"center","type":"checkcolumn"},{"field":"merchant_name","id":"field_71b74a3c","allowSort":"true","headerAlign":"center","width":"100"},{"field":"merchant_no","id":"field_6d1efbc9","allowSort":"true","headerAlign":"center","width":"120"},{"field":"status","id":"field_241bcc58","dataType":"select","allowSort":"true","headerAlign":"center","width":"80","format":"merchant_status"},{"field":"expiry_date","id":"field_c3adcfa9","allowSort":"true","headerAlign":"center","width":"100"},{"field":"register_date","id":"field_ebc9f583","allowSort":"true","headerAlign":"center","width":"100"},{"field":"modified_date","id":"field_a54355da","allowSort":"true","headerAlign":"center","width":"100"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>