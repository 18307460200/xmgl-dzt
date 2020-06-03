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
<div id="form1" eventNo="e_query_moudletypebyid" inputs="module_type_id:'$module_type_id$'" style="margin-right:15px;">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_54540ffa" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_8773e00c" style="border-width:1px;">
<td>
<input id="textbox_4e10941b" visible="false" style="width:100%" labelStyle="text-align:right;" name="module_type_id" labelField="true" class="mini-textbox"/>
</td>
</tr>
<tr id="group_a113227a" style="border-width:1px;">
<td>
<input id="textbox_e3c03b30" style="width:100%" labelStyle="text-align:right;" name="module_type_no" labelField="true" class="mini-textbox" emptyText="请输入模块类型编号" label="模块类型编号：" required="true"/>
</td>
</tr>
<tr id="group_3795be98" style="border-width:1px;">
<td>
<input id="textbox_97617f8b" style="width:100%" labelStyle="text-align:right;" name="module_type_name" labelField="true" class="mini-textbox" emptyText="模块类型名称" label="模块类型名称：" required="true"/>
</td>
</tr>
</table>
<table id="table_ea60168f" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_a505feff" style="border-width:1px;">
<td colspan="2" align="center" nodeIndex="0">
<@permission eventNo="e_edit_moudletype"><a id="button_e7ed46f4" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
</@permission>
<a id="button_2e2ccb61" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_moudletypebyid","toolbar":[{"eventNo":"e_edit_moudletype","isAlert":"true","alertMsg":"是否提交？","tagId":"button_e7ed46f4","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_2e2ccb61","isClose":"true"}],"style":"margin-right:15px;","inputs":"module_type_id:'$module_type_id$'"});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>