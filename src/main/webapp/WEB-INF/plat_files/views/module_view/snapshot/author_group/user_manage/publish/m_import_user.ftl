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
<div id="form1" style="width:80%;height:100%;margin-left:4%">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_2e26a9e3" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_6d92a1c4" style="height:10px">
</tr>
<tr nodeIndex="1"><td nodeIndex="0"><span style="margin-left:40px" nodeIndex="0">导入模板：</span><a href="${ctxPath}/upload/tempFile/importUser.xlsx" nodeIndex="1">点击下载导入模板</a></td></tr>
<tr id="group_1af13bd7" style="height:10px">
</tr>
<tr id="group_9ac90f36" style="border-width:1px;">
<td>
<input id="upload_8fb44d72" showClose="true" allowInput="false" style="width:100%" labelStyle="text-align:right;" name="file_data" labelField="true" class="mini-buttonedit" label="导入用户信息：" emptyText="请选择..." required="true" selectOnFocus="true"/>
<div tagName="javascript" style="display:none;">
var upload = $.tkui["upload_8fb44d72"];
if (!upload) {
require.async("upload",
function(Upload) {
upload = new Upload("upload_8fb44d72", {"height":"300","bcode":"import_upload","width":"500","tagId":"upload_8fb44d72"});
$.tkui["upload_8fb44d72"] = upload;
upload.loadViewConfig();
});
}
</div>
</td>
</tr>
<tr id="group_f5635b74" style="border-width:1px;">
<td style="height:60px;padding-left:35%;" nodeIndex="0">
<@permission eventNo="e_import_user"><a id="button_d01c6d1e" style="width:80px" class="mini-button">确认导入</a>
</@permission>
<a id="button_41e26320" style="margin-left:20px;width:60px;" class="mini-button">关闭</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_import_user","tagId":"button_d01c6d1e","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_41e26320","isClose":"true"}],"style":"width:80%;height:100%;margin-left:4%","formitem":[{"height":"300","bcode":"import_upload","width":"500","tagId":"upload_8fb44d72"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>