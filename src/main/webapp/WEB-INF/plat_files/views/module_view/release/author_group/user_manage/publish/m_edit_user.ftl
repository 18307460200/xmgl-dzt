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
<div id="form1" eventNo="e_query_userinfo" inputs="user_id:'$user_id$'" style="margin-top:5px" loadDataCallBackFunc="loadDataCallBackFunc">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<fieldset id="fieldset_364dbd58" style="border:solid 1px #aaa;padding:3px;">
<legend><span>基本信息</span></legend>
<div class="fieldset-body">
<table id="table_14e7aaff" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<input id="user_id" class="mini-hidden" nodeIndex="0"></input>
<input id="info_id" class="mini-hidden" nodeIndex="1"></input>
<input id="type" name="type" class="mini-hidden" nodeIndex="2"></input>
<tr id="group_da8b32f4" style="border-width:1px;">
<td>
<input id="textbox_706c81f2" style="width:100%" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" emptyText="请输入姓名" label="用户姓名：" required="true"/>
</td>
<td>
<input id="textbox_a157544c" style="width:100%" labelStyle="text-align:right;" name="employee_no" labelField="true" class="mini-textbox" emptyText="请输入员工编号" label="员工编号："/>
</td>
</tr>
<tr id="group_5021f646" style="border-width:1px;">
<td>
<input id="radiolist_45fab11a" style="width:100%" labelStyle="text-align:right;" name="sex" value="1" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="性别："/>
</td>
<td>
<input labelStyle="text-align:right;" labelField="true" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" label="生日：" vtype="yyyy-MM-dd" emptyText="请选择日期" format="yyyy-MM-dd" alwaysView="true" id="datepicker_2504a1ef" style="width:100%" name="birthday"/>
</td>
</tr>
<tr id="group_899981a1" style="border-width:1px;">
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="商户信息：" emptyText="请选择商户信息" id="merchant_no" allowInput="true" style="width:100%" showNullItem="false" name="merchant_no" valueField="item_value" required="true"/>
</td>
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="系统用户：" emptyText="请选择系统用户" id="combobox_0910f088" allowInput="true" style="width:100%" showNullItem="false" name="is_system" valueField="item_value" required="true"/>
</td>
</tr>
<tr id="group_3b482001" style="border-width:1px;">
<td>
<input id="combobox_26bb4f67" allowInput="true" style="width:100%" showNullItem="true" labelStyle="text-align:right;" name="orgno" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" emptyText="请选择营业部信息" label="营业部信息："/>
</td>
<td>
<input id="textbox_822de037" style="width:100%" labelStyle="text-align:right;" name="mobile_phone" labelField="true" class="mini-textbox" vtype="mobile;maxLength:11;minLength:11" label="手机号码："/>
</td>
</tr>
<tr id="group_ca1da1a2" style="border-width:1px;">
<td>
<input id="textbox_b4a8b22b" style="width:100%" labelStyle="text-align:right;" name="telephone" labelField="true" class="mini-textbox" label="联系电话："/>
</td>
<td>
<input id="textbox_24af4ad7" style="width:100%" labelStyle="text-align:right;" name="email" labelField="true" class="mini-textbox" vtype="email" label="邮箱："/>
</td>
</tr>
<tr id="group_86933b93" style="border-width:1px;">
<td colspan="2">
<input id="role_id" showClose="true" allowInput="false" style="width:100%" labelStyle="text-align:right;" name="role_id" labelField="true" class="mini-buttonedit" label="所属角色：" selectOnFocus="true"/>
</td>
</tr>
<tr id="group_9d69f93a" style="border-width:1px;">
<td colspan="2">
<input showClose="true" labelStyle="text-align:right;" labelField="true" class="mini-buttonedit" label="所属岗位：" id="post_id" allowInput="false" style="width:100%" name="post_id" required="true" selectOnFocus="true"/>
</td>
</tr>
<tr id="group_08af023b" style="border-width:1px;">
<td colspan="2">
<input id="textbox_982a3236" style="width:100%" labelStyle="text-align:right;" name="address" labelField="true" class="mini-textbox" label="住址："/>
</td>
</tr>
</table>
</div>
</fieldset>
<fieldset id="fieldset_654e3a98" style="border:solid 1px #aaa;padding:3px;">
<legend><span>账号信息</span></legend>
<div class="fieldset-body">
<table id="table_d6ffcb97" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_473263d9" style="border-width:1px;">
<td>
<input id="textbox_d75f6cb5" allowInput="false" style="width:100%" labelStyle="text-align:right;" name="login_id" labelField="true" class="mini-textbox" emptyText="请输入帐号" label="登录账号："/>
</td>
<td>
<input id="radiolist_968a4dd2" style="width:100%" labelStyle="text-align:right;" name="state" value="1" repeatItems="3" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="状态：" repeatLayout="table"/>
</td>
</tr>
</table>
</div>
</fieldset>
<div style="text-align:center;padding:10px;" nodeIndex="2">
<@permission eventNo="e_edit_user"><a id="button_256f606a" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">修改</a>
</@permission>
<a id="button_f0074fb8" class="mini-button" iconCls="icon-cancel">取消</a>
</div>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_userinfo","toolbar":[{"eventNo":"e_edit_user","tagId":"button_256f606a","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_f0074fb8","isClose":"true"}],"style":"margin-top:5px","inputs":"user_id:'$user_id$'","loadDataCallBackFunc":"loadDataCallBackFunc","formitem":[{"dataType":"select","format":"sex","tagId":"radiolist_45fab11a"},{"dataType":"select","format":"merchant_no","tagId":"merchant_no"},{"dataType":"select","format":"is_system_user","tagId":"combobox_0910f088"},{"dataType":"select","format":"branch_id","tagId":"combobox_26bb4f67"},{"title":"添加角色","dataType":"popWindow","height":"580","inputs":"role_id:'$role_id$'","width":"800","callbackFunc":"addRole","format":"m_add_role","displayName":"添加角色","tagId":"role_id"},{"title":"归属岗位","dataType":"popWindow","height":"450","width":"350","callbackFunc":"addDept","format":"m_add_dept","displayName":"归属岗位","tagId":"post_id"},{"dataType":"select","format":"user_state","tagId":"radiolist_968a4dd2"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

