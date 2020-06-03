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
<div id="form1" eventNo="e_query_eventbyid" inputs="event_id:'$event_id$'" style="margin-top:5px" loadDataCallBackFunc="loadDataCallbackFunc">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<input id="hidden_d020be85" name="module_id" class="mini-hidden"/>
<input id="hidden_b1d47bdf" name="event_id" class="mini-hidden"/>
<table id="table_ef1780d3" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_9d2c39da" style="border-width:1px;">
<td>
<input id="textbox_ea1c7598" style="width:100%" labelStyle="text-align:right;" name="event_name" labelField="true" class="mini-textbox" label="事件名称：" required="true"/>
</td>
<td>
<input id="textbox_93c4dac4" style="width:100%" labelStyle="text-align:right;" name="event_no" labelField="true" class="mini-textbox" emptyText="请输入事件英文编号，同一模块下编号必须唯一，采用小写下划线命名法" label="事件编号：" required="true"/>
</td>
</tr>
<tr id="group_0a874862" style="border-width:1px;">
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="事件类型：" id="combobox_96021b42" allowInput="true" style="width:100%" showNullItem="false" name="event_type" valueField="item_value" onvaluechanged="onEventTypeChanged" required="true"/>
</td>
<td nodeIndex="1">
<input id="checkbox_3df846aa" text="是否判断权限" trueValue="1" visible="false" style="margin-left:100px;margin-bottom:5px;display:block;" falseValue="0" name="is_rights" class="mini-checkbox"/>
</td>
</tr>
<tr id="group_ed772f98" style="border-width:1px;">
<td nodeIndex="0">
<input id="checkbox_8d2b93d7" text="是否判断数据权限" trueValue="1" visible="false" style="margin-left:100px;margin-bottom:5px;display:block;" falseValue="0" name="data_rights" class="mini-checkbox" onvaluechanged="onValueChanged"/>
</td>
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="数据权限要素：" id="data_type" allowInput="true" style="display:none" showNullItem="false" name="data_type" valueField="item_value" required="true"/>
</td>
</tr>
<tr id="execBusGroupId" style="display:none">
<td>
<input id="textbox_d429dbf1" style="width:100%" labelStyle="text-align:right;" name="bus_key" labelField="true" class="mini-textbox" label="BusKey：" required="true"/>
</td>
<td>
<input id="textbox_d9fb20be" style="width:100%" labelStyle="text-align:right;" name="func_no" labelField="true" class="mini-textbox" label="功能号：" required="true"/>
</td>
</tr>
<tr id="execFuncImplGroupId" style="display:none">
<td colspan="2">
<input id="textbox_b941192b" style="width:100%" labelStyle="text-align:right;" name="func_impl" labelField="true" class="mini-textbox" label="自定义实现类：" required="true"/>
</td>
</tr>
<tr id="execSqlGroupId" style="display:none">
<td colspan="2">
<input id="sql_id" showClose="true" style="width:100%" labelStyle="text-align:right;" name="sql_id" labelField="true" class="mini-buttonedit" label="自定义SQL：" required="true" selectOnFocus="true"/>
</td>
</tr>
<tr id="execProcessGroupId" style="display:none">
<td colspan="2">
<input id="textbox_45b86b69" style="width:100%" labelStyle="text-align:right;" name="proc_id" labelField="true" class="mini-textbox" label="存储过程：" required="true"/>
</td>
</tr>
<tr id="group_136664e0" style="border-width:1px;">
<td colspan="2">
<input id="textarea_6b184010" style="width:100%;height:50px;" labelStyle="text-align:right;" name="description" labelField="true" class="mini-textarea" label="事件描述："/>
</td>
</tr>
</table>
<table id="table_c36df8c7" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_57b5626e" style="border-width:1px;">
<td colspan="2" align="center" nodeIndex="0">
<@permission eventNo="e_edite_event"><a id="button_bfc4a236" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
</@permission>
<a id="button_af3897f8" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_eventbyid","toolbar":[{"eventNo":"e_edite_event","isAlert":"true","alertMsg":"是否提交？","tagId":"button_bfc4a236","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_af3897f8","isClose":"true"}],"style":"margin-top:5px","inputs":"event_id:'$event_id$'","loadDataCallBackFunc":"loadDataCallbackFunc","formitem":[{"dataType":"url","format":"module_id","tagId":"hidden_d020be85"},{"dataType":"url","format":"event_id","tagId":"hidden_b1d47bdf"},{"dataType":"select","format":"event_type","tagId":"combobox_96021b42"},{"dataType":"select","format":"data_type","tagId":"data_type"},{"title":"添加SQL信息","dataType":"popWindow","height":"600","paramFunc":"addSqlParam","width":"1200","callbackFunc":"addSQL","format":"m_edit_sql_n","displayName":"添加SQL信息","tagId":"sql_id"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

function loadDataCallbackFunc(e){
var eventType = e.event_type;
if(eventType=='0')
{
$("#execBusGroupId").show();
}else if(eventType=='1')
{
mini.getbyName("sql_id").setText(e.sql_id);
$("#execSqlGroupId").show();
}
else if(eventType=='2')
{
$("#execFuncImplGroupId").show();
}
else if(eventType=='3')
{
$("#execProcessGroupId").show();
}
var data_rights = e.data_rights;
if(data_rights=='1'){
mini.get("data_type").show();
}else{
mini.get("data_type").hide();
}
mini.parse();
}
function onEventTypeChanged(e){
if(e.value == '0'){
//执行BUS接口
$("#execBusGroupId").show();
$("#execFuncImplGroupId").hide();
$("#execSqlGroupId").hide();
$("#execProcessGroupId").hide();
}
else if(e.value == '2'){
//执行自定义实现类
//alert("执行自定义实现类");
$("#execBusGroupId").hide();
$("#execFuncImplGroupId").show();
$("#execSqlGroupId").hide();
$("#execProcessGroupId").hide();
}
else if(e.value == '1'){
//执行自定义SQL
//alert("执行自定义SQL");
$("#execBusGroupId").hide();
$("#execFuncImplGroupId").hide();
$("#execSqlGroupId").show();
$("#execProcessGroupId").hide();
}
else if(e.value == '3'){
//执行存储过程
$("#execBusGroupId").hide();
$("#execFuncImplGroupId").hide();
$("#execSqlGroupId").hide();
$("#execProcessGroupId").show();
}
mini.parse();
}
function addSqlParam()
{
var param = new Object();
param.event_id = mini.getbyName("event_id").value;
var module_id = mini.getbyName("module_id").value;
param.module_id=module_id;
return param;
}
function addSQL(action,iframe)
{
var btnEdit = mini.get("sql_id");
var data = iframe.contentWindow.GetData();
data = mini.clone(data); //必须
if (data)
{
btnEdit.setValue(data);
btnEdit.setText(data);
}
}
function onValueChanged(e) {
var checked = this.getChecked();
if(checked){
mini.get("data_type").show();
}else{
mini.get("data_type").hide();
mini.get("data_type").setValue("")
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>