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
<div id="splitter_0fdf5c76" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_22cdfe27" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_a4d5699a" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_6faa9ad9" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_cbf92b0e" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_7559838b" style="width:100%;" tagname="toolbar">
<a id="button_13ba904b" class="mini-button" iconCls="icon-add">增加</a>
<a id="button_c5372411" class="mini-button" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_user"><a id="button_495d5238" class="mini-button" iconCls="icon-remove">删除</a>
</@permission>
<@permission eventNo="e_edit_statey"><a id="button_a91e627b" class="mini-button" iconCls="icon-edit">注销</a>
</@permission>
<@permission eventNo="e_edit_statex"><a id="button_70e10cd3" class="mini-button" iconCls="icon-edit">激活</a>
</@permission>
<a id="button_d9c31836" class="mini-button" iconcls="icon-upload">导入</a>
<a id="button_0e45d1b3" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
<td id="group_a7d8bec3" style="white-space:nowrap;" tagname="toolbar">
<input id="textbox_f298ccd8" style="width:120px;" name="name" class="mini-textbox" emptyText="用户姓名："/>
<input id="textbox_78e97a13" style="width:120px;" name="login_id" class="mini-textbox" emptyText="登录账号："/>
<input id="textbox_88aa4d6e" style="width:120px;" name="mobile_phone" class="mini-textbox" emptyText="联系电话："/>
<a id="button_9ae4253e" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" pageSize="20" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_user" frozenStartColumn="-1" multiSelect="true" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_3424bc90" property="columns">
<div field="field_a12b8019" id="field_a12b8019" allowSort="true" headerAlign="center" type="checkcolumn">
序号
</div>
<div id="field_545f527a" field="login_id" allowSort="true" width="100" headerAlign="center">
登录账号
</div>
<div id="field_ad265cfc" field="name" allowSort="true" width="120" headerAlign="center">
用户姓名
</div>
<div id="field_e2242afb" field="state" dataType="select" allowSort="true" width="80" headerAlign="center" format="user_state">
状态
</div>
<div id="field_90e59ecc" field="login_times" allowSort="true" width="100" headerAlign="center">
登录次数
</div>
<div id="field_1c5dd024" field="employee_no" allowSort="true" width="100" headerAlign="center">
员工编号
</div>
<div id="field_4b40d5ce" field="mobile_phone" allowSort="true" width="100" headerAlign="center">
联系电话
</div>
<div field="field_2c462cb1" id="field_2c462cb1" dataType="javascript" allowSort="false" width="120" headerAlign="center">
操作
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_6faa9ad9",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"m_add_user","title":"添加用户","height":"530","width":"650","tagId":"button_13ba904b","function":"popWindow"},{"templateNo":"m_edit_user","title":"修改用户","isSelect":"true","height":"500","inputs":"user_id:''","width":"650","tagId":"button_c5372411","function":"popWindow"},{"eventNo":"e_delete_user","isMulSelect":"true","inputs":"user_id:'$user_id$'","isAlert":"true","isReLoad":"true","alertMsg":"是否确认删除?","tagId":"button_495d5238","function":"submit"},{"eventNo":"e_edit_statey","isMulSelect":"true","inputs":"user_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_a91e627b","function":"submit"},{"eventNo":"e_edit_statex","isMulSelect":"true","inputs":"user_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_70e10cd3","function":"submit"},{"templateNo":"m_import_user","title":"导入用户信息","height":"250","width":"450","tagId":"button_d9c31836","function":"popWindow"},{"tagId":"button_0e45d1b3","function":"refresh"},{"isMulSelect":"false","isSelect":"false","inputs":"","tagId":"button_9ae4253e","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","pageSize":"20","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_user","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","allowAlternating":"true","showEmptyText":"true","isPage":"true","fields":[{"id":"field_a12b8019","field":"field_a12b8019","allowSort":"true","headerAlign":"center","type":"checkcolumn"},{"field":"login_id","id":"field_545f527a","allowSort":"true","headerAlign":"center","width":"100"},{"field":"name","id":"field_ad265cfc","allowSort":"true","headerAlign":"center","width":"120"},{"field":"state","id":"field_e2242afb","dataType":"select","allowSort":"true","headerAlign":"center","width":"80","format":"user_state"},{"field":"login_times","id":"field_90e59ecc","allowSort":"true","headerAlign":"center","width":"100"},{"field":"employee_no","id":"field_1c5dd024","allowSort":"true","headerAlign":"center","width":"100"},{"field":"mobile_phone","id":"field_4b40d5ce","allowSort":"true","headerAlign":"center","width":"100"},{"id":"field_2c462cb1","field":"field_2c462cb1","dataType":"javascript","items":[{"templateNo":"m_user_info","title":"查看详情","height":"500","inputs":"user_id:''","width":"600","displayName":"查看详情","tagId":"field_2c462cb1","function":"popWindow"},{"templateNo":"m_user_rights","title":"查看权限","height":"600","inputs":"user_id:''","width":"450","displayName":"查看权限","tagId":"field_2c462cb1","function":"popWindow"},{"templateNo":"m_editpwd_user","title":"重置密码","height":"200","inputs":"user_id:''","width":"400","displayName":"重置密码","tagId":"field_2c462cb1","function":"popWindow"}],"allowSort":"false","headerAlign":"center","width":"120"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>