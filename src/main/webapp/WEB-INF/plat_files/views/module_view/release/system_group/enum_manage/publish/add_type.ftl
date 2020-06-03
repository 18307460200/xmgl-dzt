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
<table id="table_a26caf1a" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<input id="hidden_5940e341" name="sql_ids" class="mini-hidden"/>
<tr id="group_79cf7df4" style="border-width:1px;">
<td colspan="2">
<input id="textbox_76110769" style="width:100%" labelStyle="text-align:right;" name="enum_name" labelField="true" class="mini-textbox" label="类型名称：" required="true"/>
</td>
</tr>
<tr id="group_d426c8a6" style="border-width:1px;">
<td colspan="2">
<input id="textbox_9ff1b649" style="width:100%" labelStyle="text-align:right;" name="enum_no" labelField="true" class="mini-textbox" label="英文编号：" required="true"/>
</td>
</tr>
<tr id="group_f7d9df2a" style="border-width:1px;">
<td colspan="2">
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="是否系统参数：" id="combobox_18e58322" allowInput="true" style="width:100%" showNullItem="false" name="is_system" valueField="item_value" value="1"/>
</td>
</tr>
<tr id="group_d5202c72" style="border-width:1px;">
<td colspan="2">
<div labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-radiobuttonlist" label="是否动态数据字典：" repeatDirection="vertical" id="radiobuttonlist_3ba6f172" name="is_dynamic" valueField="item_value" value="0" onvaluechanged="onSysDynamicChanged" repeatLayout="table"></div>
</td>
</tr>
<tr id="isCache" style="display:none">
<td colspan="2">
<div id="radiobuttonlist_5d7213b0" labelStyle="text-align:right;" name="is_cache" value="0" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="是否缓存：" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="eventTypeId" style="display:none">
<td colspan="2">
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="事件类型：" id="combobox_8ea06ad2" allowInput="true" style="width:100%" showNullItem="false" name="dynamic_type" valueField="item_value" onvaluechanged="onEventTypeChanged" required="true"/>
</td>
</tr>
<tr id="execBusGroupId" style="display:none">
<td>
<input id="textbox_6cdc34c2" style="width:100%" labelStyle="text-align:right;" name="bus_key" labelField="true" class="mini-textbox" label="BusKey：" required="true"/>
</td>
<td>
<input id="textbox_1c71db5e" style="width:100%" labelStyle="text-align:right;" name="func_no" labelField="true" class="mini-textbox" label="功能号：" required="true"/>
</td>
</tr>
<tr id="execFuncImplGroupId" style="display:none">
<td colspan="2">
<input id="textbox_132edccb" style="width:100%" labelStyle="text-align:right;" name="func_impl" labelField="true" class="mini-textbox" label="自定义实现类：" required="true"/>
</td>
</tr>
<tr id="execSqlGroupId" style="display:none">
<td colspan="2">
<input id="buttonedit_ac83b552" showClose="true" style="width:100%" onbuttonclick="onButtonEdit" labelStyle="text-align:right;" name="sql_id" labelField="true" class="mini-buttonedit" label="自定义SQL：" selectOnFocus="true"/>
</td>
</tr>
<tr id="execProcessGroupId" style="display:none">
<td colspan="2">
<input id="textbox_1f07453f" style="width:100%" labelStyle="text-align:right;" name="proc_id" labelField="true" class="mini-textbox" label="存储过程：" required="true"/>
</td>
</tr>
<tr id="dynameicEnumId" style="display:none">
<td>
<input id="textbox_62d35ddc" style="width:100%" labelStyle="text-align:right;" name="dynamic_enum_name" labelField="true" class="mini-textbox" label="枚举字段标识：" required="true"/>
</td>
<td>
<input id="textbox_dc6eaae2" style="width:100%" labelStyle="text-align:right;" name="dynamic_enum_value" labelField="true" class="mini-textbox" label="枚举字段值标识：" required="true"/>
</td>
</tr>
<tr id="group_fa25392e" style="border-width:1px;">
<td align="center" colspan="2" nodeIndex="0">
<@permission eventNo="e_add_enumtype"><a id="button_0fc889bd" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="button_718aa384" style="width:60px;" class="mini-button" iconCls="icon-redo">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_add_enumtype","inputs":"id:'$id$'","tagId":"button_0fc889bd","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_718aa384","function":"reset"}],"style":"margin-top:5px","formitem":[{"dataType":"select","format":"issystem","tagId":"combobox_18e58322"},{"dataType":"select","format":"is_dynamic","tagId":"radiobuttonlist_3ba6f172"},{"dataType":"select","format":"is_cache","tagId":"radiobuttonlist_5d7213b0"},{"dataType":"select","format":"event_type","tagId":"combobox_8ea06ad2"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

function onSysDynamicChanged(e){
if(e.value == "0"){
$("#eventTypeId").hide();
$("#execBusGroupId").hide();
$("#execFuncImplGroupId").hide();
$("#execSqlGroupId").hide();
$("#execProcessGroupId").hide();
$("#dynameicEnumId").hide();
$("#isCache").hide();
mini.parse();
}else if(e.value == "1"){
$("#isCache").show();
$("#eventTypeId").show();
$("#execBusGroupId").show();
$("#execFuncImplGroupId").hide();
$("#execSqlGroupId").hide();
$("#execProcessGroupId").hide();
$("#dynameicEnumId").show();
mini.parse();
}
}
function onEventTypeChanged(e){
if(e.value == '0'){
//执行BUS接口
$("#execBusGroupId").show();
$("#execFuncImplGroupId").hide();
$("#execSqlGroupId").hide();
$("#execProcessGroupId").hide();
mini.parse();
}
else if(e.value == '2'){
//执行自定义实现类
$("#execBusGroupId").hide();
$("#execFuncImplGroupId").show();
$("#execSqlGroupId").hide();
$("#execProcessGroupId").hide();
mini.parse();
}
else if(e.value == '1'){
//执行自定义SQL
$("#execBusGroupId").hide();
$("#execFuncImplGroupId").hide();
$("#execProcessGroupId").hide();
$("#execSqlGroupId").show();
mini.parse();
}
else if(e.value == '3'){
//执行自定义JS
$("#execBusGroupId").hide();
$("#execFuncImplGroupId").hide();
$("#execSqlGroupId").hide();
$("#execProcessGroupId").show();
mini.parse();
}
}
function onButtonEdit(e) {
var btnEdit = this;
var param = new Object();
var frameService = FrameService.getInstance();
frameService.popWindow('添加SQL信息','add_sql',param,650,540,'',function(){
},function(action){
if (action == "ok") {
var iframe = this.getIFrameEl();
var data = iframe.contentWindow.GetData();
data = mini.clone(data); //必须
if (data) {
btnEdit.setValue(data.sql_id);
btnEdit.setText(data.sql_id);
}
}
});
}
function closeAll()
{
var frameService = FrameService.getInstance();
frameService.closeWindow();
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>