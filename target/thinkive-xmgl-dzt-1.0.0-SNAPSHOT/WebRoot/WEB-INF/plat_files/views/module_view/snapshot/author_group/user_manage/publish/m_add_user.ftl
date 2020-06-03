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
<div id="form1" eventNo="e_query_userinfo" style="margin-top:5px;margin-right:10px;" loadDataCallBackFunc="loadDataCallBackFunc">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<fieldset id="fieldset_f99d6aa6" style="border:solid 1px #aaa;padding:3px;">
<legend><span>基本信息</span></legend>
<div class="fieldset-body">
<table id="table_b6cf4b1f" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_be227128" style="border-width:1px;">
<td>
<input id="textbox_ba22c794" style="width:100%" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" emptyText="请输入姓名" label="用户姓名：" required="true"/>
</td>
<td>
<input id="textbox_3fd01cba" style="width:100%" labelStyle="text-align:right;" name="employee_no" labelField="true" class="mini-textbox" emptyText="请输入员工编号" label="员工编号："/>
</td>
</tr>
<tr id="group_bff0f150" style="border-width:1px;">
<td>
<input id="radiolist_e6fa47bb" style="width:100%" labelStyle="text-align:right;" name="sex" value="1" valueField="item_value" labelField="true" class="mini-radiobuttonlist" textField="item_name" label="性别："/>
</td>
<td>
<input labelStyle="text-align:right;" labelField="true" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" label="生日：" vtype="yyyy-MM-dd" emptyText="请选择日期" format="yyyy-MM-dd" alwaysView="true" id="datepicker_053b850e" style="width:100%" name="birthday"/>
</td>
</tr>
<tr id="group_9ee51503" style="border-width:1px;">
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="商户信息：" emptyText="请选择商户信息" id="merchant_no" allowInput="true" style="width:100%" showNullItem="false" name="merchant_no" valueField="item_value" value="thinkive" required="true"/>
</td>
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="系统用户：" emptyText="请选择系统用户" id="combobox_95ae1686" allowInput="true" style="width:100%" showNullItem="false" name="is_system" valueField="item_value" value="0" required="true"/>
</td>
</tr>
<tr id="group_5200a8dd" style="border-width:1px;">
<td>
<input id="combobox_2983d1dc" allowInput="true" style="width:100%" showNullItem="true" labelStyle="text-align:right;" name="orgno" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" emptyText="请选择营业部信息" label="营业部信息："/>
</td>
<td>
<input id="textbox_339a3f1d" style="width:100%" labelStyle="text-align:right;" name="mobile_phone" labelField="true" class="mini-textbox" vtype="mobile;maxLength:11;minLength:11" label="手机号码："/>
</td>
</tr>
<tr id="group_9b5b3842" style="border-width:1px;">
<td>
<input id="textbox_504ece11" style="width:100%" labelStyle="text-align:right;" name="telephone" labelField="true" class="mini-textbox" label="联系电话："/>
</td>
<td>
<input id="textbox_ca3b3287" style="width:100%" labelStyle="text-align:right;" name="email" labelField="true" class="mini-textbox" vtype="email" label="邮箱："/>
</td>
</tr>
<tr id="group_e185b015" style="border-width:1px;">
<td colspan="2">
<input id="role_id" showClose="true" allowInput="false" style="width:100%" labelStyle="text-align:right;" name="role_id" labelField="true" class="mini-buttonedit" label="所属角色：" selectOnFocus="true"/>
</td>
</tr>
<tr id="group_61816be2" style="border-width:1px;">
<td colspan="2">
<input id="post_id" showClose="true" allowInput="false" style="width:100%" labelStyle="text-align:right;" name="post_id" labelField="true" class="mini-buttonedit" label="所属岗位：" selectOnFocus="true"/>
</td>
</tr>
<tr id="group_09fa37cb" style="border-width:1px;">
<td colspan="2">
<input id="textbox_33896e9b" style="width:100%" labelStyle="text-align:right;" name="address" labelField="true" class="mini-textbox" label="住址："/>
</td>
</tr>
</table>
</div>
</fieldset>
<fieldset id="fieldset_05744445" style="border:solid 1px #aaa;padding:3px;">
<legend><span>账号信息</span></legend>
<div class="fieldset-body">
<table id="table_284a9c38" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_5c70b345" style="border-width:1px;">
<td>
<input id="textbox_e3294a63" style="width:100%" labelStyle="text-align:right;" name="login_id" labelField="true" class="mini-textbox" emptyText="请输入帐号" label="登录账号：" required="true"/>
</td>
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-radiobuttonlist" label="状态：" id="radiolist_da8b5406" style="width:100%" name="state" valueField="item_value" repeatItems="3" value="1" required="true" repeatLayout="table"/>
</td>
</tr>
<tr id="group_4cc1bc7a" style="border-width:1px;">
<td>
<input id="password_087ecfa8" style="width:100%" labelStyle="text-align:right;" name="password1" labelField="true" class="mini-password" vtype="strongPwd" label="输入密码：" required="true"/>
</td>
<td>
<input id="password_f78a1c8f" style="width:100%" labelStyle="text-align:right;" name="password2" labelField="true" class="mini-password" vtype="strongPwd" label="确认密码：" required="true"/>
</td>
</tr>
</table>
</div>
</fieldset>
<div style="text-align:center;padding:10px;" nodeIndex="2">
<@permission eventNo="e_add_user"><a id="button_69894c76" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">添加</a>
</@permission>
<a id="button_309a3cce" class="mini-button" iconCls="icon-cancel">取消</a>
</div>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_userinfo","toolbar":[{"eventNo":"e_add_user","paramFunc":"getParam","tagId":"button_69894c76","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_309a3cce","isClose":"true"}],"style":"margin-top:5px;margin-right:10px;","loadDataCallBackFunc":"loadDataCallBackFunc","formitem":[{"dataType":"select","format":"sex","tagId":"radiolist_e6fa47bb"},{"dataType":"select","format":"merchant_no","tagId":"merchant_no"},{"dataType":"select","format":"is_system_user","tagId":"combobox_95ae1686"},{"dataType":"select","format":"branch_id","tagId":"combobox_2983d1dc"},{"title":"添加角色","dataType":"popWindow","height":"580","width":"800","callbackFunc":"addRole","format":"m_add_role","displayName":"添加角色","tagId":"role_id"},{"title":"归属岗位","dataType":"popWindow","height":"450","width":"350","callbackFunc":"addDept","format":"m_add_dept","displayName":"归属岗位","tagId":"post_id"},{"dataType":"select","format":"user_state","tagId":"radiolist_da8b5406"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

