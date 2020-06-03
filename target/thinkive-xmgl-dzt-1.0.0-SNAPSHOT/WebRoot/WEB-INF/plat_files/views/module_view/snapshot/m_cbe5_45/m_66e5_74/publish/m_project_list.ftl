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
<div id="datarid_panel_1af938b4" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_67e04048" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<div id="form_9e72a0fd" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<td id="group_e5b77c5f" style="border-width:1px;" tagname="toolbar">
<td>
<input id="project_name" labelWidth="100" style="width:155;display:inline-block" labelStyle="text-align:right;" name="project_name" labelField="true" class="mini-textbox" label="项目名称："/>
</td>
</td>
<td id="group_e7047c41" style="border-width:1px;" tagname="toolbar">
<td>
<input labelWidth="120" labelStyle="text-align:right;" textField="item_name" class="mini-combobox" labelField="true" label="管理归属产品部：" emptyText="——全部——" nullItemText="——全部——" id="department" allowInput="true" style="width:155;display:inline-block;" showNullItem="true" name="department" valueField="item_value"/>
</td>
</td>
<td id="group_7bd4a464" style="border-width:1px;" tagname="toolbar">
<td>
<input id="manager" labelWidth="100" style="width:155;display:inline-block" labelStyle="text-align:right;" name="manager" labelField="true" class="mini-textbox" label="项目经理："/>
</td>
</td>
<td id="group_0e449ce8" style="border-width:1px;" tagname="toolbar">
<td>
<input id="commerce" labelWidth="100" style="width:155;display:inline-block" labelStyle="text-align:right;" name="commerce" labelField="true" class="mini-textbox" label="商务："/>
</td>
</td>
<td id="group_eaad4492" style="border-width:1px;" tagname="toolbar">
<td>
<input id="client_name" labelWidth="100" style="width:155;display:inline-block" labelStyle="text-align:right;" name="client_name" labelField="true" class="mini-textbox" label="客户："/>
</td>
</td>
<div nodeIndex="5"></div>
<td id="group_22ca7eed" style="border-width:1px;" tagname="toolbar">
<td>
<input id="schedule_person" labelWidth="100" style="width:155;display:inline-block" labelStyle="text-align:right;" name="schedule_person" labelField="true" class="mini-textbox" label="进度负责人："/>
</td>
</td>
<td id="group_764f62a6" style="border-width:1px;" tagname="toolbar">
<td>
<input labelWidth="120" labelStyle="text-align:right;" textField="item_name" class="mini-combobox" labelField="true" label="是否跟进：" emptyText="——全部——" nullItemText="——全部——" id="is_follow" allowInput="true" style="width:155;display:inline-block;" showNullItem="true" name="is_follow" valueField="item_value"/>
</td>
</td>
<td id="group_1bd14fa9" style="border-width:1px;" tagname="toolbar">
<td>
<input id="project_rike_label" labelWidth="100" style="width:155;display:inline-block" labelStyle="text-align:right;" name="project_rike_label" labelField="true" class="mini-textbox" label="项目风险："/>
</td>
</td>
<td id="group_2a153803" style="border-width:1px;" tagname="toolbar">
<td>
<input labelWidth="120" labelStyle="text-align:right;" textField="item_name" class="mini-combobox" labelField="true" label="产品归属：" emptyText="——全部——" nullItemText="——全部——" id="product_affiliation_name" allowInput="true" style="width:155;display:inline-block;" showNullItem="true" name="product_affiliation_name" valueField="item_value"/>
</td>
</td>
<td id="group_631f8f40" style="border-width:1px;" tagname="toolbar">
<td>
<input id="project_code" labelWidth="100" style="width:155;display:inline-block" labelStyle="text-align:right;" name="project_code" labelField="true" class="mini-textbox" label="项目编号："/>
</td>
</td>
<td id="group_571cd403" style="border-width:1px;" tagname="toolbar">
<a id="button_ff2bae27" class="mini-button" iconCls="icon-redo">查询</a>
</td>
<div nodeIndex="12"></div>
<td id="group_2a27d1e7" style="width:100%;" tagname="toolbar">
<a id="xmgl_add_project" name="xmgl_add_project" class="mini-button" plain="true" iconCls="icon-add">新增</a>
<a id="button_3f3a27d3" class="mini-button" plain="true" iconCls="icon-edit">修改</a>
<@permission eventNo="e_delete_project"><a id="xmgl_delete_project" class="mini-button" plain="true" iconCls="icon-remove">删除</a>
</@permission>
<a id="xmgl_upload_excel" class="mini-button" plain="true" iconCls="icon-upload">Excel导入</a>
<a id="button_8f60b1e2" class="mini-button" iconCls="icon-download">导出</a>
<a id="button_029b5990" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form_9e72a0fd"];
if(!form){
require.async("form",function(Form){
form = new Form("form_9e72a0fd",{"id":"form_9e72a0fd","style":"margin-top:5px","formitem":[{"dataType":"select","format":"xmgl_department","tagId":"department"},{"dataType":"select","format":"xmgl_is_follow","tagId":"is_follow"},{"dataType":"select","format":"xmgl_department","tagId":"product_affiliation_name"}]});
$.tkui["form_9e72a0fd"] = form;
form.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" isPage="true" allowResize="false" pageSize="20" class="mini-datagrid" eventNo="e_query_project" allowSortColumn="true" isMulPageSelect="true" showEmptyText="true" loadDataCallBackFunc="loadDataCallBackFunc" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_bb618fdf" property="columns">
<div field="field_8b222463" id="field_8b222463" allowSort="false" headerAlign="center" type="checkcolumn">
</div>
<div id="field_85d92194" field="id" visible="false" allowSort="true" align="center" width="110" headerAlign="center">
ID
</div>
<div id="field_7c8a5fa0" field="product_affiliation_id" visible="false" allowSort="true" align="center" width="110" headerAlign="center">
product_affiliation_id
</div>
<div id="field_d2aa9ec0" field="project_describe" allowSort="true" width="80" headerAlign="center">
年度(在建项目)
</div>
<div id="field_0bc7d0f1" field="project_code" allowSort="true" width="120" headerAlign="center">
项目编号
</div>
<div id="field_9209c535" field="project_name" allowSort="true" width="120" headerAlign="center">
项目名称
</div>
<div id="field_14ebb33c" field="predict_money" allowSort="true" width="100" headerAlign="center">
合同预计金额
</div>
<div id="field_429baedc" field="reality_money" allowSort="true" width="100" headerAlign="center">
合同金额
</div>
<div id="field_dc9ef781" field="department" dataType="select" allowSort="true" width="100" headerAlign="center" format="xmgl_department">
管理归属产品部
</div>
<div id="field_69090861" field="manager" allowSort="true" width="100" headerAlign="center">
项目经理
</div>
<div id="field_2af77e1f" field="commerce" allowSort="true" width="100" headerAlign="center">
商务
</div>
<div id="field_ab43776b" field="client_name" allowSort="true" width="100" headerAlign="center">
客户
</div>
<div id="field_cb1e2f19" field="contract" dataType="select" allowSort="true" width="120" headerAlign="center" format="xmgl_contract">
合同文本是否已回
</div>
<div id="field_1878e40a" field="project_progress" allowSort="true" width="100" headerAlign="center">
项目进度
</div>
<div id="field_aba00162" field="online_date" allowSort="true" width="100" headerAlign="center">
上线日期
</div>
<div id="field_7ae3ebea" field="acceptance_date" allowSort="true" width="100" headerAlign="center">
验收日期
</div>
<div id="field_78935217" field="plan_online_date" allowSort="true" width="120" headerAlign="center">
计划上线日期
</div>
<div id="field_a0acc730" field="plan_report_date" allowSort="true" width="120" headerAlign="center">
计划上线报告回笼日期
</div>
<div id="field_072ea789" field="plan_acceptance_date" allowSort="true" width="120" headerAlign="center">
计划验收日期
</div>
<div id="field_401138d8" field="plan_acceptance_report_date" allowSort="true" width="120" headerAlign="center">
计划验收报告回笼日期
</div>
<div id="field_08f9376f" field="project_state" dataType="select" allowSort="true" width="100" headerAlign="center" format="xmgl_project_state">
项目状态
</div>
<div id="field_ee7c2396" field="product_project_progress" allowSort="true" width="120" headerAlign="center">
产品部反馈项目进度情况
</div>
<div id="field_72cc2456" field="commerce_project_progress" allowSort="true" width="120" headerAlign="center">
商务部反馈进度情况
</div>
<div id="field_66855c4b" field="project_day" allowSort="true" width="120" headerAlign="center">
项目实施天数
</div>
<div id="field_0194ebd2" field="project_rike_label" allowSort="true" width="120" headerAlign="center">
项目风险
</div>
<div id="field_a8d36045" field="project_progress_update" allowSort="true" width="120" headerAlign="center">
项目进度更新时间
</div>
<div id="field_349bbd95" field="product_project_progress_update" allowSort="true" width="120" headerAlign="center">
产品部项目反馈情况更新时间
</div>
<div id="field_cad87f67" field="commerce_project_progress_update" allowSort="true" width="120" headerAlign="center">
商务部项目反馈情况更新时间
</div>
<div id="field_7257aedf" field="reference_data" allowSort="true" width="120" headerAlign="center">
产品归属模块
</div>
<div id="field_05e1a3b8" field="project_start_date" allowSort="true" width="120" headerAlign="center">
项目启动时间
</div>
<div id="field_4f2de69e" field="contract_sign_date" allowSort="true" width="120" headerAlign="center">
合同签订时间
</div>
<div id="field_c30039f8" field="payment_way" allowSort="true" width="120" headerAlign="center">
付款方式
</div>
<div id="field_48aa8280" field="gathering_money_ok" allowSort="true" width="120" headerAlign="center">
已收款金额
</div>
<div id="field_c3f50aa2" field="gathering_money_not" allowSort="true" width="120" headerAlign="center">
未收款金额
</div>
<div id="field_59280616" field="top_thread_report_date" allowSort="true" width="120" headerAlign="center">
上线报告实际回笼时间
</div>
<div id="field_a02de173" field="acceptance_report_date" allowSort="true" width="120" headerAlign="center">
验收报告实际回笼时间
</div>
<div id="field_302cb17b" field="is_follow" dataType="select" allowSort="true" width="100" headerAlign="center" format="xmgl_is_follow">
是否跟进
</div>
<div id="field_67ec1e26" field="schedule_person" allowSort="true" width="120" headerAlign="center">
进度负责人
</div>
<div id="field_fdecf7a2" field="is_special_project" dataType="select" allowSort="true" width="120" headerAlign="center" format="xmgl_is_special_project">
是否特殊立项
</div>
<div id="field_aafd869b" field="email_date" allowSort="true" width="100" headerAlign="center">
邮件写的合同回笼日期
</div>
<div id="field_be4e78f3" field="product_type" allowSort="true" width="120" headerAlign="center">
产品类别
</div>
<div id="field_bd730a27" field="update_date" allowSort="true" width="180" headerAlign="center">
更新日期
</div>
<div field="field_8a909968" id="field_8a909968" dataType="javascript" allowSort="false" headerAlign="center">
产品归属
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_1af938b4",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"isMulSelect":"false","isSelect":"false","inputs":"","tagId":"button_ff2bae27","function":"query"},{"templateNo":"m_add_project","title":"添加项目","height":"600","refreshMode":"0","width":"1000","tagId":"xmgl_add_project","function":"popWindow"},{"templateNo":"m_edite_project","title":"修改项目","isSelect":"true","height":"600","inputs":"id:'$id$'","refreshMode":"0","width":"1000","type":"right","tagId":"button_3f3a27d3","function":"popWindow"},{"eventNo":"e_delete_project","isMulSelect":"true","inputs":"id:'$id$'","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"xmgl_delete_project","function":"submit"},{"templateNo":"m_upload_excel","title":"新增项目-Excel导入","height":"240","inputs":"","isReLoad":"true","width":"550","tagId":"xmgl_upload_excel","function":"uploadExcel"},{"paramFunc":"getParamsDownload","tagId":"button_8f60b1e2","function":"export"},{"tagId":"button_029b5990","function":"refresh"}],"idField":"id","allowUnselect":"false","showPager":"true","emptyText":"暂无数据","id":"datagrid1","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowAlternating":"true","isPage":"true","fields":[{"id":"field_8b222463","field":"field_8b222463","allowSort":"false","headerAlign":"center","type":"checkcolumn"},{"field":"id","id":"field_85d92194","visible":"false","allowSort":"true","headerAlign":"center","width":"110","align":"center"},{"field":"product_affiliation_id","id":"field_7c8a5fa0","visible":"false","allowSort":"true","headerAlign":"center","width":"110","align":"center"},{"field":"project_describe","id":"field_d2aa9ec0","allowSort":"true","headerAlign":"center","width":"80"},{"field":"project_code","id":"field_0bc7d0f1","allowSort":"true","headerAlign":"center","width":"120"},{"field":"project_name","id":"field_9209c535","allowSort":"true","headerAlign":"center","width":"120"},{"field":"predict_money","id":"field_14ebb33c","allowSort":"true","headerAlign":"center","width":"100"},{"field":"reality_money","id":"field_429baedc","allowSort":"true","headerAlign":"center","width":"100"},{"field":"department","id":"field_dc9ef781","dataType":"select","allowSort":"true","headerAlign":"center","width":"100","format":"xmgl_department"},{"field":"manager","id":"field_69090861","allowSort":"true","headerAlign":"center","width":"100"},{"field":"commerce","id":"field_2af77e1f","allowSort":"true","headerAlign":"center","width":"100"},{"field":"client_name","id":"field_ab43776b","allowSort":"true","headerAlign":"center","width":"100"},{"field":"contract","id":"field_cb1e2f19","dataType":"select","allowSort":"true","headerAlign":"center","width":"120","format":"xmgl_contract"},{"field":"project_progress","id":"field_1878e40a","allowSort":"true","headerAlign":"center","width":"100"},{"field":"online_date","id":"field_aba00162","allowSort":"true","headerAlign":"center","width":"100"},{"field":"acceptance_date","id":"field_7ae3ebea","allowSort":"true","headerAlign":"center","width":"100"},{"field":"plan_online_date","id":"field_78935217","allowSort":"true","headerAlign":"center","width":"120"},{"field":"plan_report_date","id":"field_a0acc730","allowSort":"true","headerAlign":"center","width":"120"},{"field":"plan_acceptance_date","id":"field_072ea789","allowSort":"true","headerAlign":"center","width":"120"},{"field":"plan_acceptance_report_date","id":"field_401138d8","allowSort":"true","headerAlign":"center","width":"120"},{"field":"project_state","id":"field_08f9376f","dataType":"select","allowSort":"true","headerAlign":"center","width":"100","format":"xmgl_project_state"},{"field":"product_project_progress","id":"field_ee7c2396","allowSort":"true","headerAlign":"center","width":"120"},{"field":"commerce_project_progress","id":"field_72cc2456","allowSort":"true","headerAlign":"center","width":"120"},{"field":"project_day","id":"field_66855c4b","allowSort":"true","headerAlign":"center","width":"120"},{"field":"project_rike_label","id":"field_0194ebd2","allowSort":"true","headerAlign":"center","width":"120"},{"field":"project_progress_update","id":"field_a8d36045","allowSort":"true","headerAlign":"center","width":"120"},{"field":"product_project_progress_update","id":"field_349bbd95","allowSort":"true","headerAlign":"center","width":"120"},{"field":"commerce_project_progress_update","id":"field_cad87f67","allowSort":"true","headerAlign":"center","width":"120"},{"field":"reference_data","id":"field_7257aedf","allowSort":"true","headerAlign":"center","width":"120"},{"field":"project_start_date","id":"field_05e1a3b8","allowSort":"true","headerAlign":"center","width":"120"},{"field":"contract_sign_date","id":"field_4f2de69e","allowSort":"true","headerAlign":"center","width":"120"},{"field":"payment_way","id":"field_c30039f8","allowSort":"true","headerAlign":"center","width":"120"},{"field":"gathering_money_ok","id":"field_48aa8280","allowSort":"true","headerAlign":"center","width":"120"},{"field":"gathering_money_not","id":"field_c3f50aa2","allowSort":"true","headerAlign":"center","width":"120"},{"field":"top_thread_report_date","id":"field_59280616","allowSort":"true","headerAlign":"center","width":"120"},{"field":"acceptance_report_date","id":"field_a02de173","allowSort":"true","headerAlign":"center","width":"120"},{"field":"is_follow","id":"field_302cb17b","dataType":"select","allowSort":"true","headerAlign":"center","width":"100","format":"xmgl_is_follow"},{"field":"schedule_person","id":"field_67ec1e26","allowSort":"true","headerAlign":"center","width":"120"},{"field":"is_special_project","id":"field_fdecf7a2","dataType":"select","allowSort":"true","headerAlign":"center","width":"120","format":"xmgl_is_special_project"},{"field":"email_date","id":"field_aafd869b","allowSort":"true","headerAlign":"center","width":"100"},{"field":"product_type","id":"field_be4e78f3","allowSort":"true","headerAlign":"center","width":"120"},{"field":"update_date","id":"field_bd730a27","allowSort":"true","headerAlign":"center","width":"180"},{"id":"field_8a909968","field":"field_8a909968","dataType":"javascript","items":[{"templateNo":"","title":"查看","height":"250","paramFunc":"getShenHeParams","width":"800","displayName":"查看","tagId":"field_8a909968","function":"popWindow"}],"allowSort":"false","headerAlign":"center"}],"allowResize":"false","pageSize":"20","class":"mini-datagrid","eventNo":"e_query_project","allowSortColumn":"true","isMulPageSelect":"true","inputs":"","showEmptyText":"true","loadDataCallBackFunc":"loadDataCallBackFunc","showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

function uploadExcel(param){
mini.parse();
var grid = mini.get("datagrid1");
var frameService = FrameService.getInstance();
function ondestroyCallBack(){
grid.load();
}
frameService.popWindow("新增项目-Excel导入", "m_upload_excel",param,550,240,false, null,ondestroyCallBack);
}
$(function(){
debugger;
//获取当前登录id
var login_id="${Session["@session_base_login_id"]}";
if( login_id == "admin"){
$("#xmgl_add_project").show();
$("#xmgl_upload_excel").show();
$("#xmgl_delete_project").show();
}else{
$("#xmgl_add_project").hide();
$("#xmgl_upload_excel").hide();
$("#xmgl_delete_project").hide();
}
});
function loadDataCallBackFunc(e){
if(e.login_id == "admin"){
}else{
}
mini.parse();
}
function getParamsDownload(){
mini.parse();
var param = new Object()
param.department = mini.getbyName("department").value;
param.manager = mini.getbyName("manager").value;
param.commerce = mini.getbyName("commerce").value;
param.client_name = encodeURI(encodeURI(mini.getbyName("client_name").value));
param.commerce = encodeURI(encodeURI(mini.getbyName("commerce").value));
param.project_name = encodeURI(encodeURI(mini.getbyName("project_name").value));
return param;
}
function getShenHeParams(){
debugger;
mini.parse();
var grid=mini.get("datagrid1");
var data=grid.getSelected();
var param = new Object();
// param.product_affiliation_id=encodeURIComponent(encodeURIComponent(data.product_affiliation_id));
param.product_affiliation_id=data.product_affiliation_id;
param["template_no"]='m_show_product_affiliation';
return param;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>