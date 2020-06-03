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
<div id="form1" eventNo="e_query_moudletypeinfo" inputs="module_id:'$module_id$',isPage:'false'" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_0ca3f54f" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_8ef89394" style="border-width:1px;">
<td>
<input id="textbox_a3e5b912" style="width:100%" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" label="模块名称：" required="true"/>
</td>
<td>
<input id="textbox_e36ef0ef" style="width:100%" labelStyle="text-align:right;" name="module_no" labelField="true" class="mini-textbox" label="模块编号：" required="true"/>
</td>
</tr>
<tr id="group_b030b8d7" style="border-width:1px;">
<td colspan="2">
<input id="textbox_0a3ebd91" style="width:100%" labelStyle="text-align:right;" name="description" labelField="true" class="mini-textbox" label="模块描述："/>
</td>
</tr>
</table>
<table id="table_da350e1a" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_317c5e0c" style="border-width:1px;">
<td colspan="2" align="center" nodeIndex="0">
<@permission eventNo="e_edit_moudletypeinfo"><a id="button_889ec446" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
</@permission>
<a id="button_2fac40b5" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_moudletypeinfo","toolbar":[{"eventNo":"e_edit_moudletypeinfo","isAlert":"true","alertMsg":"是否提交？","tagId":"button_889ec446","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_2fac40b5","isClose":"true"}],"style":"margin-top:5px","inputs":"module_id:'$module_id$',isPage:'false'"});
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