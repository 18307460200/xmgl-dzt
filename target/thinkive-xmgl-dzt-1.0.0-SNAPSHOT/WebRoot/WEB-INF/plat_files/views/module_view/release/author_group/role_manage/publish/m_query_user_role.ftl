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
<div id="splitter_b1897a7c" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_990bc213" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_1e5977fd" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_15ca187e" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbutton" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_f3039fa7" style="width:100%;" tagname="toolbar">
<a id="button_5a46af93" class="mini-button" plain="true" iconCls="icon-add">增加用户</a>
<@permission eventNo="e_delete_role_user"><a id="button_34e193c7" class="mini-button" plain="true" iconCls="icon-remove">删除角色用户</a>
</@permission>
</td>
<td id="group_21adf531" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:150px;" class="mini-textbox" emptyText="请输入名称"/>
<a id="button_00f3f20d" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_roleuser" frozenStartColumn="-1" multiSelect="true" inputs="role_id:'$role_id$'" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_49c097a1" property="columns">
<div field="field_c19d3145" id="field_c19d3145" allowSort="false" width="20" headerAlign="center" type="checkcolumn">
</div>
<div id="field_29b58028" field="login_id" allowSort="true" width="80" headerAlign="center">
登录账号
</div>
<div id="field_ae727262" field="name" allowSort="true" width="80" headerAlign="center">
名称
</div>
<div field="state" id="state" dataType="select" allowSort="true" width="60" headerAlign="center" format="state">
是否有效
</div>
<div field="dept_id" id="dept_id" dataType="select" allowSort="true" width="80" headerAlign="center" format="dept_id">
所属机构
</div>
<div field="post_id" id="post_id" dataType="select" allowSort="true" width="80" headerAlign="center" format="post_id">
所属岗位
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_15ca187e",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"m_add_role_user","title":"添加角色用户","height":"500","inputs":"role_id:'$role_id$'","width":"900","tagId":"button_5a46af93","function":"popWindow"},{"eventNo":"e_delete_role_user","isMulSelect":"true","inputs":"user_id:'$user_id$',role_id:'$role_id$'","isAlert":"true","isReLoad":"true","alertMsg":"是否确认删除?","tagId":"button_34e193c7","function":"submit"},{"paramFunc":"getSearchParam","tagId":"button_00f3f20d","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_roleuser","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","inputs":"role_id:'$role_id$'","allowAlternating":"true","showEmptyText":"true","isPage":"true","fields":[{"id":"field_c19d3145","field":"field_c19d3145","allowSort":"false","headerAlign":"center","width":"20","type":"checkcolumn"},{"field":"login_id","id":"field_29b58028","allowSort":"true","headerAlign":"center","width":"80"},{"field":"name","id":"field_ae727262","allowSort":"true","headerAlign":"center","width":"80"},{"id":"state","field":"state","dataType":"select","allowSort":"true","headerAlign":"center","width":"60","format":"state"},{"id":"dept_id","field":"dept_id","dataType":"select","allowSort":"true","headerAlign":"center","width":"80","format":"dept_id"},{"id":"post_id","field":"post_id","dataType":"select","allowSort":"true","headerAlign":"center","width":"80","format":"post_id"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<script type="text/javascript">
<!--

function getSearchParam(){
var param = new Object();
var key = mini.get("key").getValue();
param.key=key;
return param;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>