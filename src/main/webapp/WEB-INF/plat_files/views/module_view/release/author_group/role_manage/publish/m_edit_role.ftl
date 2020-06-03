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
<div id="form1" eventNo="e_query_rolebyid" inputs="role_id:'$role_id$'" style="margin-top:5px" loadDataCallBackFunc="loadDataCallbackFunc">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<input id="role_id" name="role_id" class="mini-hidden"/>
<input id="sort_id" name="sort_id" class="mini-hidden"/>
<table id="table_57932610" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_e1666be3" style="border-width:1px;">
<td>
<input id="textbox_0e4c69cc" style="width:100%" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" label="角色名称：" required="true"/>
</td>
</tr>
<tr id="group_a10e4f3f" style="border-width:1px;">
<td>
<input id="textbox_29a985c2" style="width:100%" labelStyle="text-align:right;" name="role_no" labelField="true" class="mini-textbox" label="角色英文名：" required="true"/>
</td>
</tr>
<tr id="group_068eb24b" style="border-width:1px;">
<td>
<div id="radiobuttonlist_a46df70f" labelStyle="text-align:right;" name="is_system" value="0" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="系统角色标志：" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="group_206fbd99" style="display:none">
<td>
<input id="textbox_4b6c0ad2" style="width:100%" labelStyle="text-align:right;" name="parent_no" labelField="true" class="mini-textbox" label="分类编号：" required="true"/>
</td>
</tr>
<tr id="group_ac91d9ab" style="border-width:1px;">
<td>
<div id="radiobuttonlist_87678a92" labelStyle="text-align:right;" name="is_temp" value="0" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" onvaluechanged="onInvalidChanged" label="是否临时角色：" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="invalidDate" style="display:none">
<td>
<input id="datepicker_b3d19e9b" style="width:100%" labelStyle="text-align:right;" name="invaliddate" labelField="true" class="mini-datepicker" timeFormat="H:mm:ss" showTime="true" label="角色失效时间：" format="yyyy-MM-dd" required="true"/>
</td>
</tr>
<tr id="group_2540f67d" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_edit_role"><a id="button_60a05a3b" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">保存</a>
</@permission>
<a id="button_9339c57f" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_rolebyid","toolbar":[{"eventNo":"e_edit_role","isAlert":"true","alertMsg":"是否提交？","tagId":"button_60a05a3b","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_9339c57f","function":"reset"}],"style":"margin-top:5px","inputs":"role_id:'$role_id$'","loadDataCallBackFunc":"loadDataCallbackFunc","formitem":[{"dataType":"select","format":"is_system","tagId":"radiobuttonlist_a46df70f"},{"dataType":"select","format":"is_temp","tagId":"radiobuttonlist_87678a92"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

function loadDataCallbackFunc(e)
{
var is_temp = e.is_temp;
if(is_temp == "0"){
$("#invalidDate").hide();
}else{
$("#invalidDate").show();
}
mini.parse();
}
function onInvalidChanged(e){
if(e.value == "0"){
$("#invalidDate").hide();
}else{
$("#invalidDate").show();
}
mini.parse();
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>