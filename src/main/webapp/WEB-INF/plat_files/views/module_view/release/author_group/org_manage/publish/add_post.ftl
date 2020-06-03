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
<div id="datarid_panel_d3bc674f" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_ee37b18f" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_e49625b0" style="width:100%;" tagname="toolbar">
<input id="hidden_f912490c" name="dept_id" class="mini-hidden"/>
<@permission eventNo="e_add_post"><a id="button_fb6cddcf" class="mini-button" plain="true" iconCls="icon-add">新增</a>
</@permission>
<a id="button_6e067a44" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" isPage="true" isLoad="true" allowResize="false" pageSize="20" class="mini-datagrid" eventNo="e_query_all_post" allowSortColumn="true" isMulPageSelect="true" inputs="dept_id:'$id$'" showEmptyText="true" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_5be84f2b" property="columns">
<div field="field_311ced8c" id="field_311ced8c" allowSort="false" headerAlign="center" type="checkcolumn">
</div>
<div id="field_3a2300b7" field="post_name" allowSort="true" width="120" headerAlign="center">
岗位名称
</div>
<div id="field_4ecbfee1" field="post_type" dataType="select" allowSort="true" width="120" headerAlign="center" format="post_type">
岗位类型
</div>
<div id="field_334de346" field="create_by" allowSort="true" width="120" headerAlign="center">
创建人
</div>
<div id="field_bafdddb0" field="create_date" allowSort="true" width="120" headerAlign="center">
创建时间
</div>
<div id="field_c9f838df" field="modified_by" allowSort="true" width="120" headerAlign="center">
最后修改人
</div>
<div id="field_b06a8866" field="modified_date" allowSort="true" width="120" headerAlign="center">
最后修改时间
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_d3bc674f",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"isMulSelect":"true","eventNo":"e_add_post","inputs":"post_id:''","paramFunc":"getParam","tagId":"button_fb6cddcf","isClose":"true","function":"submit"},{"tagId":"button_6e067a44","function":"refresh"}],"idField":"id","allowUnselect":"false","showPager":"true","emptyText":"暂无数据","id":"datagrid1","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowAlternating":"true","isPage":"true","isLoad":"true","fields":[{"id":"field_311ced8c","field":"field_311ced8c","allowSort":"false","headerAlign":"center","type":"checkcolumn"},{"field":"post_name","id":"field_3a2300b7","allowSort":"true","headerAlign":"center","width":"120"},{"field":"post_type","id":"field_4ecbfee1","dataType":"select","allowSort":"true","headerAlign":"center","width":"120","format":"post_type"},{"field":"create_by","id":"field_334de346","allowSort":"true","headerAlign":"center","width":"120"},{"field":"create_date","id":"field_bafdddb0","allowSort":"true","headerAlign":"center","width":"120"},{"field":"modified_by","id":"field_c9f838df","allowSort":"true","headerAlign":"center","width":"120"},{"field":"modified_date","id":"field_b06a8866","allowSort":"true","headerAlign":"center","width":"120"}],"allowResize":"false","pageSize":"20","class":"mini-datagrid","eventNo":"e_query_all_post","allowSortColumn":"true","isMulPageSelect":"true","inputs":"dept_id:'$id$'","showEmptyText":"true","showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--
function getParam()
{
return {'dept_id':mini.getParams().id};
}
-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>