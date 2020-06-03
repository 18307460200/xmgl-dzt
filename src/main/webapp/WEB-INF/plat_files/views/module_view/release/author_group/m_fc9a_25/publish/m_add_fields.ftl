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
<div id="form1" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_eaacc704" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_306579e9" style="border-width:1px;">
<td>
<input id="textbox_1a4bccf7" style="width:100%" labelStyle="text-align:right;" name="data_name" labelField="true" class="mini-textbox" label="名称：" required="true"/>
</td>
</tr>
<tr id="group_1a7c7156" style="border-width:1px;">
<td>
<input id="textbox_ee7d8352" style="width:100%" labelStyle="text-align:right;" name="data_type" labelField="true" class="mini-textbox" label="英文标识：" required="true"/>
</td>
</tr>
<tr id="group_96796bb0" style="border-width:1px;">
<td>
<input id="textbox_cc5c3d1c" style="width:100%" labelStyle="text-align:right;" name="field_flag" labelField="true" class="mini-textbox" label="字段标识：" required="true"/>
</td>
</tr>
<tr id="group_5ec9cf5e" style="border-width:1px;">
<td>
<input id="textbox_27621187" style="width:100%" labelStyle="text-align:right;" name="data_source_impl" labelField="true" class="mini-textbox" label="数据来源实现类：" required="true"/>
</td>
</tr>
<tr id="group_aa3ea7bd" style="border-width:1px;">
<td>
<div id="radiobuttonlist_34ade960" labelStyle="text-align:right;" name="field_type" value="0" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="字段类型：" required="true" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="group_dd7e9763" style="border-width:1px;">
<td>
<div id="radiobuttonlist_0908cd87" labelStyle="text-align:right;" name="status" value="0" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="是否启用：" required="true" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="group_4e08a566" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_add_fields"><a id="button_3d24ccf5" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="button_1e28dada" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_add_fields","tagId":"button_3d24ccf5","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_1e28dada","isClose":"true"}],"style":"margin-top:5px","formitem":[{"dataType":"select","format":"field_type","tagId":"radiobuttonlist_34ade960"},{"dataType":"select","format":"fields_status","tagId":"radiobuttonlist_0908cd87"}]});
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