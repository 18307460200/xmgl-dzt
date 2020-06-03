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
<div style="height:100%;overflow:auto" nodeIndex="0">
<div id="form1" eventNo="e_get_one_project" inputs="id:'$id$'" style="margin-right:15px;" loadDataCallBackFunc="loadDataCallBackFunc">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<fieldset id="fieldset_7c03eade" style="border:solid 1px #aaa;padding:3px;">
<legend><span>运营管理信息</span></legend>
<div class="fieldset-body">
<table id="table_eee33f74" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_5b4e22de" style="border-width:1px;">
<td style="width:100px;">
<input id="textbox_06de0f25" style="width:100%" name="project_describe" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:40" emptyText="2020" label="年度（在建项目）：" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_fd8a41a8" style="width:100%" name="project_code" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" emptyText="项目编码" label="项目编码：" required="true"/>
</td>
<td style="width:100px;">
<input id="textarea_ce989ae1" style="width:100%" name="project_name" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textarea" vtype="text;maxLength:500" label="项目名称："/>
</td>
</tr>
<tr id="group_deb49816" style="border-width:1px;">
<td style="width:100px;">
<input id="textbox_1ae8b6e5" style="width:100%" name="client_name" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:20" label="客户："/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="部门：" id="combobox_44b07f0b" allowInput="true" style="width:100%" showNullItem="false" name="department" valueField="item_value" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_e46df1db" style="width:100%" name="manager" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:20" label="项目经理："/>
</td>
</tr>
<tr id="group_53360313" style="border-width:1px;">
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="是否特殊立项：" id="combobox_8910bdf2" allowInput="true" style="width:100%" showNullItem="false" name="is_special_project" valueField="item_value" required="true"/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="邮件写的合回笼订日期：" format="yyyy-MM-dd" id="datepicker_5edacb37" style="width:100%" name="email_date"/>
</td>
<td style="width:100px;">
<input id="textbox_bca8b873" style="width:100%" name="product_type" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:30" label="产品类别："/>
</td>
</tr>
<tr id="group_9a98b388" style="border-width:1px;">
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="合同文本是否已回：" id="combobox_0f011f70" allowInput="true" style="width:100%" showNullItem="false" name="contract" valueField="item_value" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_6e8202f0" style="width:100%" name="predict_money" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="numeric" emptyText="请输入合同预计金额" label="合同预计金额：" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_7b8c6dbd" style="width:100%" name="reality_money" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="Numeric" emptyText="请输入合同执行金额" label="合同执行金额："/>
</td>
</tr>
<tr id="group_94f49cd0" style="border-width:1px;">
<td style="width:100px;">
<input id="textbox_1a700d9c" style="width:100%" name="commerce" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:30" label="商务："/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="合同签订时间：" format="yyyy-MM-dd" id="datepicker_6c6ed49d" style="width:100%" name="contract_sign_date"/>
</td>
<td style="width:100px;">
<input id="textbox_09063644" style="width:100%" name="gathering_money_ok" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="number" emptyText="请输入收款金额" label="已收款金额：" required="true"/>
</td>
</tr>
<tr id="group_445e976f" style="border-width:1px;">
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="项目启动时间：" format="yyyy-MM-dd" id="datepicker_bb8e3bd1" style="width:100%" name="project_start_date" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_426de6a5" style="width:100%" name="payment_way" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:30" label="付款方式："/>
</td>
<td style="width:100px;">
<input id="textbox_a807d9cf" style="width:100%" name="gathering_money_not" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="Numeric" label="未收款金额：" required="true"/>
</td>
</tr>
<tr id="group_2c392e08" style="border-width:1px;">
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="上线日期：" format="yyyy-MM-dd" id="datepicker_51157595" style="width:100%" name="online_date"/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="验收日期：" format="yyyy-MM-dd" id="datepicker_1f31bcd1" style="width:100%" name="acceptance_date"/>
</td>
<td style="width:100px;">
<input id="textbox_7335ac59" style="width:100%" name="schedule_person" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:30" label="进度负责人："/>
</td>
</tr>
<tr id="group_ef4d3ad3" style="border-width:1px;">
<td style="width:80px;">
<input labelStyle="width:150px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划上线报告回笼日期：" format="yyyy-MM-dd" id="datepicker_f0214c8d" style="width:100%" name="plan_report_date"/>
</td>
<td style="width:80px;">
<input labelStyle="width:150px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划验收报告回笼日期：" format="yyyy-MM-dd" id="datepicker_75ead96c" style="width:100%" name="plan_acceptance_date"/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="项目状态：" id="combobox_ec78bc62" allowInput="true" style="width:100%" showNullItem="false" name="project_state" valueField="item_value" required="true"/>
</td>
</tr>
<tr id="group_ad427554" style="border-width:1px;">
<td style="width:100px;">
<input id="textarea_fa53cc8b" style="width:100%" name="reference_data" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textarea" vtype="text;maxLength:500" label="产品归属模块："/>
</td>
<td style="width:80px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="风险标签：" id="combobox_a95a4073" allowInput="true" style="width:100%" showNullItem="false" name="risk_label" valueField="item_value"/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="是否跟进：" id="combobox_b041f543" allowInput="true" style="width:100%" showNullItem="false" name="is_follow" valueField="item_value" required="true"/>
</td>
</tr>
<tr id="group_b906b141" style="border-width:1px;">
<td style="width:100px;" colspan="2">
<input showClose="true" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-buttonedit" label="产品归属：" id="product_affiliation_id" allowInput="false" style="width:100%" name="product_affiliation_id" selectOnFocus="true"/>
</td>
</tr>
</table>
</div>
</fieldset>
<br nodeIndex="1"></br>
<fieldset id="fieldset_1d49ea8b" style="border:solid 1px #aaa;padding:3px;">
<legend><span>产品部反馈信息</span></legend>
<div class="fieldset-body">
<table id="table_ceded0ca" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_c66b4032" style="border-width:1px;">
<td style="width:100px;">
<input id="textbox_6792e47b" style="width:100%" name="project_progress" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:20" label="项目进度："/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划上线日期：" format="yyyy-MM-dd" id="datepicker_8faa32f6" style="width:100%" name="plan_online_date"/>
</td>
<td style="width:80px;">
<input labelStyle="width:130px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划验收日期：" format="yyyy-MM-dd" id="datepicker_54b909b9" style="width:100%" name="plan_acceptance_report_date"/>
</td>
</tr>
<tr id="group_0e510d14" style="border-width:1px;">
<td style="width:80px;">
<input id="textbox_a0cc1f1f" style="width:100%" name="product_project_progress" labelStyle="width:165px;text-align:right;" labelField="true" class="mini-textbox" label="产品部反馈项目进度情况："/>
</td>
<td style="width:80px;">
<input labelStyle="width:150px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划上线报告回笼日期：" format="yyyy-MM-dd" id="datepicker_4781fbb5" style="width:100%" name="plan_report_date"/>
</td>
<td style="width:80px;">
<input labelStyle="width:150px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划验收报告回笼日期：" format="yyyy-MM-dd" id="datepicker_ac336480" style="width:100%" name="plan_acceptance_date"/>
</td>
</tr>
</table>
</div>
</fieldset>
<br nodeIndex="3"></br>
<fieldset id="fieldset_bc5b6a67" style="border:solid 1px #aaa;padding:3px;">
<legend><span>销售部反馈信息</span></legend>
<div class="fieldset-body">
<table id="table_bfda5ba5" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_ec62ab6a" style="border-width:1px;">
<td style="width:80px;">
<input id="textbox_2a8cad8c" style="width:100%" name="commerce_project_progress" labelStyle="width:150px;text-align:right;" labelField="true" class="mini-textbox" label="商务部反馈进度情况："/>
</td>
</tr>
</table>
</div>
</fieldset>
<table id="table_cdb7e286" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_c4f6b19f" style="border-width:1px;">
<td colspan="2" align="center" nodeIndex="0">
<@permission eventNo="e_edite_project"><a id="button_3739d6f9" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
</@permission>
<a id="button_46f5da50" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_get_one_project","toolbar":[{"eventNo":"e_edite_project","inputs":"","isAlert":"true","alertMsg":"是否提交？","tagId":"button_3739d6f9","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_46f5da50","isClose":"true"}],"style":"margin-right:15px;","inputs":"id:'$id$'","loadDataCallBackFunc":"loadDataCallBackFunc","formitem":[{"dataType":"select","format":"xmgl_department","tagId":"combobox_44b07f0b"},{"dataType":"select","format":"xmgl_is_special_project","tagId":"combobox_8910bdf2"},{"dataType":"select","format":"xmgl_contract","tagId":"combobox_0f011f70"},{"dataType":"select","format":"xmgl_project_state","tagId":"combobox_ec78bc62"},{"dataType":"select","format":"xmgl_risk_label","tagId":"combobox_a95a4073"},{"dataType":"select","format":"xmgl_is_follow","tagId":"combobox_b041f543"},{"title":"产品归属","dataType":"popWindow","height":"450","width":"350","callbackFunc":"addDept","format":"m_add_product_affiliation","displayName":"产品归属","tagId":"product_affiliation_id"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
</div>
<script type="text/javascript">
<!--

mini.parse();
function loadDataCallBackFunc(e){
debugger;
mini.get("product_affiliation_id").setText(e.product_affiliation_name);
mini.get("product_affiliation_id").setValue(e.product_affiliation_id);
if(e.login_id == "admin"){
}else{
mini.getbyName("project_describe").attr("readonly","true");
}
mini.parse();
}
function addDept(action,iframe)
{
var btnEdit = mini.get("product_affiliation_id");
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
btnEdit.setValue(pid);
btnEdit.setText(name);
}
}
}
//页面初始化后加载
$.tkReady=function(){
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>