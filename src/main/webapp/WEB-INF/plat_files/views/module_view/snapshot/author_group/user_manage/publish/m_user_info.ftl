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
<div id="form1" eventNo="e_query_userinfo" inputs="user_id:'$user_id$'" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<fieldset id="fieldset_2934a040" style="border:solid 1px #aaa;padding:3px;">
<legend><span>基本信息</span></legend>
<div class="fieldset-body">
<table id="table_28234235" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<input id="user_id" class="mini-hidden" nodeIndex="0"></input>
<input id="info_id" class="mini-hidden" nodeIndex="1"></input>
<tr id="group_20a533d6" style="border-width:1px;">
<td>
<input id="textbox_34e30e62" enabled="false" style="width:100%" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" label="用户姓名：" required="true"/>
</td>
<td>
<input id="textbox_fbfa13fe" enabled="false" style="width:100%" labelStyle="text-align:right;" name="employee_no" labelField="true" class="mini-textbox" label="员工编号："/>
</td>
</tr>
<tr id="group_45bec981" style="border-width:1px;">
<td>
<input id="radiolist_a0d59e69" enabled="false" style="width:100%" labelStyle="text-align:right;" name="sex" value="1" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="性别："/>
</td>
<td>
<input id="datepicker_02aacca5" enabled="false" style="width:100%" labelStyle="text-align:right;" name="birthday" labelField="true" class="mini-datepicker" timeFormat="H:mm:ss" showTime="true" vtype="yyyy-MM-dd" label="生日：" format="yyyy-MM-dd"/>
</td>
</tr>
<tr id="group_4718f8f5" style="border-width:1px;">
<td>
<input enabled="false" labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="商户信息：" id="combobox_705ed5f7" allowInput="true" style="width:100%" showNullItem="false" name="merchant_no" valueField="item_value" required="true"/>
</td>
<td>
<input enabled="false" labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="系统用户：" id="combobox_a59a8fff" allowInput="true" style="width:100%" showNullItem="false" name="is_system" valueField="item_value" required="true"/>
</td>
</tr>
<tr id="group_eb149be5" style="border-width:1px;">
<td>
<input id="combobox_a1355f96" enabled="false" allowInput="true" style="width:100%" showNullItem="true" labelStyle="text-align:right;" name="orgno" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="营业部信息："/>
</td>
<td>
<input id="textbox_23f1006f" enabled="false" style="width:100%" labelStyle="text-align:right;" name="mobile_phone" labelField="true" class="mini-textbox" vtype="mobile;maxLength:11;minLength:11" label="手机号码："/>
</td>
</tr>
<tr id="group_735c5275" style="border-width:1px;">
<td>
<input id="textbox_23dfa637" enabled="false" style="width:100%" labelStyle="text-align:right;" name="telephone" labelField="true" class="mini-textbox" label="联系电话："/>
</td>
<td>
<input id="textbox_22969851" enabled="false" style="width:100%" labelStyle="text-align:right;" name="email" labelField="true" class="mini-textbox" vtype="email" label="邮箱："/>
</td>
</tr>
<tr id="group_cddbff2b" style="border-width:1px;">
<td colspan="2">
<input showClose="true" enabled="false" labelStyle="text-align:right;" showButton="false" labelField="true" class="mini-buttonedit" label="所属角色：" id="role_id" style="width:100%" name="role_id" selectOnFocus="true"/>
</td>
</tr>
<tr id="group_718759a0" style="border-width:1px;">
<td colspan="2">
<input showClose="true" enabled="false" labelStyle="text-align:right;" showButton="false" labelField="true" class="mini-buttonedit" label="所属岗位：" id="post_id" style="width:100%" name="post_id" selectOnFocus="true"/>
</td>
</tr>
<tr id="group_d4ef70b9" style="border-width:1px;">
<td colspan="2">
<input id="textbox_bf2d81d4" enabled="false" style="width:100%" labelStyle="text-align:right;" name="dept_name" labelField="true" class="mini-textbox" label="所属部门："/>
</td>
</tr>
<tr id="group_79a61d56" style="border-width:1px;">
<td colspan="2">
<input id="textbox_578b982a" enabled="false" style="width:100%" labelStyle="text-align:right;" name="address" labelField="true" class="mini-textbox" label="住址："/>
</td>
</tr>
</table>
</div>
</fieldset>
<fieldset id="fieldset_51e11a27" style="border:solid 1px #aaa;padding:3px;">
<legend><span>账号信息</span></legend>
<div class="fieldset-body">
<table id="table_f981d299" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_791576c7" style="border-width:1px;">
<td>
<input id="textbox_51073ef1" enabled="false" style="width:100%" labelStyle="text-align:right;" name="login_id" labelField="true" class="mini-textbox" label="登录账号："/>
</td>
<td>
<input id="radiolist_66d78d35" enabled="false" style="width:100%" labelStyle="text-align:right;" name="state" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="状态："/>
</td>
</tr>
</table>
</div>
</fieldset>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_userinfo","style":"margin-top:5px","inputs":"user_id:'$user_id$'","formitem":[{"dataType":"select","format":"sex","tagId":"radiolist_a0d59e69"},{"dataType":"select","format":"merchant_no","tagId":"combobox_705ed5f7"},{"dataType":"select","format":"is_system_user","tagId":"combobox_a59a8fff"},{"dataType":"select","format":"branch_id","tagId":"combobox_a1355f96"},{"title":"添加角色","dataType":"popWindow","height":"580","width":"800","format":"m_add_role","displayName":"添加角色","tagId":"role_id"},{"title":"归属岗位","dataType":"popWindow","height":"450","width":"350","format":"m_add_dept","displayName":"归属岗位","tagId":"post_id"},{"dataType":"select","format":"user_state","tagId":"radiolist_66d78d35"}]});
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