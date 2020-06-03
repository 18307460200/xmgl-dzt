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
<div id="form1" eventNo="e_query_sqlenum" inputs="sql_id:'$sql_id$'" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<input id="hidden_7b47f72b" name="sql_type" value="5" class="mini-hidden"/>
<input id="hidden_b854ba30" name="sql_id" class="mini-hidden"/>
<table id="table_600f8164" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_99a99057" style="border-width:1px;">
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="数据源：" emptyText="不填为默认数据源" id="combobox_5c3876f1" allowInput="true" style="width:100%" showNullItem="false" name="datasource" valueField="item_value"/>
</td>
<td>
<input visible="false" labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="数据返回类型：" emptyText="默认为list类型" id="combobox_2ed6e2ac" allowInput="true" style="width:100%" showNullItem="false" name="result_type" valueField="item_value" value="1" require="true"/>
</td>
</tr>
<tr id="group_b4c57f8e" style="border-width:1px;">
<td>
<input id="textbox_210a9717" style="width:100%" labelStyle="text-align:right;" name="tableName" labelField="true" class="mini-textbox" label="数据库表名："/>
</td>
</tr>
<tr nodeIndex="2"><td colspan="2" nodeIndex="0">
<@permission eventNo="e_genrate_sql"><a id="button_acb57cfd" style="margin-left:350px;margin-top:-30px;" class="mini-button">一键生成SQL语句</a>
</@permission>
</td>
</tr>
<tr id="group_99f92e26" style="border-width:1px;">
<td colspan="2">
<div id="ceditor_paren_4e45438a" tagName="ceditor">
<input id="sql_value" style="width:100%;height:350px;" labelStyle="text-align:right;" name="sql_value" labelField="true" class="mini-textarea" emptyText="支持mybatis动态SQL语法" label="SQL语句：" required="true"/>
</div>
</td>
<div tagName="javascript" style="display:none;">
var ceditor = $.tkui["sql_value"];
if (!ceditor) {
require.async("ceditor",
function(CEditor) {
ceditor = new CEditor("ceditor_paren_4e45438a", {"id":"sql_value","colspan":"2","style":"width:100%;height:350px;","labelStyle":"text-align:right;","name":"sql_value","labelField":"true","class":"mini-textarea","emptyText":"支持mybatis动态SQL语法","label":"SQL语句：","required":"true"});
$.tkui["sql_value"] = ceditor;
ceditor.loadViewConfig();
});
}
</div>
</tr>
</table>
<table id="table_804c5b1c" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_97655cab" style="border-width:1px;">
<td colspan="2" align="center" id="button" nodeIndex="0">
<@permission eventNo="e_add_enumsql"><a id="button_070e15f8" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
</@permission>
<a id="button_0a4aa3a7" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_sqlenum","toolbar":[{"eventNo":"e_genrate_sql","paramFunc":"returnSqlParam","callbackFunc":"getSqlCallBac","tagId":"button_acb57cfd","function":"submit"},{"eventNo":"e_add_enumsql","isAlert":"true","alertMsg":"是否提交？","callbackFunc":"submitCallBack","tagId":"button_070e15f8","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_0a4aa3a7","isClose":"true"}],"style":"margin-top:5px","inputs":"sql_id:'$sql_id$'","formitem":[{"dataType":"select","format":"datasource","tagId":"combobox_5c3876f1"},{"dataType":"select","format":"result_type","tagId":"combobox_2ed6e2ac"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

function returnSqlParam()
{
var dataSource = mini.getbyName("datasource").value;
var tableName = mini.getbyName("tableName").value;
var sqlType = 'select';
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
mini.getbyName("sql_id").setValue(sql_id);
}
function GetData() {
var map = {};
map['sql_id'] = mini.getbyName("sql_id").getValue();
return map;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>