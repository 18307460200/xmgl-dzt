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
<div id="datarid_panel_541ac503" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_65f79b50" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_5538001c" style="width:100%;" tagname="toolbar">
<a id="button_f076c796" class="mini-button" plain="true" iconCls="icon-add">新增</a>
<a id="button_196b9178" class="mini-button" plain="true" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_post"><a id="button_726fdfdf" class="mini-button" plain="true" iconCls="icon-remove">删除</a>
</@permission>
<a id="button_c7936fb0" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" isPage="true" isLoad="true" allowResize="false" pageSize="20" class="mini-datagrid" eventNo="e_query_all_post" allowSortColumn="true" isMulPageSelect="true" showEmptyText="true" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_c58365d5" property="columns">
<div field="field_68617b5b" id="field_68617b5b" allowSort="false" headerAlign="center" type="checkcolumn">
</div>
<div id="field_6b67d87f" field="post_name" allowSort="true" width="120" headerAlign="center">
岗位名称
</div>
<div id="field_d9c0fc2c" field="post_no" allowSort="true" width="120" headerAlign="center">
岗位英文名
</div>
<div id="field_9ac3ca99" field="post_type" dataType="select" allowSort="true" width="120" headerAlign="center" format="post_type">
岗位类型
</div>
<div id="field_b6a09065" field="create_by" allowSort="true" width="120" headerAlign="center">
创建人
</div>
<div id="field_68ebfc26" field="create_date" allowSort="true" width="120" headerAlign="center">
创建时间
</div>
<div id="field_a845b418" field="modified_by" allowSort="true" width="120" headerAlign="center">
最后修改人
</div>
<div id="field_9dbc454b" field="modified_date" allowSort="true" width="120" headerAlign="center">
最后修改时间
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_541ac503",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"m_add_post","title":"添加岗位","height":"220","width":"400","tagId":"button_f076c796","function":"popWindow"},{"templateNo":"m_edite_post","title":"修改岗位","isSelect":"true","height":"240","inputs":"post_id:''","width":"400","tagId":"button_196b9178","function":"popWindow"},{"eventNo":"e_delete_post","isMulSelect":"true","inputs":"post_id:'',post_name:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_726fdfdf","function":"submit"},{"tagId":"button_c7936fb0","function":"refresh"}],"allowResize":"false","allowUnselect":"false","idField":"id","pageSize":"20","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_all_post","frozenStartColumn":"-1","multiSelect":"true","isMulPageSelect":"true","allowSortColumn":"true","style":"width:100%;height:100%;","showEmptyText":"true","allowAlternating":"true","isPage":"true","isLoad":"true","fields":[{"id":"field_68617b5b","field":"field_68617b5b","allowSort":"false","headerAlign":"center","type":"checkcolumn"},{"field":"post_name","id":"field_6b67d87f","allowSort":"true","headerAlign":"center","width":"120"},{"field":"post_no","id":"field_d9c0fc2c","allowSort":"true","headerAlign":"center","width":"120"},{"field":"post_type","id":"field_9ac3ca99","dataType":"select","allowSort":"true","headerAlign":"center","width":"120","format":"post_type"},{"field":"create_by","id":"field_b6a09065","allowSort":"true","headerAlign":"center","width":"120"},{"field":"create_date","id":"field_68ebfc26","allowSort":"true","headerAlign":"center","width":"120"},{"field":"modified_by","id":"field_a845b418","allowSort":"true","headerAlign":"center","width":"120"},{"field":"modified_date","id":"field_9dbc454b","allowSort":"true","headerAlign":"center","width":"120"}],"frozenEndColumn":"-1","showColumnsMenu":"true"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>