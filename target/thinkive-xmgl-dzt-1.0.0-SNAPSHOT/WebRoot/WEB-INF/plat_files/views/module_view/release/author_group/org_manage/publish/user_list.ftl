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
<div id="splitter_ad165a0a" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_44831685" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_8a7bd6d2" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_1b9c75d8" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_4c249810" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_3eda7980" style="width:100%;" tagname="toolbar">
<a id="button_13035db4" class="mini-button" iconCls="icon-add">增加</a>
<@permission eventNo="e_delete_orguser"><a id="button_513c1bef" class="mini-button" iconCls="icon-remove">删除</a>
</@permission>
</td>
<td id="group_c7d6d2ff" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:150px;" name="key" class="mini-textbox" emptyText="请输入姓名"/>
<a id="button_8df3a732" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_userlist" frozenStartColumn="-1" multiSelect="true" inputs="post_id:'$post_id$',dept_id:'$dept_id$'" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_cbb219d0" property="columns">
<div field="field_95e8d103" id="field_95e8d103" allowSort="false" headerAlign="center" type="checkcolumn">
</div>
<div id="field_b3baead1" field="employee_no" allowSort="true" align="center" width="100" headerAlign="center">
员工编号
</div>
<div id="field_ad1be382" field="name" allowSort="true" align="center" width="100" headerAlign="center">
姓名
</div>
<div id="field_9ee01b8a" field="mobile_phone" allowSort="true" align="center" width="100" headerAlign="center">
手机号码
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_1b9c75d8",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"filterFunc":"conditionFilter","templateNo":"add_user","title":"添加用户","height":"500","inputs":"post_id:'$post_id$',dept_id:'$dept_id$'","width":"650","tagId":"button_13035db4","function":"popWindow"},{"eventNo":"e_delete_orguser","isMulSelect":"true","inputs":"id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认删除?","tagId":"button_513c1bef","function":"submit"},{"inputs":"key:''","tagId":"button_8df3a732","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_userlist","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","inputs":"post_id:'$post_id$',dept_id:'$dept_id$'","allowAlternating":"true","showEmptyText":"true","isPage":"true","fields":[{"id":"field_95e8d103","field":"field_95e8d103","allowSort":"false","headerAlign":"center","type":"checkcolumn"},{"field":"employee_no","id":"field_b3baead1","allowSort":"true","headerAlign":"center","width":"100","align":"center"},{"field":"name","id":"field_ad1be382","allowSort":"true","headerAlign":"center","width":"100","align":"center"},{"field":"mobile_phone","id":"field_9ee01b8a","allowSort":"true","headerAlign":"center","width":"100","align":"center"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<script type="text/javascript">
<!--

mini.parse();
var grid = mini.get("datagrid1");
var param = mini.getParams();
var post_id = param.post_id;
//添加用户前验证是不是岗位
function conditionFilter(){
if(post_id == "-1"){
mini.alert("请选择组织机构下面的岗位添加用户!");
return false;
}else{
return true;
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>