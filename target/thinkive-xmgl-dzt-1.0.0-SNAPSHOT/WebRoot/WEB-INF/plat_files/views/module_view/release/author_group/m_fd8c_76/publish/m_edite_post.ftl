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
<div id="form1" eventNo="e_query_postinfo" inputs="post_id:'$post_id$'" style="width:100%;">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_3c6e97e0" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_c414b3ec" style="border-width:1px;">
<td>
<input id="textbox_b2dc5128" style="width:100%" labelStyle="text-align:right;" name="post_name" labelField="true" class="mini-textbox" label="岗位名称：" required="true"/>
</td>
</tr>
<tr id="group_e6e72237" style="border-width:1px;">
<td>
<input id="textbox_939817ca" style="width:100%" labelStyle="text-align:right;" name="post_no" labelField="true" class="mini-textbox" label="岗位英文名：" required="true"/>
</td>
</tr>
<tr id="group_d8b2115b" style="border-width:1px;">
<td>
<input id="textbox_e6d4059e" style="width:100%" labelStyle="text-align:right;" name="orderline" labelField="true" class="mini-textbox" label="排序值：" required="true"/>
</td>
</tr>
<tr id="group_21626f8a" style="border-width:1px;">
<td>
<input id="combobox_78a9fa6b" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="post_type" value="0" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="岗位类别："/>
</td>
</tr>
<tr id="group_2cc1128e" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_edite_post"><a id="button_951f06f6" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">修改</a>
</@permission>
<a id="button_89c001a0" style="width:60px;" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_postinfo","toolbar":[{"eventNo":"e_edite_post","inputs":"post_id:''","tagId":"button_951f06f6","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_89c001a0","function":"reset"}],"style":"width:100%;","inputs":"post_id:'$post_id$'","formitem":[{"dataType":"select","format":"post_type","tagId":"combobox_78a9fa6b"}]});
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