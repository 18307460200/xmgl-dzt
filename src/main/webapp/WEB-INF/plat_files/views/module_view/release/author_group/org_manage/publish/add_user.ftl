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
<div id="datarid_panel_ac03ea7e" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_25c1e53e" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_941217c3" style="width:100%;" tagname="toolbar">
<@permission eventNo="e_add_orguser"><a id="button_15dc00ac" class="mini-button" iconCls="icon-add">增加</a>
</@permission>
</td>
<td id="group_15f38b0b" style="white-space:nowrap;" tagname="toolbar">
<input id="employee_no" style="width:150px;" class="mini-textbox" emptyText="请输入员工编号"/>
<input id="key" style="width:150px;" class="mini-textbox" emptyText="请输入姓名"/>
<a id="button_e4ec5ae0" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_orguserlist" frozenStartColumn="-1" multiSelect="true" inputs="post_id:'$post_id$',dept_id:'$dept_id$'" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_17ccba0b" property="columns">
<div field="field_08069af2" id="field_08069af2" allowSort="false" headerAlign="center" type="checkcolumn">
</div>
<div id="field_5737a246" field="employee_no" allowSort="true" width="100" headerAlign="center">
员工编号
</div>
<div id="field_c82411af" field="name" allowSort="true" width="100" headerAlign="center">
姓名
</div>
<div id="field_fa9ac090" field="mobile_phone" allowSort="true" width="100" headerAlign="center">
手机号码
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_ac03ea7e",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"eventNo":"e_add_orguser","isSelect":"true","inputs":"dept_id:'$dept_id$',post_id:'$post_id$',user_id:''","isReLoad":"true","callbackFunc":"freshUserList","tagId":"button_15dc00ac","function":"submit"},{"paramFunc":"getParam","tagId":"button_e4ec5ae0","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_orguserlist","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","inputs":"post_id:'$post_id$',dept_id:'$dept_id$'","allowAlternating":"true","showEmptyText":"true","isPage":"true","fields":[{"id":"field_08069af2","field":"field_08069af2","allowSort":"false","headerAlign":"center","type":"checkcolumn"},{"field":"employee_no","id":"field_5737a246","allowSort":"true","headerAlign":"center","width":"100"},{"field":"name","id":"field_c82411af","allowSort":"true","headerAlign":"center","width":"100"},{"field":"mobile_phone","id":"field_fa9ac090","allowSort":"true","headerAlign":"center","width":"100"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
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
var param = mini.getParams();
var post_id = param.post_id;
function getParam()
{
var key = mini.get("key").getValue();
var employee_no = mini.get("employee_no").getValue();
var paraMap = {};
paraMap["post_id"] = post_id;
paraMap["key"] = key;
paraMap["employee_no"]= employee_no;
return paraMap;
}
//添加用户前验证是不是岗位
function conditionFilter(){
alert(post_id);
return false;
}
function getAddParam()
{
var row = grid.getSelected();
var paraMap = {};
paraMap["post_id"] = post_id;
paraMap["user_id"] = row.user_id;
return paraMap;
}
//刷新父窗口
function freshUserList(){
$.tkui["datagrid1"].loadData({post_id:post_id});
window.Owner.$.tkui["datagrid1"].loadData({post_id:post_id});
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>