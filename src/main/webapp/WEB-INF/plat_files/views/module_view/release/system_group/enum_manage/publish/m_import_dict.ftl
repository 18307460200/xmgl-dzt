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
.dc_list h3 {
padding: 0 0 0 12px;
height: 28px;
line-height: 28px;
color: #074895;
background: #ebebeb;
font-size: 14px;
font-weight: bold;
}
.dc_list .con {
padding: 14px 0 14px 20px;
overflow: hidden;
}
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
<fieldset id="fieldset_19c7a2bb" style="font-size: 14px;line-height: 40px;border-width:1px">
<legend><span>选择导入的数据字典类型</span></legend>
<div class="fieldset-body">
<div class="fieldset-body" nodeIndex="0">
<span class="dc_itspan" nodeIndex="0">
<label nodeIndex="0"> <input type="radio" name="RadioGroup1" value="1" checked="checked" nodeIndex="0"></input> 全量导入</label>
</span>
<span class="dc_itspan" style="height:50px;" nodeIndex="1">
<label nodeIndex="0"> <input type="radio" name="RadioGroup1" value="2" nodeIndex="0"></input> 单个类型</label>
<span class="dc_text" nodeIndex="1">
<td>
<input textField="item_name" class="mini-combobox" emptyText="请选择..." nullItemText="请选择..." id="dict_sort" allowInput="flase" style="width:100%" showNullItem="false" name="dict_sort" valueField="item_value"/>
</td>
</span>
</span>
</div>
</div>
</fieldset>
<fieldset id="fieldset_7d2ea423" style="font-size: 14px;line-height: 40px;border-width:1px">
<legend><span>上传文件</span></legend>
<div class="fieldset-body">
<div class="fieldset-body" nodeIndex="0">
<span class="dc_itspan" style="height:50px;" nodeIndex="0"><label nodeIndex="0"> 上传文件：</label>
<span class="dc_text" nodeIndex="1"> <td>
<input id="upload_483f1c1c" showClose="true" allowInput="false" style="width:100%" labelStyle="width:120px;text-align:right;" name="dict_url" class="mini-buttonedit" emptyText="请选择..." selectOnFocus="true"/>
<div tagName="javascript" style="display:none;">
var upload = $.tkui["upload_483f1c1c"];
if (!upload) {
require.async("upload",
function(Upload) {
upload = new Upload("upload_483f1c1c", {"height":"400","bcode":"png_upload","width":"600","tagId":"upload_483f1c1c"});
$.tkui["upload_483f1c1c"] = upload;
upload.loadViewConfig();
});
}
</div>
</td>
</span>
</span>
</div>
</div>
</fieldset>
<div class="dc_enter" nodeIndex="2">
<div class="lit" style="width: 100%;text-align:center;" nodeIndex="0">
<@permission eventNo="e_imp_dict"><a id="button_ad890672" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="button_0023faf4" style="width:60px;" class="mini-button" iconCls="icon-redo">关闭</a>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_imp_dict","paramFunc":"getParam","tagId":"button_ad890672","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_0023faf4","isClose":"true"}],"style":"margin-top:5px","formitem":[{"dataType":"select","format":"dict_sort","tagId":"dict_sort"},{"height":"400","bcode":"png_upload","width":"600","tagId":"upload_483f1c1c"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

$.tkReady=function()
{
mini.parse();
var params = mini.getParams();
var id = params.id;
var type = params.type;
var data = mini.get("dict_sort").getData();
if(data.length>0 && typeof(id)!='undefined' && type=='S')
{
$("input[type='radio'][value='2']").prop("checked", "checked");
mini.get("dict_sort").setValue(id);
}else{
mini.get("dict_sort").setEnabled(false);
}
$("input[type='radio']").change(function(){
var stype = parseInt($(this).val());
switch(stype){
case 1 :{
noEditable();
break;
};
case 2 :{
editable();
break;
};
};
});
}
function noEditable()
{
mini.get("dict_sort").setEnabled(false);
}
function editable()
{
mini.get("dict_sort").setEnabled(true);
}
function getParam()
{
var param = {};
param.dict_type = $("input[type='radio']:checked").val();
return param;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>