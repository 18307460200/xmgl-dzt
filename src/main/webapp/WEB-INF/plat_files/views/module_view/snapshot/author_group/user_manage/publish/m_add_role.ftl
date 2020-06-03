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
<div id="datarid_panel_488a294a" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_2111e419" style="width:100%;" tagname="toolbar">
<a id="button_82e09a5c" class="mini-button" plain="true" iconCls="icon-add">选择角色</a>
</td>
<td id="group_3a062c07" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:150px;" name="key" class="mini-textbox" emptyText="请输入名称"/>
<a id="button_229af084" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" isPage="true" allowResize="false" onrowdblclick="onRowDblClick" pageSize="20" class="mini-datagrid" eventNo="e_query_role" allowSortColumn="true" isMulPageSelect="true" showEmptyText="true" loadDataCallBackFunc="selectDatagrid" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_bde50044" property="columns">
<div field="field_3e9c7326" id="field_3e9c7326" allowSort="true" headerAlign="center" type="checkcolumn">
序号
</div>
<div id="field_8aedad5f" field="role_no" allowSort="true" width="110" headerAlign="center">
角色英文名
</div>
<div id="field_ca214146" field="name" allowSort="true" width="110" headerAlign="center">
角色名称
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_488a294a",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"tagId":"button_82e09a5c","function":"addRole"},{"tagId":"button_229af084","function":"query"}],"idField":"id","allowUnselect":"false","showPager":"true","emptyText":"暂无数据","id":"datagrid1","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowAlternating":"true","isPage":"true","fields":[{"id":"field_3e9c7326","field":"field_3e9c7326","allowSort":"true","headerAlign":"center","type":"checkcolumn"},{"field":"role_no","id":"field_8aedad5f","allowSort":"true","headerAlign":"center","width":"110"},{"field":"name","id":"field_ca214146","allowSort":"true","headerAlign":"center","width":"110"}],"allowResize":"false","onrowdblclick":"onRowDblClick","pageSize":"20","class":"mini-datagrid","eventNo":"e_query_role","allowSortColumn":"true","isMulPageSelect":"true","showEmptyText":"true","loadDataCallBackFunc":"selectDatagrid","showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

mini.parse();
var grid = mini.get("datagrid1");
var tree = mini.get("tree1");
function selectDatagrid()
{
var params = mini.getParams();
var role_id = params.role_id;
if(typeof(role_id)!="undefined"){
var rows=grid.findRows(function(row){
var roles = role_id.split(",");
for(var i=0;i<roles.length;i++){
if(row.role_id==roles[i]){
return true;
}
}
})
}
grid.selects(rows)
}
function selectNote(e)
{
var tree = mini.get("tree1");
var firstNode= tree.getNode(0);
tree.selectNode(firstNode);
if(firstNode){
$.tkui["datagrid1"].loadData({sort_id:firstNode.sort_id });
}
}
function onRowDblClick(e)
{
onOk();
}
function addRole()
{
var rows = grid.getSelecteds();
if (rows.length > 0)
{
onOk();
}else{
mini.alert("请选择一条记录!", "提醒");
}
}
function onOk()
{
var frameService = FrameService.getInstance();
frameService.closeWindow("ok");
}
function getData()
{
var rows = grid.getSelecteds();
return rows;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>