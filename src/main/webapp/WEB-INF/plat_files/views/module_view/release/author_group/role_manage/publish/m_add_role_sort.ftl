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
<div id="from1" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_f1386944" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_979affbd" style="border-width:1px;">
<td>
<input id="textbox_0ce2572b" style="margin-right:20px;" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" emptyText="请输入分类名称" label="分类名称：" required="true"/>
</td>
</tr>
<tr id="group_6d736d8a" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_add_role_sort"><a id="button_d00d5939" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">提交</a>
</@permission>
<a id="button_018f7963" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["from1"];
if(!form){
require.async("form",function(Form){
form = new Form("from1",{"id":"from1","toolbar":[{"eventNo":"e_add_role_sort","isAlert":"true","alertMsg":"是否提交？","tagId":"button_d00d5939","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_018f7963","function":"reset"}],"style":"margin-top:5px"});
$.tkui["from1"] = form;
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