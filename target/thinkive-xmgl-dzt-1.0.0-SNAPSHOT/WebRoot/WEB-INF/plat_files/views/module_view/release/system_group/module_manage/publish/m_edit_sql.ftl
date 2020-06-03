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
<div id="form1" eventNo="e_query_sqlevent" inputs="module_id:'$module_id$',sql_id:'$sql_id$'" style="margin-top:5px" loadDataCallBackFunc="loadDataCallBackFunc">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<input id="hidden_53e12fc7" name="module_id" class="mini-hidden"/>
<input id="hidden_b619f70b" name="sql_id" class="mini-hidden"/>
<table id="table_53014784" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_8be1c173" style="border-width:1px;">
<td>
<input id="textbox_4d27ad29" style="width:100%" labelStyle="text-align:right;" name="sql_no" labelField="true" class="mini-textbox" emptyText="英文字符" label="SQL编号：" required="true"/>
</td>
<td>
<input id="textbox_e2297239" style="width:100%" labelStyle="text-align:right;" name="orderline" labelField="true" class="mini-textbox" label="排序值：" required="true"/>
</td>
</tr>
<tr id="group_2821f9a8" style="border-width:1px;">
<td>
<input id="combobox_f245cf3a" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="datasource" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" emptyText="不填为默认数据源" label="数据源："/>
</td>
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="SQL类型：" emptyText="请选择SQL类型" id="combobox_1a04de79" allowInput="true" style="width:100%" showNullItem="false" name="sql_type" valueField="item_value" onvaluechanged="valuechanged"/>
</td>
</tr>
<tr id="group_cb5f26d5" style="border-width:1px;">
<td>
<input id="textbox_11db503f" visible="false" style="width:100%" labelStyle="text-align:right;" name="result_number" value="0" labelField="true" class="mini-textbox" label="查询结果集数量："/>
</td>
<td>
<input visible="false" labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="数据返回类型：" emptyText="默认为list类型" id="combobox_032922c0" allowInput="true" style="width:100%" showNullItem="false" name="result_type" valueField="item_value" value="1"/>
</td>
</tr>
<tr id="group_f7c29841" style="border-width:1px;">
<td>
<input id="textbox_65c4feda" style="width:100%" labelStyle="text-align:right;" name="tableName" labelField="true" class="mini-textbox" label="数据库表名："/>
</td>
</tr>
<tr nodeIndex="4"><td colspan="2" nodeIndex="0">
<@permission eventNo="e_genrate_sql"><a id="button_18de3064" style="margin-left:450px;margin-top:-60px;" class="mini-button">一键生成SQL语句</a>
</@permission>
</td>
</tr>
<tr id="group_06257bf0" style="border-width:1px;">
<td>
<div id="state" labelStyle="text-align:right;" name="state" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="状态：" repeatLayout="table" repeatDirection="vertical"></div>
</td>
</tr>
<tr id="group_ab6ab010" style="border-width:1px;">
<td colspan="2">
<div id="ceditor_paren_158791f6" tagName="ceditor">
<input id="sql_value" style="width:100%;height:340px;" labelStyle="text-align:right;" name="sql_value" labelField="true" class="mini-textarea" emptyText="支持mybatis动态SQL语法" label="SQL语句：" required="true"/>
</div>
</td>
<div tagName="javascript" style="display:none;">
var ceditor = $.tkui["sql_value"];
if (!ceditor) {
require.async("ceditor",
function(CEditor) {
ceditor = new CEditor("ceditor_paren_158791f6", {"id":"sql_value","colspan":"2","style":"width:100%;height:340px;","labelStyle":"text-align:right;","name":"sql_value","labelField":"true","class":"mini-textarea","emptyText":"支持mybatis动态SQL语法","label":"SQL语句：","required":"true"});
$.tkui["sql_value"] = ceditor;
ceditor.loadViewConfig();
});
}
</div>
</tr>
</table>
<table id="table_93bf7733" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_124fb513" style="border-width:1px;">
<td colspan="2" align="center" id="button" nodeIndex="0">
<@permission eventNo="e_add_sql"><a id="submit" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="delete" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_sqlevent","toolbar":[{"eventNo":"e_genrate_sql","paramFunc":"returnSqlParam","callbackFunc":"getSqlCallBac","tagId":"button_18de3064","function":"submit"},{"eventNo":"e_add_sql","isAlert":"true","alertMsg":"是否提交？","tagId":"submit","isValid":"true","isClose":"true","function":"submit"},{"tagId":"delete","isClose":"true"}],"style":"margin-top:5px","inputs":"module_id:'$module_id$',sql_id:'$sql_id$'","loadDataCallBackFunc":"loadDataCallBackFunc","formitem":[{"dataType":"url","format":"module_id","tagId":"hidden_53e12fc7"},{"dataType":"url","format":"sql_id","tagId":"hidden_b619f70b"},{"dataType":"select","format":"datasource","tagId":"combobox_f245cf3a"},{"dataType":"select","format":"sql_type","tagId":"combobox_1a04de79"},{"dataType":"select","format":"result_type","tagId":"combobox_032922c0"},{"dataType":"select","format":"state","tagId":"state"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

