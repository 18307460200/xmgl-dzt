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
<table id="table_a58c256f" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_633f030b" style="border-width:1px;">
<td>
<input id="password_ccaa4faa" style="width:100%" labelStyle="text-align:right;" name="password" labelField="true" class="mini-password" vtype="strongPwd" label="输入新密码：" required="true"/>
</td>
</tr>
<tr id="group_83edc2c7" style="border-width:1px;">
<td>
<input id="password_9d9246d2" style="width:100%" labelStyle="text-align:right;" name="password2" labelField="true" class="mini-password" vtype="strongPwd" label="确认新密码：" required="true"/>
</td>
</tr>
</table>
<div style="text-align:center;padding:10px;" nodeIndex="1">
<@permission eventNo="e_edit_password"><a id="button_ce0fceb8" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">修改</a>
</@permission>
<a id="button_eb0a4cf2" class="mini-button" iconCls="icon-cancel">取消</a>
</div>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"eventNo":"e_edit_password","inputs":"user_id:''","paramFunc":"getParam","tagId":"button_ce0fceb8","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_eb0a4cf2","isClose":"true"}],"style":"margin-top:5px"});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

function getParam(){
var param = new Object();
var password = $.string.trim2(mini.getbyName("password").getValue());
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
password = $.crypto.sm2.encrypt(modulus,publicExponent,password);
password2 = $.crypto.sm2.encrypt(modulus,publicExponent,password2);
password = "encrypt_sm2:"+password;
password2 = "encrypt_sm2:"+password2;
}
}
},"", paraMap, null, null, false, getRsaPubKey);
}
param.password = password;
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