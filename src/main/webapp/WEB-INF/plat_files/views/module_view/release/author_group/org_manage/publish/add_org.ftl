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
<table id="table_0c2cbb39" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_0ca7c29a" style="border-width:1px;">
<td>
<input id="textbox_00ba9d80" style="width:100%" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" label="机构名称：" required="true"/>
</td>
</tr>
<tr id="group_08e51252" style="border-width:1px;">
<td>
<input id="textbox_f53d62a7" style="width:100%" labelStyle="text-align:right;" name="dept_name_en" labelField="true" class="mini-textbox" label="机构英文名：" required="true"/>
</td>
</tr>
<tr id="group_46b0d819" style="border-width:1px;">
<td>
<div labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-radiobuttonlist" label="是否营业部：" repeatDirection="vertical" id="radiobuttonlist_f0fba041" name="is_branch" valueField="item_value" repeatItems="1" value="0" onvaluechanged="valuechanged" repeatLayout="table"></div>
</td>
</tr>
<tr id="group_d628c233" style="border-width:1px;">
<td>
<input visible="false" labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="营业部名称：" id="combobox_7336b3fc" allowInput="true" style="width:100%" showNullItem="false" popupHeight="80" name="branch_id" valueField="item_value" required="true"/>
</td>
</tr>
<tr id="group_74a7252a" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_add_org"><a id="button_287d010f" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="button_7d63a627" style="width:60px;" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_add_org","inputs":"dept_id:'$dept_id$'","tagId":"button_287d010f","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_7d63a627","function":"reset"}],"style":"width:100%;","formitem":[{"dataType":"select","format":"is_branch","tagId":"radiobuttonlist_f0fba041"},{"dataType":"select","format":"branch_id","tagId":"combobox_7336b3fc"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--
function valuechanged(e){
var value=e.value;
if(value=='1')
{
mini.getbyName("branch_id").setVisible(true);
}
else
mini.getbyName("branch_id").setVisible(false);
}
-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>