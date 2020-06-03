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
<div id="form1" eventNo="e_query_catalog" inputs="catalogId:'$id$'" style="width:500px;">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_4c735fe0" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_eefa8acc" style="border-width:1px;">
<td>
<input id="textbox_9fd87d27" style="width:100%" labelStyle="text-align:right;" name="name" labelField="true" class="mini-textbox" label="目录名：" required="true"/>
</td>
</tr>
<tr id="group_dc6c35a5" style="border-width:1px;">
<td>
<input id="textbox_0a3bf542" style="width:100%" labelStyle="text-align:right;" name="link_url" labelField="true" class="mini-textbox" label="访问地址："/>
</td>
</tr>
<tr id="group_6e5ee63d" style="border-width:1px;">
<td>
<input id="module_id" showClose="true" allowInput="false" style="width:100%" labelStyle="text-align:right;" name="module_id" labelField="true" class="mini-buttonedit" label="模板链接：" selectOnFocus="true"/>
</td>
</tr>
<tr id="group_a6621c31" style="border-width:1px;">
<td>
<input id="textbox_2fde880a" style="width:100%" labelStyle="text-align:right;" name="orderline" labelField="true" class="mini-textbox" label="排序值："/>
</td>
</tr>
<tr id="group_0a932788" style="border-width:1px;">
<td>
<input id="combobox_cd83967b" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="state" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="栏目状态："/>
</td>
</tr>
<tr id="group_0ef953ca" style="border-width:1px;">
<td>
<div id="checkboxlist_ed28b743" labelStyle="text-align:right;" name="app_id" repeatItems="4" valueField="item_value" labelField="true" class="mini-checkboxlist" textField="item_name" label="app对应的权限：" repeatLayout="table"></div>
</td>
</tr>
<tr id="group_c509635c" style="border-width:1px;">
<td>
<input id="textarea_6f7d57c2" style="width:100%" labelStyle="text-align:right;" name="description" labelField="true" class="mini-textarea" label="栏目描述："/>
</td>
</tr>
<tr id="group_f59502f7" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_edit_catalog"><a id="button_72c96ac8" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">修改</a>
</@permission>
<a id="button_eabce8bb" style="width:60px;" class="mini-button" iconCls="icon-redo" function="reset">重置</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_catalog","toolbar":[{"eventNo":"e_edit_catalog","inputs":"catalogId:'$id$'","callbackFunc":"freshTree","tagId":"button_72c96ac8","isValid":"true","function":"submit"},{"tagId":"button_eabce8bb","function":"reset"}],"style":"width:500px;","inputs":"catalogId:'$id$'","formitem":[{"title":"添加模块","dataType":"popWindow","height":"580","inputs":"catalog_id:'$id$'","width":"800","callbackFunc":"addModule","format":"add_module","displayName":"添加模块","tagId":"module_id"},{"dataType":"select","format":"state","tagId":"combobox_cd83967b"},{"dataType":"select","format":"app_id","tagId":"checkboxlist_ed28b743"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

function freshTree(){
var node = window.Owner.mini.get("tree1").getSelectedNode();
window.Owner.$.tkui['tree1'].refresh(2);
if(node){
setTimeout(function(){
window.Owner.mini.get("tree1").selectNode(node);
},300);
}
}
function addModule(action,iframe)
{
var btnEdit = mini.get("module_id")
if (action == "ok") {
var data = iframe.contentWindow.GetData();
data = mini.clone(data); //必须
if (data) {
btnEdit.setValue(data.module_id);
btnEdit.setText(data.module_type_name+" --> "+data.name+"("+data.module_no+")");
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