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
<table id="table_55d37fb3" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<input id="hidden_7c74c476" name="item_id" class="mini-hidden"/>
<tr id="group_2ce223c8" style="border-width:1px;">
<td>
<input id="combobox_3e85561d" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="change_plat" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="对应平台："/>
</td>
</tr>
<tr id="group_1e8276a4" style="border-width:1px;">
<td>
<input id="textbox_428e572d" style="width:100%" labelStyle="text-align:right;" name="change_value" labelField="true" class="mini-textbox" label="平台转换值：" required="true"/>
</td>
</tr>
<tr id="group_e179ca2b" style="border-width:1px;">
<td>
<input id="combobox_4034917f" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="state" value="1" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="是否有效："/>
</td>
</tr>
<tr id="group_9c9409c1" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_add_enumchange"><a id="button_eaa0159f" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="button_dd0c6bb4" style="width:60px;" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_add_enumchange","tagId":"button_eaa0159f","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_dd0c6bb4","function":"reset"}],"style":"margin-top:5px","formitem":[{"dataType":"url","format":"item_id","tagId":"hidden_7c74c476"},{"dataType":"select","format":"third_platform","tagId":"combobox_3e85561d"},{"dataType":"select","format":"state","tagId":"combobox_4034917f"}]});
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