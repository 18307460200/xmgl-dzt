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
<fieldset id="fieldset_fc8557f4" style="border:solid 1px #aaa;padding:3px;">
<legend><span>商户基本信息</span></legend>
<div class="fieldset-body">
<table id="table_2ee2dd3a" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_2981a2b3" style="border-width:1px;">
<td>
<input id="textbox_9d965103" style="width:100%" labelStyle="text-align:right;" name="merchant_name" labelField="true" class="mini-textbox" emptyText="请输入商户名称" label="商户名称：" required="true"/>
</td>
</tr>
<tr id="group_a752a413" style="border-width:1px;">
<td>
<input id="textbox_6468af2d" style="width:100%" labelStyle="text-align:right;" name="merchant_no" labelField="true" class="mini-textbox" emptyText="请输入商户编号(小写英文字母)" label="商户编号：" required="true"/>
</td>
</tr>
<td>
<input id="radiolist_f91450ef" style="width:100%" labelStyle="text-align:right;" name="status" value="1" repeatItems="3" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="状态：" repeatLayout="table"/>
</td>
<tr id="group_f2262dbc" style="border-width:1px;">
<td>
<input id="datepicker_48464bf3" style="width:100%" labelStyle="text-align:right;" name="register_date" labelField="true" class="mini-datepicker" timeFormat="H:mm:ss" showTime="true" emptyText="请选择日期" label="注册时间：" format="yyyy-MM-dd H:mm:ss" alwaysView="true"/>
</td>
</tr>
<tr id="group_ce665c41" style="border-width:1px;">
<td>
<input labelStyle="text-align:right;" labelField="true" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" label="有效期：" vtype="yyyy-MM-dd" emptyText="请选择日期" format="yyyy-MM-dd" alwaysView="true" id="datepicker_fa14e3e5" style="width:100%" name="expiry_date"/>
</td>
</tr>
<tr id="group_91e7e442" style="border-width:1px;">
<td>
<input id="textbox_81319645" style="width:100%" labelStyle="text-align:right;" name="description" labelField="true" class="mini-textbox" label="描述："/>
</td>
</tr>
</table>
</div>
</fieldset>
<fieldset id="fieldset_e389783b" style="border:solid 1px #aaa;padding:3px;">
<legend><span>商户安全信息</span></legend>
<div class="fieldset-body">
<table id="table_3c3e8cb6" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_8ffedf9b" style="border-width:1px;">
<td>
<input id="textbox_e8df7e57" style="width:100%" labelStyle="text-align:right;" name="sign_key" labelField="true" class="mini-textbox" emptyText="请输入签名key" vtype="maxLength:32" label="签名KEY："/>
</td>
</tr>
<tr id="group_ccf4ca32" style="border-width:1px;">
<td>
<input id="textbox_74736b14" style="width:100%" labelStyle="text-align:right;" name="encrypt_key" labelField="true" class="mini-textbox" emptyText="请输入数据加密key" vtype="maxLength:32" label="数据加密KEY："/>
</td>
</tr>
</table>
</div>
</fieldset>
<div style="text-align:center;padding:10px;" nodeIndex="2">
<@permission eventNo="e_add_merchant"><a id="button_5d8d1e0b" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">保存</a>
</@permission>
<a id="button_abe35f0b" class="mini-button" iconCls="icon-cancel">取消</a>
</div>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_add_merchant","tagId":"button_5d8d1e0b","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_abe35f0b","isClose":"true"}],"style":"margin-top:5px","formitem":[{"dataType":"select","format":"merchant_status","tagId":"radiolist_f91450ef"}]});
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