function loadDataCallBackFunc(e){
var type = e.sql_type;
if(type == "0"){
mini.getbyName("result_number").setVisible(true);
mini.getbyName("result_type").setVisible(true);
mini.parse();
}
}
function valuechanged(e)
{
var value = e.value;
var sqlType= $.tkui["sql_value"];
if(value=='0')
{
sqlType.setContent("<select></select>");
mini.getbyName("result_number").setVisible(true);
mini.getbyName("result_type").setVisible(true);
mini.parse();
}
else if(value=='1')
{
sqlType.setContent("<update></update>");
mini.getbyName("result_number").setVisible(false);
mini.getbyName("result_type").setVisible(false);
mini.parse();
}
else if(value=='2')
{
sqlType.setContent("<insert></insert>");
mini.getbyName("result_number").setVisible(false);
mini.getbyName("result_type").setVisible(false);
mini.parse();
}
else
{
sqlType.setContent("<delete></delete>");
mini.getbyName("result_number").setVisible(false);
mini.getbyName("result_type").setVisible(false);
mini.parse();
}
}
function returnSqlParam()
{
var dataSource = mini.getbyName("datasource").value;
var tableName = mini.getbyName("tableName").value;
var sqlType = mini.getbyName("sql_type").value;
if(sqlType=='0')
sqlType='select';
else if(sqlType=='1')
sqlType='update';
else if(sqlType=='2')
sqlType='insert';
else if(sqlType=='3')
sqlType='delete';
var data={"tableName":tableName,"dataSource":dataSource,"sqlType":sqlType};
return data;
}
function getSqlCallBac(e)
{
if(e.error_no=='0')
{
var sqlType= $.tkui["sql_value"];
sqlType.setContent(e.results.results[0].sqlContent);
}
}
function submitCallBack(e)
{
window.parent.closeAll();
}
function GetData() {
var map = {};
map['sql_id'] = mini.getbyName("sql_id").getValue();
map['sql_value'] = mini.getbyName("sql_value").getValue();
return map;
}
function add_sql(){
var form = new mini.Form("form1");
if(!form.isValid()){
return;
}
var data = new mini.Form("form1").getData();
FrameService.getInstance().processSubmit(submitComplte, "e_add_sql", data,
null, null,true,null);
function submitComplte(e)
{
$("#button").find(".mini-button").each(function(){
$(this).attr("class","mini-button mini-button-disabled");
});
var n =mini.getParams().n;
window.parent.closeCurWin(n);
window.parent.add_sql();
}
}
function delete_sql(){
var data = new mini.Form("form1").getData();
var sql_id = data.sql_id;
FrameService.getInstance().processSubmit(submitComplte, "e_delete_sql", data,
null, null,true,null);
function submitComplte(e)
{
if(e.getErrorNo() == 0){
FrameService.getInstance().closeWindow("ok");
window.parent.getSqlId(sql_id);
}else{
var errorInfo = e.getErrorInfo();
if ($.string.isNotEmpty(errorInfo)) {
window.top.mini.alert(errorInfo);
}
}
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>