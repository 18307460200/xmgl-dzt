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
<style type="text/css" nodeIndex="0">
.dc_itspan {
display: block;
width: 100%;
height: 30px;
line-height: 26px;
margin-bottom: 4px;
overflow: hidden;
}
.dc_itspan .dc_text {
display: inline-block;
}
.dc_enter {
padding: 20px 0 0 0;
margin-top: 8px;
text-align: center;
overflow: hidden;
}
</style>
<div id="form1" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<fieldset id="fieldset_6dae31f9" style="font-size: 14px;line-height: 40px;border-width:1px">
<legend><span>导出范围</span></legend>
<div class="fieldset-body">
<div class="fieldset-body" nodeIndex="0">
<span class="dc_itspan" nodeIndex="0">
<label nodeIndex="0"> <input type="radio" name="RadioGroup1" value="1" checked="checked" nodeIndex="0"></input> 当前页</label>
</span>
<span class="dc_itspan" nodeIndex="1">
<label nodeIndex="0"> <input type="radio" name="RadioGroup1" value="2" nodeIndex="0"></input> 指定页</label>
<span class="dc_text" nodeIndex="1"> <span nodeIndex="0">第</span>
<input id="exportPage" value="1" style="width:40px;height: 18px;line-height: 18px;" nodeIndex="1"></input><span nodeIndex="2"> 页</span>
</span>
</span>
<span class="dc_itspan" nodeIndex="2">
<label nodeIndex="0"> <input type="radio" name="RadioGroup1" value="3" nodeIndex="0"></input> 全部</label>
</span>
<span class="dc_itspan" nodeIndex="3">
<label nodeIndex="0"> <input type="radio" name="RadioGroup1" value="4" nodeIndex="0"></input> 页码范围</label>
<span class="dc_text" nodeIndex="1"> 从 <input type="text" id="startPage" value="1" style="width:40px;height: 18px;line-height: 18px;" nodeIndex="0"></input> - <input type="text" id="endPage" value="2" style="width:40px;height: 18px;line-height: 18px;" nodeIndex="1"></input> 页</span>
</span>
</div>
</div>
</fieldset>
<fieldset id="fieldset_8bb77506" style="font-size: 14px;line-height: 40px;border-width:1px">
<legend><span>单个文件导出记录条数</span></legend>
<div class="fieldset-body">
<div class="fieldset-body" nodeIndex="0">
<span class="dc_itspan" nodeIndex="0">
<span class="dc_text" nodeIndex="0"> <span nodeIndex="0">记录数</span>
<input id="export_records" value="5000" style="width: 60px;height: 18px;line-height: 18px;" nodeIndex="1"></input>
<span nodeIndex="2">默认为当前分页数，最大为60000条</span>
</span>
</span>
</div>
</div>
</fieldset>
<fieldset id="fieldset_61f8e2db" style="font-size: 14px;line-height: 40px;border-width:1px">
<legend><span>导出文件名</span></legend>
<div class="fieldset-body">
<div class="fieldset-body" nodeIndex="0">
<span class="dc_itspan" nodeIndex="0">
<span class="dc_text" nodeIndex="0"> <span nodeIndex="0">文件名</span>
<input id="export_fileName" style="height: 18px;line-height: 18px;width: 150px;" nodeIndex="1"></input>
<span nodeIndex="2">.xls</span>
</span>
</span>
</div>
</div>
</fieldset>
<div class="dc_enter" nodeIndex="3">
<div class="lit" style="width: 100%;text-align:center;" nodeIndex="0">
<input id="export_submit" type="button" value=" 提 交 " style="cursor: pointer;height: 28px;line-height: 28px;width:70px;" nodeIndex="0"></input>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","style":"margin-top:5px"});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

