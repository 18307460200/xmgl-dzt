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
<div id="form1" eventNo="e_query_fieldsinfo" inputs="data_id:'$data_id$'" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_6addb069" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_bd885fc6" style="border-width:1px;">
<td>
<input id="textbox_4e8d82e3" style="width:100%" labelStyle="text-align:right;" name="data_name" labelField="true" class="mini-textbox" label="名称：" required="true"/>
</td>
</tr>
<tr id="group_63ddea62" style="border-width:1px;">
<td>
<input id="textbox_259debaa" style="width:100%" labelStyle="text-align:right;" name="data_type" labelField="true" class="mini-textbox" label="英文标识：" required="true"/>
</td>
</tr>
<tr id="group_66bb26ac" style="border-width:1px;">
<td>
<input id="textbox_1b54a30d" style="width:100%" labelStyle="text-align:right;" name="field_flag" labelField="true" class="mini-textbox" label="字段标识：" required="true"/>
</td>
</tr>
<tr id="group_bbde365c" style="border-width:1px;">
<td>
<input id="textbox_ae4f08dd" style="width:100%" labelStyle="text-align:right;" name="orderline" labelField="true" class="mini-textbox" label="排序值：" required="true"/>
</td>
</tr>
<tr id="group_d584dba9" style="border-width:1px;">
<td>
<input id="textbox_c1c6f1ff" style="width:100%" labelStyle="text-align:right;" name="data_source_impl" labelField="true" class="mini-textbox" label="数据来源实现类：" required="true"/>
</td>
</tr>
<tr id="group_6a56e829" style="border-width:1px;">
<td>
<div id="radiobuttonlist_53b533f7" labelStyle="text-align:right;" name="field_type" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="字段类型：" required="true" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="group_345b7b9d" style="border-width:1px;">
<td>
<div id="radiobuttonlist_653afd78" labelStyle="text-align:right;" name="status" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="是否启用：" required="true" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="group_42e28859" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_edit_fields"><a id="button_88f5bfd6" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">修改</a>
</@permission>
<a id="button_b1bb161a" class="mini-button" iconCls="icon-cancel">关闭</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_fieldsinfo","toolbar":[{"eventNo":"e_edit_fields","inputs":"data_id:'$data_id$'","tagId":"button_88f5bfd6","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_b1bb161a","isClose":"true"}],"style":"margin-top:5px","inputs":"data_id:'$data_id$'","formitem":[{"dataType":"select","format":"field_type","tagId":"radiobuttonlist_53b533f7"},{"dataType":"select","format":"fields_status","tagId":"radiobuttonlist_653afd78"}]});
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