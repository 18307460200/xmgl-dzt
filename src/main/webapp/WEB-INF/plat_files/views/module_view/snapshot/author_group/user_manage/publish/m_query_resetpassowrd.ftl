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
<div id="splitter_51021e69" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_f16c587e" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_e800b863" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_57826be6" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_e3fec766" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_8ccd1306" style="width:100%;" tagname="toolbar">
<@permission eventNo="e_edit_statey"><a id="button_f5bf8234" class="mini-button" iconCls="icon-edit">有效</a>
</@permission>
<@permission eventNo="e_edit_statex"><a id="button_1feca9e3" class="mini-button" iconCls="icon-edit">无效</a>
</@permission>
<a id="button_cb56c7c8" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
<td id="group_3a8b44f6" style="white-space:nowrap;" tagname="toolbar">
<input id="textbox_e41c0b68" style="width:200px;" name="login_id" class="mini-textbox" emptyText="登录账号："/>
<input id="textbox_3a3585a2" style="width:200px;" name="name" class="mini-textbox" emptyText="用户姓名："/>
<a id="button_633a9818" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" pageSize="20" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_loginuser" frozenStartColumn="-1" multiSelect="true" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_5c24d1fc" property="columns">
<div field="field_0a7ce862" id="field_0a7ce862" allowSort="false" headerAlign="center" type="checkcolumn">
</div>
<div id="field_76ad4c7a" field="login_id" allowSort="true" width="120" headerAlign="center">
登录账号
</div>
<div id="field_252ecb1e" field="name" allowSort="true" width="120" headerAlign="center">
用户姓名
</div>
<div id="field_eab7645a" field="sex" dataType="select" allowSort="true" width="80" headerAlign="center" format="sex">
性别
</div>
<div id="field_6bc23147" field="state" dataType="select" allowSort="true" width="80" headerAlign="center" format="state">
状态
</div>
<div id="field_2fc15d77" field="employee_no" allowSort="true" width="100" headerAlign="center">
员工编号
</div>
<div id="field_9c19c094" field="mobile_phone" allowSort="true" width="100" headerAlign="center">
联系电话
</div>
<div id="field_534ac54d" field="login_times" allowSort="true" width="100" headerAlign="center">
登录次数
</div>
<div field="field_1c61e14e" id="field_1c61e14e" dataType="javascript" allowSort="false" headerAlign="center">
操作
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_57826be6",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"eventNo":"e_edit_statey","isMulSelect":"true","inputs":"user_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_f5bf8234","function":"submit"},{"eventNo":"e_edit_statex","isMulSelect":"true","inputs":"user_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_1feca9e3","function":"submit"},{"tagId":"button_cb56c7c8","function":"refresh"},{"isMulSelect":"false","isSelect":"false","inputs":"","tagId":"button_633a9818","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","pageSize":"20","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_loginuser","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","allowAlternating":"true","showEmptyText":"true","isPage":"true","fields":[{"id":"field_0a7ce862","field":"field_0a7ce862","allowSort":"false","headerAlign":"center","type":"checkcolumn"},{"field":"login_id","id":"field_76ad4c7a","allowSort":"true","headerAlign":"center","width":"120"},{"field":"name","id":"field_252ecb1e","allowSort":"true","headerAlign":"center","width":"120"},{"field":"sex","id":"field_eab7645a","dataType":"select","allowSort":"true","headerAlign":"center","width":"80","format":"sex"},{"field":"state","id":"field_6bc23147","dataType":"select","allowSort":"true","headerAlign":"center","width":"80","format":"state"},{"field":"employee_no","id":"field_2fc15d77","allowSort":"true","headerAlign":"center","width":"100"},{"field":"mobile_phone","id":"field_9c19c094","allowSort":"true","headerAlign":"center","width":"100"},{"field":"login_times","id":"field_534ac54d","allowSort":"true","headerAlign":"center","width":"100"},{"id":"field_1c61e14e","field":"field_1c61e14e","dataType":"javascript","items":[{"templateNo":"m_editpwd_user","title":"重置密码","height":"200","inputs":"user_id:''","width":"400","displayName":"重置密码","tagId":"field_1c61e14e","function":"popWindow"}],"allowSort":"false","headerAlign":"center"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
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