mini.parse();
var param = mini.getParams();
var exPageObj = $("#exportPage");
var exCordObj = $("#export_records");
var startPageObj = $("#startPage");
var endPageObj = $("#endPage");
var pageSize = param.pageSize;
$("#export_records").val(pageSize);
var type;
var records;
var exportPage = 1;
var fileName ="";
var exportPageSize ;
var exportPageIndex ;
var startPage ;
var endPage ;
noEditable();
$("#export_submit").click(function(){
type = $("input[type='radio']:checked").val();
records = $("#export_records").val();
var flag = true;
if(flag){
flag = chkExportPage();
}
if(type == 1){
exportPage = parseInt(param.pageIndex)+1;
//param["pageIndex"] = exportPage;
}else if(type == 2){
exportPage = $("#exportPage").val();
var limitRows = 10000/parseInt(param.pageSize);
var totalRows = param.totalCount;
if(totalRows != param.pageSize){//导出的记录数改变，重新计算
limitRows = totalRows/records+1;
}
if($.string.isEmpty(exportPage)){
window.top.mini.alert("指定导出页不能为空！");
flag = false;
}else if(exportPage < 1 || parseInt(exportPage) > parseInt(totalRows) || parseInt(exportPage) > parseInt(limitRows)){
var temStr = limitRows < totalRows ? limitRows : totalRows;
window.top.mini.alert("指定导出页超出可导出的范围("+parseInt(temStr)+")！");
flag = false;
}
delete param["pageIndex"];
//param["pageIndex"] = exportPage;
//param["pageSize"]= records;
}else if(type == 3){//全部 第 1 页 + <=10000条
exportPage = 1;
records = $("#export_records").val();
if(records > 60000){
window.top.mini.alert("导出数据不能超过60000条！");
flag = false;
}
delete param["pageSize"];
delete param["pageIndex"];
//param["pageSize"] = records;
//param["pageIndex"] = exportPage;
}else if(type == 4){
startPage = $("#startPage").val();
endPage = $("#endPage").val();
records = $("#export_records").val();
var totalRows = param.totalCount;
var limitRows = parseInt(parseInt(param.totalCount)/records) +1;
if($.string.isEmpty(startPage) || $.string.isEmpty(endPage)){
window.top.mini.alert("导出起始页和导出截止页不能为空！");
flag = false;
}
else if(startPage < 1 || startPage > limitRows){
window.top.mini.alert("导出起始页超出可导出的范围！");
flag = false;
}
else if(endPage < 1 || endPage > limitRows)
{
window.top.mini.alert("导出截止页超出可导出("+limitRows+"页)的范围！");
flag = false;
}
else if(endPage < startPage)
{
window.top.mini.alert("导出截止页不能小于导出起始页！");
flag = false;
}
else if((endPage - startPage) * records >60000)
{
window.top.mini.alert("导出数据不能超过60000条！");
flag = false;
}
}
exportPageSize = records;
exportPageIndex = exportPage;
if(type == 4){
exportPageSize = 100000;
exportPageIndex = 1;
}
if(flag){
fileName = $("#export_fileName").val();
if($.string.isEmpty(fileName)){
window.top.mini.alert("导出文件名不能为空！");
flag = false;
}
}
if(flag){
$("#export_submit").attr("disabled", true);
var frameService = FrameService.getInstance();
frameService.closeWindow("ok");
}
});
function GetData() {
var param = new Object();
param.exportPage = exportPage;
param.records = records;
param.fileName = fileName;
param.exportPageSize = exportPageSize;
param.exportPageIndex = exportPageIndex;
param.startPage = startPage;
param.endPage = endPage;
param.export_type = type;
return param;
}
$("input[type='radio']").change(function(){
var recordObj = $("#export_records");
var stype = parseInt($(this).val());
switch(stype){
case 3 :{
var rows = 60000;
if(param.totalCount < 60000){
rows = param.totalCount;
}
recordObj.val(rows);
break;
};
default :{
var pageSize = param.pageSize;
recordObj.val(pageSize);
};
};
switch(stype){
case 1 :{
noEditable();
break;
};
case 3 :{
editable();
break;
}
case 4 :{
editStart();
break;
}
default :{
isDisplay();
break;
};
};
});
function chkExportPage(){
var f = true;
var records = $("#export_records").val();
var stype = $("input[type='radio']:checked").val();
if($.string.isEmpty(records)){
window.top.mini.alert("单个文件导出记录条数不能为空！");
f = false;
}else if(stype != 3 && (records < 1 || records > 60000)){
window.top.mini.alert("单个文件导出记录条数超出范围！(1--60000)");
f = false;
}
return f;
};
function editable(){
exPageObj.attr("disabled",true).css("background-color","#ccc");
exCordObj.attr("disabled",false).css("background-color","");
startPageObj.attr("disabled",true).css("background-color","#ccc");
endPageObj.attr("disabled",true).css("background-color","#ccc");
};
function isDisplay(){
exPageObj.attr("disabled",false).css("background-color","");
exCordObj.attr("disabled",false).css("background-color","");
startPageObj.attr("disabled",true).css("background-color","#ccc");
endPageObj.attr("disabled",true).css("background-color","#ccc");
};
function noEditable(){
exPageObj.attr("disabled",true).css("background-color","#ccc");
exCordObj.attr("disabled",true).css("background-color","#ccc");
startPageObj.attr("disabled",true).css("background-color","#ccc");
endPageObj.attr("disabled",true).css("background-color","#ccc");
};
function editStart(){
exPageObj.attr("disabled",true).css("background-color","#ccc");
exCordObj.attr("disabled",false).css("background-color","");
startPageObj.attr("disabled",false).css("background-color","");
endPageObj.attr("disabled",false).css("background-color","");
};

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>