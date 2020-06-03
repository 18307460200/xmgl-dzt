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
<div id="form1" eventNo="e_query_enumvalueinfo" inputs="id:'$item_id$'" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_cef88eb7" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_6d63d2b4" style="border-width:1px;">
<td>
<input id="textbox_d5174811" style="width:100%" labelStyle="text-align:right;" name="item_name" labelField="true" class="mini-textbox" label="名称：" required="true"/>
</td>
</tr>
<tr id="group_0f4568a7" style="border-width:1px;">
<td>
<input id="textbox_e06b5936" style="width:100%" labelStyle="text-align:right;" name="item_value" labelField="true" class="mini-textbox" label="枚举值：" required="true"/>
</td>
</tr>
<tr id="group_1201d40b" style="border-width:1px;">
<td>
<input id="textbox_123a04d2" style="width:100%" labelStyle="text-align:right;" name="orderline" labelField="true" class="mini-textbox" label="排序值：" required="true"/>
</td>
</tr>
<tr id="group_826d6562" style="border-width:1px;">
<td>
<input id="combobox_b74747fd" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="status" value="1" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="是否有效："/>
</td>
</tr>
<tr id="group_61144a44" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_edit_enumvalue"><a id="button_ecb2dc9a" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">修改</a>
</@permission>
<a id="button_23bf6788" style="width:60px;" class="mini-button" iconCls="icon-cancel">关闭</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_enumvalueinfo","toolbar":[{"eventNo":"e_edit_enumvalue","inputs":"id:'$item_id$'","tagId":"button_ecb2dc9a","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_23bf6788","isClose":"true"}],"style":"margin-top:5px","inputs":"id:'$item_id$'","formitem":[{"dataType":"select","format":"state","tagId":"combobox_b74747fd"}]});
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