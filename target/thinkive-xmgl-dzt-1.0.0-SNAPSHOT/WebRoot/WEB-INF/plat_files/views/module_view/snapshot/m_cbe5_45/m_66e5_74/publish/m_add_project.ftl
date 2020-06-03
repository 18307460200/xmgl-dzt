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
<div id="form1" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<input id="hidden_4f01107a" name="is_use" class="mini-hidden"/>
<fieldset id="fieldset_b9cbe39b" style="border:solid 1px #aaa;padding:3px;">
<legend><span>运营管理信息</span></legend>
<div class="fieldset-body">
<table id="table_c2018fd3" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_7b362c4d" style="border-width:1px;">
<td style="width:100px;">
<input id="textbox_e36c8bce" style="width:100%" name="project_describe" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:40" emptyText="2020" label="年度（在建项目）：" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_dd1f5efc" style="width:100%" name="project_code" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" emptyText="项目编码" label="项目编码：" required="true"/>
</td>
<td style="width:100px;">
<input id="textarea_1a50ba04" style="width:100%" name="project_name" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textarea" vtype="text;maxLength:500" label="项目名称："/>
</td>
</tr>
<tr id="group_139122e1" style="border-width:1px;">
<td style="width:100px;">
<input id="textbox_8668ae4c" style="width:100%" name="client_name" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:20" label="客户："/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="部门：" id="combobox_b4daa20d" allowInput="true" style="width:100%" showNullItem="false" name="department" valueField="item_value" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_0f6e2580" style="width:100%" name="manager" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:20" label="项目经理："/>
</td>
</tr>
<tr id="group_9c674429" style="border-width:1px;">
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="是否特殊立项：" id="combobox_b064367a" allowInput="true" style="width:100%" showNullItem="false" name="is_special_project" valueField="item_value" required="true"/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="邮件写的合回笼订日期：" format="yyyy-MM-dd" id="datepicker_bebc4c63" style="width:100%" name="email_date"/>
</td>
<td style="width:100px;">
<input id="textbox_43173d95" style="width:100%" name="product_type" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:30" label="产品类别："/>
</td>
</tr>
<tr id="group_f3564962" style="border-width:1px;">
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="合同文本是否已回：" id="combobox_37eb70bb" allowInput="true" style="width:100%" showNullItem="false" name="contract" valueField="item_value" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_c38ccc1d" style="width:100%" name="predict_money" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="numeric" emptyText="请输入合同预计金额" label="合同预计金额：" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_cc9bb021" style="width:100%" name="reality_money" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="Numeric" emptyText="请输入合同执行金额" label="合同执行金额："/>
</td>
</tr>
<tr id="group_a9efcd85" style="border-width:1px;">
<td style="width:100px;">
<input id="textbox_6fb35f23" style="width:100%" name="commerce" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:30" label="商务："/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="合同签订时间：" format="yyyy-MM-dd" id="datepicker_4eb28280" style="width:100%" name="contract_sign_date"/>
</td>
<td style="width:100px;">
<input id="textbox_3f163996" style="width:100%" name="gathering_money_ok" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="number" emptyText="请输入收款金额" label="已收款金额：" required="true"/>
</td>
</tr>
<tr id="group_094692ff" style="border-width:1px;">
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="项目启动时间：" format="yyyy-MM-dd" id="datepicker_121c8800" style="width:100%" name="project_start_date" required="true"/>
</td>
<td style="width:100px;">
<input id="textbox_e3fd8b2b" style="width:100%" name="payment_way" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:30" label="付款方式："/>
</td>
<td style="width:100px;">
<input id="textbox_de3efa91" style="width:100%" name="gathering_money_not" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="Numeric" label="未收款金额：" required="true"/>
</td>
</tr>
<tr id="group_20056b69" style="border-width:1px;">
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="上线日期：" format="yyyy-MM-dd" id="datepicker_14ddd268" style="width:100%" name="online_date"/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="验收日期：" format="yyyy-MM-dd" id="datepicker_244f4225" style="width:100%" name="acceptance_date"/>
</td>
<td style="width:100px;">
<input id="textbox_4bec6a90" style="width:100%" name="schedule_person" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:30" label="进度负责人："/>
</td>
</tr>
<tr id="group_a06f3df7" style="border-width:1px;">
<td style="width:80px;">
<input labelStyle="width:150px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划上线报告回笼日期：" format="yyyy-MM-dd" id="datepicker_d290ed36" style="width:100%" name="plan_report_date"/>
</td>
<td style="width:80px;">
<input labelStyle="width:150px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划验收报告回笼日期：" format="yyyy-MM-dd" id="datepicker_9e6b4651" style="width:100%" name="plan_acceptance_date"/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="项目状态：" id="combobox_4a2cf1a4" allowInput="true" style="width:100%" showNullItem="false" name="project_state" valueField="item_value" required="true"/>
</td>
</tr>
<tr id="group_cd5146bf" style="border-width:1px;">
<td style="width:100px;">
<input id="textarea_a4f9d659" style="width:100%" name="reference_data" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textarea" vtype="text;maxLength:500" label="产品归属模块："/>
</td>
<td style="width:80px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="风险标签：" id="combobox_f0c907c1" allowInput="true" style="width:100%" showNullItem="false" name="risk_label" valueField="item_value"/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="是否跟进：" id="combobox_2e7a52b4" allowInput="true" style="width:100%" showNullItem="false" name="is_follow" valueField="item_value" required="true"/>
</td>
</tr>
<tr id="group_2c299794" style="border-width:1px;">
<td style="width:100px;" colspan="2">
<input showClose="true" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-buttonedit" label="产品归属：" id="product_affiliation_id" allowInput="false" style="width:100%" name="product_affiliation_id" selectOnFocus="true"/>
</td>
</tr>
</table>
</div>
</fieldset>
<br nodeIndex="2"></br>
<fieldset id="fieldset_dd3699c3" style="border:solid 1px #aaa;padding:3px;">
<legend><span>产品部反馈信息</span></legend>
<div class="fieldset-body">
<table id="table_bf3ab441" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_695c0aca" style="border-width:1px;">
<td style="width:100px;">
<input id="textbox_2f0b338e" style="width:100%" name="project_progress" labelStyle="width:120px;text-align:right;" labelField="true" class="mini-textbox" vtype="text;maxLength:20" label="项目进度："/>
</td>
<td style="width:100px;">
<input labelStyle="width:120px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划上线日期：" format="yyyy-MM-dd" id="datepicker_ef346d9e" style="width:100%" name="plan_online_date"/>
</td>
<td style="width:80px;">
<input labelStyle="width:130px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划验收日期：" format="yyyy-MM-dd" id="datepicker_cc1024a8" style="width:100%" name="plan_acceptance_report_date"/>
</td>
</tr>
<tr id="group_564c77c9" style="border-width:1px;">
<td style="width:80px;">
<input id="textbox_d59c112f" style="width:100%" name="product_project_progress" labelStyle="width:165px;text-align:right;" labelField="true" class="mini-textbox" label="产品部反馈项目进度情况："/>
</td>
<td style="width:80px;">
<input labelStyle="width:150px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划上线报告回笼日期：" format="yyyy-MM-dd" id="datepicker_7e4cc7fc" style="width:100%" name="plan_report_date"/>
</td>
<td style="width:80px;">
<input labelStyle="width:150px;text-align:right;" showTime="true" timeFormat="H:mm:ss" class="mini-datepicker" labelField="true" label="计划验收报告回笼日期：" format="yyyy-MM-dd" id="datepicker_6f3973cb" style="width:100%" name="plan_acceptance_date"/>
</td>
</tr>
</table>
</div>
</fieldset>
<br nodeIndex="4"></br>
<fieldset id="fieldset_bdc93ee0" style="border:solid 1px #aaa;padding:3px;">
<legend><span>销售部反馈信息</span></legend>
<div class="fieldset-body">
<table id="table_950d9fe1" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_b90fd889" style="border-width:1px;">
<td style="width:80px;">
<input id="textbox_f0de06d6" style="width:100%" name="commerce_project_progress" labelStyle="width:150px;text-align:right;" labelField="true" class="mini-textbox" label="商务部反馈进度情况："/>
</td>
</tr>
</table>
</div>
</fieldset>
<table id="table_b290ee1a" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_342a119b" style="border-width:1px;">
<td colspan="2" align="center" nodeIndex="0">
<@permission eventNo="e_add_project"><a id="button_2c74be14" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
</@permission>
<a id="button_3e374f8c" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","toolbar":[{"filterFunc":"paramVerify","eventNo":"e_add_project","inputs":"","isAlert":"true","alertMsg":"是否提交？","tagId":"button_2c74be14","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_3e374f8c","isClose":"true"}],"style":"margin-top:5px","formitem":[{"dataType":"url","inputs":"is_use:'0'","format":"is_use","tagId":"hidden_4f01107a"},{"dataType":"select","format":"xmgl_department","tagId":"combobox_b4daa20d"},{"dataType":"select","format":"xmgl_is_special_project","tagId":"combobox_b064367a"},{"dataType":"select","format":"xmgl_contract","tagId":"combobox_37eb70bb"},{"dataType":"select","format":"xmgl_project_state","tagId":"combobox_4a2cf1a4"},{"dataType":"select","format":"xmgl_risk_label","tagId":"combobox_f0c907c1"},{"dataType":"select","format":"xmgl_is_follow","tagId":"combobox_2e7a52b4"},{"title":"产品归属","dataType":"popWindow","height":"450","width":"350","callbackFunc":"addDept","format":"m_add_product_affiliation","displayName":"产品归属","tagId":"product_affiliation_id"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
</div>
<script type="text/javascript">
<!--

//保存时校验参数
function paramVerify(){
var project_code = mini.getbyName("project_code").getFormValue();
var project_code = mini.getbyName("project_code").getFormValue();
var predict_money = mini.getbyName("predict_money").getFormValue();
var reality_money = mini.getbyName("reality_money").getFormValue();
if(!$.string.isNumberFloat(predict_money)){
mini.alert("合同预计金额,请输入数字");
return false;
}
if(!$.string.isNumberFloat(reality_money)){
mini.alert("合同金额,请输入数字");
return false;
}
return true;
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