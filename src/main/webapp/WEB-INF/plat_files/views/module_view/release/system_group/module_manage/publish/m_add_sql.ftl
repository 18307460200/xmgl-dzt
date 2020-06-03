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
<input id="hidden_46249287" name="module_id" class="mini-hidden"/>
<input id="hidden_10a29798" name="event_id" class="mini-hidden"/>
<table id="table_96fe6e7a" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_c9df20c5" style="border-width:1px;">
<td>
<input id="textbox_1fc62032" style="width:100%" labelStyle="text-align:right;" name="sql_no" labelField="true" class="mini-textbox" emptyText="英文字符" require="true" label="SQL编号：" required="true"/>
</td>
</tr>
<tr id="group_d82ba1f5" style="border-width:1px;">
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="数据源：" emptyText="不填为默认数据源" id="combobox_cdadc55e" allowInput="true" style="width:100%" showNullItem="false" name="datasource" valueField="item_value"/>
</td>
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="SQL类型：" emptyText="请选择SQL类型" id="combobox_f5f09dbd" allowInput="true" style="width:100%" showNullItem="false" name="sql_type" valueField="item_value" onvaluechanged="valuechanged"/>
</td>
</tr>
<tr id="group_798e8afe" style="border-width:1px;">
<td>
<input id="textbox_0d3e99dc" visible="false" style="width:100%" labelStyle="text-align:right;" name="result_number" value="0" labelField="true" class="mini-textbox" require="true" label="查询结果集数量："/>
</td>
<td>
<input visible="false" labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="数据返回类型：" emptyText="默认为list类型" id="combobox_05ce5892" allowInput="true" style="width:100%" showNullItem="false" name="result_type" valueField="item_value" value="1" require="true"/>
</td>
</tr>
<tr id="group_8c588bc0" style="border-width:1px;">
<td>
<input id="textbox_83a0f625" style="width:100%" labelStyle="text-align:right;" name="tableName" labelField="true" class="mini-textbox" label="数据库表名："/>
</td>
</tr>
<tr nodeIndex="4"><td colspan="2" nodeIndex="0">
<@permission eventNo="e_genrate_sql"><a id="button_6a97f47d" style="margin-left:450px;margin-top:-40px;" class="mini-button">一键生成SQL语句</a>
</@permission>
</td>
</tr>
<tr id="group_20029313" style="border-width:1px;">
<td colspan="2">
<div id="ceditor_paren_67214013" tagName="ceditor">
<input id="sql_value" style="width:100%;height:350px;" labelStyle="text-align:right;" name="sql_value" labelField="true" class="mini-textarea" emptyText="支持mybatis动态SQL语法" label="SQL语句：" required="true"/>
</div>
</td>
<div tagName="javascript" style="display:none;">
var ceditor = $.tkui["sql_value"];
if (!ceditor) {
require.async("ceditor",
function(CEditor) {
ceditor = new CEditor("ceditor_paren_67214013", {"id":"sql_value","colspan":"2","style":"width:100%;height:350px;","labelStyle":"text-align:right;","name":"sql_value","labelField":"true","class":"mini-textarea","emptyText":"支持mybatis动态SQL语法","label":"SQL语句：","required":"true"});
$.tkui["sql_value"] = ceditor;
ceditor.loadViewConfig();
});
}
</div>
</tr>
</table>
<table id="table_10d632af" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_50581f51" style="border-width:1px;">
<td colspan="2" align="center" id="button" nodeIndex="0">
<@permission eventNo="e_add_sql"><a id="submit" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="add" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_genrate_sql","paramFunc":"returnSqlParam","callbackFunc":"getSqlCallBac","tagId":"button_6a97f47d","function":"submit"},{"eventNo":"e_add_sql","isAlert":"true","alertMsg":"是否提交？","tagId":"submit","isValid":"true","isClose":"true","function":"submit"},{"tagId":"add","isClose":"true"}],"style":"margin-top:5px","formitem":[{"dataType":"url","format":"module_id","tagId":"hidden_46249287"},{"dataType":"url","format":"event_id","tagId":"hidden_10a29798"},{"dataType":"select","format":"datasource","tagId":"combobox_cdadc55e"},{"dataType":"select","format":"sql_type","tagId":"combobox_f5f09dbd"},{"dataType":"select","format":"result_type","tagId":"combobox_05ce5892"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

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
var sql_id=e.results.results[0].sql_id;
window.parent.setSqlId(sql_id);
window.parent.closeAll();
}
function add_sql(){
var form = new mini.Form("form1");
form.validate();
if(!form.isValid())
return false;
var data = form.getData();
FrameService.getInstance().processSubmit(submitComplte, "e_add_sql", data,
null, null,true,null);
function submitComplte(e)
{
$("#button").find(".mini-button").each(function(){
$(this).attr("class","mini-button mini-button-disabled");
});
var sql_id=e.obj.results.results[0].sql_id;
window.parent.setSqlId(sql_id);
var n =mini.getParams().n;
window.parent.closeCurWin(n);
window.parent.add_sql();
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>