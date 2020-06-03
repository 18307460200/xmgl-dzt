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
<input id="hidden_772b2e99" name="sort_id" class="mini-hidden"/>
<table id="table_96b6184a" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_a037205f" style="border-width:1px;">
<td>
<input id="textbox_ed2432d9" style="width:100%" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" label="角色名称：" required="true"/>
</td>
</tr>
<tr id="group_6b121482" style="border-width:1px;">
<td>
<input id="textbox_2e6e7857" style="width:100%" labelStyle="text-align:right;" name="role_no" labelField="true" class="mini-textbox" label="角色英文名：" required="true"/>
</td>
</tr>
<tr id="group_a8451511" style="border-width:1px;">
<td>
<div id="radiobuttonlist_8f8690e8" labelStyle="text-align:right;" name="is_system" value="0" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="系统角色标志：" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="group_4b757f52" style="display:none">
<td>
<input id="textbox_85b577aa" style="width:100%" labelStyle="text-align:right;" name="parent_no" labelField="true" class="mini-textbox" label="分类编号：" required="true"/>
</td>
</tr>
<tr id="group_38c34337" style="border-width:1px;">
<td>
<div id="radiobuttonlist_bfad035f" labelStyle="text-align:right;" name="is_temp" value="0" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" onvaluechanged="onInvalidChanged" label="是否临时角色：" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="invalidDate" style="display:none">
<td>
<input id="datepicker_7a5f401b" style="width:100%" labelStyle="text-align:right;" name="invaliddate" labelField="true" class="mini-datepicker" timeFormat="H:mm:ss" showTime="true" label="角色失效时间：" format="yyyy-MM-dd" required="true"/>
</td>
</tr>
<tr id="group_badaadf9" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_add_role"><a id="button_2ca50cc5" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">提交</a>
</@permission>
<a id="button_b79ee86f" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_add_role","isAlert":"true","alertMsg":"是否提交？","tagId":"button_2ca50cc5","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_b79ee86f","function":"reset"}],"style":"margin-top:5px","formitem":[{"dataType":"url","format":"sort_id","tagId":"hidden_772b2e99"},{"dataType":"select","format":"is_system","tagId":"radiobuttonlist_8f8690e8"},{"dataType":"select","format":"is_temp","tagId":"radiobuttonlist_bfad035f"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

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