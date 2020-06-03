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
<div id="form1" eventNo="e_query_orginfo" inputs="dept_id:'$id$'" style="width:100%;" loadDataCallBackFunc="loadDataCallBackFunc">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_790e45b1" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_36ee18a0" style="border-width:1px;">
<td>
<input id="textbox_870ea38f" style="width:100%" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" label="机构名称：" required="true"/>
</td>
</tr>
<tr id="group_1f547940" style="border-width:1px;">
<td>
<input id="textbox_836de3c6" style="width:100%" labelStyle="text-align:right;" name="dept_name_en" labelField="true" class="mini-textbox" label="机构英文名：" required="true"/>
</td>
</tr>
<tr id="group_83145b63" style="border-width:1px;">
<td>
<input id="textbox_1c7399c6" style="width:100%" labelStyle="text-align:right;" name="orderline" labelField="true" class="mini-textbox" label="排序值：" required="true"/>
</td>
</tr>
<tr id="group_fe33362f" style="border-width:1px;">
<td>
<div id="radiobuttonlist_a53f2611" labelStyle="text-align:right;" name="is_branch" repeatItems="1" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" onvaluechanged="valuechanged" label="是否营业部：" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="group_a7253596" style="border-width:1px;">
<td>
<input visible="false" labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="营业部名称：" id="combobox_74afe157" allowInput="true" style="width:100%" showNullItem="false" popupHeight="80" name="branch_id" valueField="item_value" required="true"/>
</td>
</tr>
<tr id="group_a54fac28" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_update_org"><a id="button_3365e121" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">修改</a>
</@permission>
<a id="button_0563e76a" style="width:60px;" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_orginfo","toolbar":[{"eventNo":"e_update_org","inputs":"dept_id:'$id$'","tagId":"button_3365e121","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_0563e76a","function":"reset"}],"style":"width:100%;","inputs":"dept_id:'$id$'","loadDataCallBackFunc":"loadDataCallBackFunc","formitem":[{"dataType":"select","format":"is_branch","tagId":"radiobuttonlist_a53f2611"},{"dataType":"select","format":"branch_id","tagId":"combobox_74afe157"}]});
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
function loadDataCallBackFunc(resultVo)
{
if(resultVo.is_branch =='1')
{
mini.getbyName("branch_id").setVisible(true);
}
}
-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>