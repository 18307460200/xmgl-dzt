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
<div id="form1" eventNo="e_query_enumchangevalue" inputs="exchange_id:'$exchange_id$'" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_0fb046f5" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_1b0a6e77" style="border-width:1px;">
<td>
<input id="combobox_e6679de0" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="change_plat" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="对应平台："/>
</td>
</tr>
<tr id="group_1d46e35d" style="border-width:1px;">
<td>
<input id="textbox_45dc825d" style="width:100%" labelStyle="text-align:right;" name="change_value" labelField="true" class="mini-textbox" label="平台转换值：" required="true"/>
</td>
</tr>
<tr id="group_6876a428" style="border-width:1px;">
<td>
<input id="combobox_d910bb9f" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="state" value="1" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="是否有效："/>
</td>
</tr>
<tr id="group_f5082cca" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_edit_enumchangevalue"><a id="button_fea58db0" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">修改</a>
</@permission>
<a id="button_5e56d470" style="width:60px;" class="mini-button" iconCls="icon-cancel">关闭</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_enumchangevalue","toolbar":[{"eventNo":"e_edit_enumchangevalue","inputs":"exchange_id:'$exchange_id$'","tagId":"button_fea58db0","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_5e56d470","isClose":"true"}],"style":"margin-top:5px","inputs":"exchange_id:'$exchange_id$'","formitem":[{"dataType":"select","format":"third_platform","tagId":"combobox_e6679de0"},{"dataType":"select","format":"state","tagId":"combobox_d910bb9f"}]});
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