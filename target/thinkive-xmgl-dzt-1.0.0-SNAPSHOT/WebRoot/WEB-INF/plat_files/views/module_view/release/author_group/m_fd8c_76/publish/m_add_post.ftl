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
<div id="form1" style="width:100%;">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_7222d045" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_b1f64c4d" style="border-width:1px;">
<td>
<input id="textbox_a6e798ff" style="width:100%" labelStyle="text-align:right;" name="post_name" labelField="true" class="mini-textbox" label="岗位名称：" required="true"/>
</td>
</tr>
<tr id="group_e85da5ec" style="border-width:1px;">
<td>
<input id="textbox_aa2e7e4f" style="width:100%" labelStyle="text-align:right;" name="post_no" labelField="true" class="mini-textbox" label="岗位英文名：" required="true"/>
</td>
</tr>
<tr id="group_0553ba41" style="border-width:1px;">
<td>
<input id="combobox_84a6bc0d" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="post_type" value="0" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="岗位类别："/>
</td>
</tr>
<tr id="group_17f4deb5" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_add_post"><a id="button_bde1f958" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="button_1d604b4a" style="width:60px;" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_add_post","inputs":"dept_id:'$id$'","tagId":"button_bde1f958","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_1d604b4a","function":"reset"}],"style":"width:100%;","formitem":[{"dataType":"select","format":"post_type","tagId":"combobox_84a6bc0d"}]});
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