function loadDataCallBackFunc(e){
var form = new mini.Form("#form1");
form.clear();
mini.getbyName("state").setValue("1");
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
function getParam(){
var param = new Object();
var password1 = $.string.trim2(mini.getbyName("password1").getValue());
var password2 = $.string.trim2(mini.getbyName("password2").getValue());
var isEncrypt = $.gconfig.global.pwd_is_encrypt;
if($.string.isNotEmpty(isEncrypt) && '1' === isEncrypt)
{
var getRsaPubKey = $.gconfig.global.getRsaPubKey || "";
var paraMap = new Object();
paraMap["getRsaPubKey"] = "getRsaPubKey";
FrameService.getInstance().processSubmit(function(resultVo){
if(resultVo && resultVo!=null){
if(resultVo.getErrorNo() == 0){
var result = resultVo.getResults();
modulus = result["modulus"];
publicExponent = result["publicExponent"];
password1 = $.crypto.sm2.encrypt(modulus,publicExponent,password1);
password2 = $.crypto.sm2.encrypt(modulus,publicExponent,password2);
password1 = "encrypt_sm2:"+password1;
password2 = "encrypt_sm2:"+password2;
}
}
},"", paraMap, null, null, false, getRsaPubKey);
}
param.password1 = password1;
param.password2 = password2;
return param;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>