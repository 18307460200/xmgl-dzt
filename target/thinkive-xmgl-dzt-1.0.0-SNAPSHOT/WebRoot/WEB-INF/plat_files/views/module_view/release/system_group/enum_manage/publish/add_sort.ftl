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
<table id="table_15c58190" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_e514e552" style="border-width:1px;">
<td>
<input id="textbox_d5b563eb" style="width:100%" labelStyle="text-align:right;" name="sort_name" labelField="true" class="mini-textbox" label="分类名称：" required="true"/>
</td>
</tr>
<tr id="group_2e445ca3" style="border-width:1px;">
<td>
<input id="combobox_114cebda" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="is_show" value="0" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="是否展示："/>
</td>
</tr>
<tr id="group_129660f1" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_add_enumsort"><a id="button_b60d8303" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="button_7d088d44" style="width:60px;" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_add_enumsort","tagId":"button_b60d8303","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_7d088d44","function":"reset"}],"style":"margin-top:5px","formitem":[{"dataType":"select","format":"isshow","tagId":"combobox_114cebda"}]});
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