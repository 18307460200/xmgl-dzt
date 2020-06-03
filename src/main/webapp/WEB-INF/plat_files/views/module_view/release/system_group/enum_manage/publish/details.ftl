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
<div showCollapseButton="true" style="width:100%;height:92%;" nodeIndex="0">
<div id="datarid_panel_78880084" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_a5c7ef98" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_6b92e576" style="width:100%;" tagname="toolbar">
<a id="button_3b1b1e71" class="mini-button" plain="true" iconCls="icon-add">增加</a>
<a id="button_f8fba75f" class="mini-button" plain="true" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_enumvalue"><a id="button_abb5962c" class="mini-button" plain="true" iconCls="icon-remove">删除</a>
</@permission>
</td>
<td id="group_e511cf8e" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:150px;" onenter="onKeyEnter" class="mini-textbox" emptyText="请输入名称"/>
<a id="button_3b3e03f2" onclick="search()" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_enumvalue" frozenStartColumn="-1" multiSelect="true" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" paramFunc="getParam" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_31295b81" property="columns">
<div field="field_331459ee" id="field_331459ee" allowSort="false" width="20" headerAlign="center" type="checkcolumn">
</div>
<div id="field_dfbe62a6" field="enum_no" allowSort="true" width="110" headerAlign="center">
类型英文名
</div>
<div id="field_68766ce3" field="item_name" allowSort="true" width="110" headerAlign="center">
名称
</div>
<div id="field_8758e12d" field="item_value" allowSort="true" width="110" headerAlign="center">
枚举值
</div>
<div id="field_c9b29666" field="state" dictNo="state" allowSort="true" width="60" headerAlign="center">
是否有效
</div>
<div field="field_d5500b9d" id="field_d5500b9d" dataType="javascript" allowSort="false" width="110" align="center" headerAlign="center">
查看转换值
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_78880084",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"add_value","title":"添加数据字典值","height":"250","paramFunc":"getParam","width":"350","tagId":"button_3b1b1e71","function":"popWindow"},{"templateNo":"edit_value","title":"修改数据字典枚举值","isSelect":"true","height":"300","inputs":"id:''","width":"350","tagId":"button_f8fba75f","function":"popWindow"},{"eventNo":"e_delete_enumvalue","isSelect":"true","inputs":"id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认删除?","tagId":"button_abb5962c","function":"submit"},{"paramFunc":"getSearchParam","tagId":"button_3b3e03f2","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_enumvalue","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","allowAlternating":"true","showEmptyText":"true","paramFunc":"getParam","isPage":"true","fields":[{"id":"field_331459ee","field":"field_331459ee","allowSort":"false","headerAlign":"center","width":"20","type":"checkcolumn"},{"field":"enum_no","id":"field_dfbe62a6","allowSort":"true","headerAlign":"center","width":"110"},{"field":"item_name","id":"field_68766ce3","allowSort":"true","headerAlign":"center","width":"110"},{"field":"item_value","id":"field_8758e12d","allowSort":"true","headerAlign":"center","width":"110"},{"field":"state","id":"field_c9b29666","dictNo":"state","allowSort":"true","headerAlign":"center","width":"60"},{"id":"field_d5500b9d","field":"field_d5500b9d","dataType":"javascript","items":[{"templateNo":"change_value","title":"数据字典转换值","height":"500","inputs":"enum_no:'',item_value:''","width":"900","displayName":"查看","tagId":"field_d5500b9d","function":"popWindow"}],"allowSort":"false","headerAlign":"center","align":"center","width":"110"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
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
var grid = mini.get("datagrid1");
var param = mini.getParams();
function getParam()
{
var paraMap = {};
paraMap["enum_no"] = param.enum_no;
return paraMap;
}
function getSearchParam()
{
var key = mini.get("key").getValue();
var paraMap = {};
paraMap["key"] = key;
paraMap["enum_no"] = param.enum_no;
return paraMap;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>