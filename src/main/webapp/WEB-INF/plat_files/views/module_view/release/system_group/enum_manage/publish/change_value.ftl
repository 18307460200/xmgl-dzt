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
<div showCollapseButton="true" style="width:100%;height:100%;" nodeIndex="0">
<div id="datarid_panel_9fd31696" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_354f440b" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_ba96cb27" style="width:100%;" tagname="toolbar">
<a id="button_ce623e03" class="mini-button" plain="true" iconCls="icon-add">增加</a>
<a id="button_87560d92" class="mini-button" plain="true" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_enumchange"><a id="button_7f521cad" class="mini-button" plain="true" iconCls="icon-remove">删除</a>
</@permission>
</td>
<td id="group_d8f2ea15" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:150px;" class="mini-textbox" emptyText="请输入字典转换值"/>
<a id="button_34077fa9" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_enumchange" frozenStartColumn="-1" multiSelect="true" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" paramFunc="getParam" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_20afc27e" property="columns">
<div field="field_8bd07f1f" id="field_8bd07f1f" allowSort="false" width="20" headerAlign="center" type="checkcolumn">
序号
</div>
<div id="field_2b052b47" field="exchange_id" allowSort="true" width="110" headerAlign="center">
数据字典编号
</div>
<div id="field_1d5ec6d7" field="change_plat" dataType="select" allowSort="true" width="110" headerAlign="center" format="third_platform">
第三方平台
</div>
<div id="field_2c53be09" field="change_value" allowSort="true" width="110" headerAlign="center">
第三方平台值
</div>
<div id="field_cd134833" field="state" dataType="select" allowSort="true" width="60" headerAlign="center" format="state">
是否有效
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_9fd31696",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"add_change","title":"添加数据字典转换值","height":"250","paramFunc":"getParam","width":"350","tagId":"button_ce623e03","function":"popWindow"},{"templateNo":"edit_change","title":"修改数据字典转换值","isSelect":"true","height":"300","inputs":"exchange_id:''","width":"350","tagId":"button_87560d92","function":"popWindow"},{"eventNo":"e_delete_enumchange","isMulSelect":"true","inputs":"exchange_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认删除?","tagId":"button_7f521cad","function":"submit"},{"paramFunc":"getSearchParam","tagId":"button_34077fa9","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_enumchange","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","allowAlternating":"true","showEmptyText":"true","paramFunc":"getParam","isPage":"true","fields":[{"id":"field_8bd07f1f","field":"field_8bd07f1f","allowSort":"false","headerAlign":"center","width":"20","type":"checkcolumn"},{"field":"exchange_id","id":"field_2b052b47","allowSort":"true","headerAlign":"center","width":"110"},{"field":"change_plat","id":"field_1d5ec6d7","dataType":"select","allowSort":"true","headerAlign":"center","width":"110","format":"third_platform"},{"field":"change_value","id":"field_2c53be09","allowSort":"true","headerAlign":"center","width":"110"},{"field":"state","id":"field_cd134833","dataType":"select","allowSort":"true","headerAlign":"center","width":"60","format":"state"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
</div>
<script type="text/javascript">
<!--

mini.parse();
var param = mini.getParams();
function getParam() {
var paraMap = {};
paraMap["item_id"] = param.item_id;
return paraMap;
}
//模糊查询
function getSearchParam() {
var key = mini.get("key").getValue();
var paraMap = {};
paraMap["key"] = key;
paraMap["item_value"] = param.item_value;
return paraMap;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>