mini.parse();
function loadDataCallBackFunc(e){
if($.string.isEmpty(e.login_id)){
mini.getbyName("type").setValue("add");
}else{
mini.getbyName("type").setValue("edit");
}
var is_system = e.is_system;
if(is_system ==1){
}else{
var merchant_no = mini.get("merchant_no");
merchant_no.setText(e.merchant_no);
merchant_no.setValue(e.merchant_no);
merchant_no.disable();
}
mini.parse();
}
function addRole(action,iframe)
{
var btnEdit = mini.get("role_id")
if (action == "ok")
{
var data = iframe.contentWindow.getData();
data = mini.clone(data); //必须
if (data)
{
var ids = [];
var names = [];
for (var i = 0, l = data.length; i < l; i++)
{
var r = data[i];
ids.push(r.role_id);
names.push(r.name);
}
var id = ids.join(',');
var name = names.join(',');
btnEdit.setValue(id);
btnEdit.setText(name);
}
}
}
function addDept(action,iframe)
{
var btnEdit = mini.get("post_id");
if (action == "ok")
{
var data = iframe.contentWindow.getData();
data = mini.clone(data); //必须
if (data)
{
var id ="";
var pid ="";
var name ="";
for(var i=0;i < data.length;i++){
id += data[i].id+",";
pid += data[i].pid+",";
name += data[i].name+",";
}
id = id.substring(0,id.length-1);
pid = pid.substring(0,pid.length-1);
name = name.substring(0,name.length-1);
btnEdit.setValue(id+':'+pid);
btnEdit.setText(name);
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