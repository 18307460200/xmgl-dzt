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
<div class="home_bg" nodeIndex="0"></div>
<div class="home_login" nodeIndex="1">
<div class="logo_box" nodeIndex="0"></div>
<div class="login_form" id="indexs" nodeIndex="1">
<div class="input_error" style="display:none" nodeIndex="0"></div>
<div class="input_box" nodeIndex="1">
<label nodeIndex="0">账号</label><input type="text" name="loginId" id="loginId" autocomplete="off" class="text" nodeIndex="1"></input>
</div>
<div class="input_box" nodeIndex="2">
<label nodeIndex="0">密码</label><input type="password" name="password" id="password" autocomplete="off" class="text" nodeIndex="1"></input>
</div>
<div class="input_box input_code" nodeIndex="3">
<label nodeIndex="0">验证码</label><input type="text" name="ticket" id="ticket" autocomplete="off" class="text" nodeIndex="1"></input>
<div class="code_pic" nodeIndex="2"><a href="javascript:void(0);" onclick="changeRandomImg();" nodeIndex="0"><img id="randomImg" src="${ctxPath}/servlet/Validateimg?random=0.11936780724251816" border="0" style="cursor: pointer;height:30px;" title="看不清楚换一张" nodeIndex="0"></img></a></div>
</div>
<div class="login_btn" nodeIndex="4">
<a href="javascript:void(0);" onclick="onLogin();" nodeIndex="0">登录</a>
</div>
</div>
</div>
<script type="text/javascript">
<!--

var page_id="#indexs";
$.tkReady=function(){
$(page_id + " #loginId").focus();
}
if(window!=window.top){
window.top.location.href="${ctxPath}/servlet/Login";
}
$(page_id + " #loginId").bind('keypress',function(event){
if(event.keyCode == 13)
{
$(page_id + " #password").focus();
}
});
$(page_id + " #password").bind('keypress',function(event){
if(event.keyCode == 13)
{
$(page_id + " #ticket").focus();
}
});
$(page_id + " #ticket").bind('keypress',function(event){
if(event.keyCode == 13)
{
onLogin();
}
});
//登录回调
function loginCallback(resultVo)
{
if(resultVo.obj.error_no == 0){
var result = resultVo.getResults();
var userInfo = $.jsonToStr(result);
$.setSessionStorage("userInfo", userInfo);
if(result["userLoginStatusType"]=="1")//首次登录
{
FrameService.getInstance().popWindow("[首次登录]请修改密码","m_edit_updatepassword",null,"400","300","",null,null,"${ctxPath}/servlet/FristUpdatePassword");
}
else if(result["userLoginStatusType"]=="2")//密码过期
{
FrameService.getInstance().popWindow("[密码过期]请修改密码","m_edit_updatepassword",null,"400","300","",null,null,"${ctxPath}/servlet/FristUpdatePassword");
}
else if(result["userLoginStatusType"]=="3")//密码即将过期
{
window.top.mini.confirm("密码还有"+result["userPwdExpiredDay"]+"天过期,过期会影响使用，请尽快修改密码!", "确定？",
function (action) {
if (action == "ok") {
FrameService.getInstance().popWindow("[密码即将过期]请修改密码","m_edit_updatepassword",null,"400","300","",null,null,"${ctxPath}/servlet/FristUpdatePassword");
} else {
window.top.mini.loading("请稍候...", "登录成功");
window.location.href = "${ctxPath}/servlet/Main";
}
}
);
}else{
mini.loading("请稍候...", "登录成功");
window.location.href = "${ctxPath}/servlet/Main";
}
}
else
{
changeRandomImg();
$(page_id + " #ticket").val("");
$(".input_error").show();
$(".input_error").empty().html("<p>"+resultVo.obj.error_info+"</p>");
//mini.alert(resultVo.obj.error_no + ":" + resultVo.obj.error_info, "提醒");
$(page_id + " #ticket").focus();
}
}
function changeRandomImg(){
$("#randomImg").attr("src","${ctxPath}/servlet/Validateimg?random="+Math.random());
}
function onLogin(){
var loginId = $.string.trim2($(page_id + " #loginId").val());
var password = $(page_id + " #password").val();
var ticket = $.string.trim2($(page_id + " #ticket").val());
if ($.string.isEmpty(loginId)) {
$(page_id + " #loginId").blur();
$(page_id + " #loginId").focus();
$(".input_error").show();
$(".input_error").empty().html("<p>用户名不能为空</p>");
return;
} else if ($.string.isEmpty(password)) {
$(page_id + " #password").blur();
$(page_id + " #password").focus();
$(".input_error").show();
$(".input_error").empty().html("<p>密码不能为空</p>");
return;
} else if ($.string.isEmpty(ticket)) {
$(page_id + " #ticket").blur();
$(page_id + " #ticket").focus();
$(".input_error").show();
$(".input_error").empty().html("<p>验证码不能为空</p>");
return;
} else {
var param = mini.getParams();
param.loginId = loginId;
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
password = $.crypto.sm2.encrypt(modulus,publicExponent,password);
password = "encrypt_sm2:"+password;
}
}else{
mini.alert(resultVo.getErrorInfo(), "提醒");
return;
}
},"", paraMap, null, null, false, getRsaPubKey);
}
param.password = password;
param.ticket = ticket;
if($.string.isEmpty(loginId)){
//mini.alert("用户名不能为空", "提醒");
$(".input_error").show();
$(".input_error").empty().html("<p>用户名不能为空</p>");
return;
}
if($.string.isEmpty(password)){
//mini.alert("密码不能为空", "提醒");
$(".input_error").show();
$(".input_error").empty().html("<p>密码不能为空</p>");
return;
}
if($.string.isEmpty(ticket)){
//mini.alert("验证码不能为空", "提醒");
$(".input_error").show();
$(".input_error").empty().html("<p>验证码不能为空</p>");
return;
}
FrameService.getInstance().processSubmit(loginCallback, "", param,null, null,false,"${ctxPath}/servlet/LoginFunction");
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>