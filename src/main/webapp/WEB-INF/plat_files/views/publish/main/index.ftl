<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE;text/html; charset=UTF-8" />
<script src="${ctxPath}/plugins/miniui/jquery.min.js" type="text/javascript"></script>
<script src="${ctxPath}/plugins/miniui/scripts/miniui/miniui.js" type="text/javascript"></script>
<script src="${ctxPath}/plugins/miniui/template/index/navtree.js" type="text/javascript"></script>
<link href="${ctxPath}/plugins/miniui/scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
<link href="${ctxPath}/plugins/miniui/scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
<link href="${ctxPath}/plugins/miniui/scripts/miniui/themes/thinkive/skin.css" rel="stylesheet" type="text/css" />
<link href="${ctxPath}/plugins/miniui/template/core.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctxPath}/bootstrap/dist/css/bootstrap.css" />
<link rel="stylesheet" href="${ctxPath}/bootstrap/dist/css/bootstrap-table.css" />
<link rel="stylesheet" href="${ctxPath}/bootstrap/dist/css/font-awesome.min.css" />
<link rel="stylesheet" href="${ctxPath}/bootstrap/dist/css/daterangepicker-bs3.css" />
<link rel="stylesheet" href="${ctxPath}/bootstrap/dist/css/multitabs.css" />
<link rel="stylesheet" href="${ctxPath}/bootstrap/dist/css/style.css" />
<link rel="stylesheet" href="${ctxPath}/bootstrap/plugins/fileinput/css/fileinput.css" />
<script type="text/javascript" src="${ctxPath}/bootstrap/dist/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/dist/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/dist/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/dist/js/moment.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/dist/js/daterangepicker.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/dist/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/dist/js/droppicker.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/dist/js/multitabs.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/plugins/fileinput/js/fileinput.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/plugins/fileinput/js/locales/zh.js"></script>
<script type="text/javascript" src="${ctxPath}/bootstrap/plugins/modal/modal.js"></script>
<script type="text/javascript" src="${ctxPath}/framework/scripts/index.js"></script>
<style type="text/css">
body{
margin:0;padding:0;border:0;width:100%;height:100%;overflow:auto;
}
</style>
</head>
<body id="bodyContent">
<div id="header" class="navbar navbar-inverse navbar-fixed-top" nodeIndex="0">
<div class="navbar_inner clearfix" nodeIndex="0">
<div class="top_select" nodeIndex="0">
<div class="inner_fr" nodeIndex="0">
<div class="user_taskbox" style="display:none" nodeIndex="0">
<strong class="icon" nodeIndex="0"><em id="fxc_count" nodeIndex="0"></em></strong>
<div class="layer" style="display: none" nodeIndex="1">
<i nodeIndex="0"></i>
<ul nodeIndex="1">
<li class="n1" nodeIndex="0">
<a href="#" nodeIndex="0">
<strong id="fxc_video" nodeIndex="0"></strong>
<span nodeIndex="1">视频任务</span>
</a>
</li>
<li class="n2" nodeIndex="1">
<a href="#" nodeIndex="0">
<strong class="imp" id="fxc_review" nodeIndex="0"></strong>
<span nodeIndex="1">待审核任务</span>
</a>
</li>
</ul>
</div>
</div>
<em id="fxc_counts_fg" style="display:none" nodeIndex="1">|</em>
<a href="#" nodeIndex="2">你好，${Session["@session_base_user_name"]}<i class="icon_down" nodeIndex="0"></i></a>
<ul role="menu" class="dropdown-menu dropdown-menu-right" nodeIndex="3">
<li nodeIndex="0"><a id="updatePassWord" href="#" class="change_psw" nodeIndex="0"><i nodeIndex="0"></i><p nodeIndex="1">修改密码</p></a></li>
<li nodeIndex="1"><a href="${ctxPath}/servlet/Logout" class="sign_out" nodeIndex="0"><i nodeIndex="0"></i><p nodeIndex="1">退出</p></a></li>
</ul>
</div>
<div class="inner_fl" nodeIndex="1">
<span class="logo" nodeIndex="0"></span><span nodeIndex="1">业务开发平台</span>
</div>
</div>
</div>
</div>
<div id="include_header" class="container_fluid_det" nodeIndex="1">
<div class="sidebar_nav_box" nodeIndex="0">
<li class="header" nodeIndex="0"></li>
<ul id="header_menu" class="sidebar-menu" style="display:none;" nodeIndex="1">
</ul>
</div>
<div class="main_content_box" id="content_wrapper" nodeIndex="1"> </div>
</div>
<script type="text/javascript">
<!--

var page_id = "#include_header";
$.tkReady=function(){
var param = {};
FrameService.getInstance().processSubmit(queryTreeDataComplete, "", param,null, null,false,"${ctxPath}/servlet/QueryCatalogAll");
function queryTreeDataComplete(resultVo){
if(resultVo.getErrorNo() == 0){
var results = resultVo.obj.results.results;
$(page_id+ " #header_menu").show();
var html="";
var num = 2;
var nums = 1;
var catalog_ids = "";
for(var m=0;m < results.length; m++){
if(results[m].parent_id == 0){
catalog_ids = results[m].catalog_id;
//delete results(m);
}
}
for(var i=0;i < results.length; i++){
if(results[i].parent_id == catalog_ids){
html += "<li class='treeview'><a href='javascript:;' class='has_menu menu_01'><i class='fa_close'></i><span>"+results[i].name+"</span></a>";
for(var j=0;j<results.length;j++){
if(results[i].catalog_id == results[j].parent_id)
{
html +="<ul class='treeview-menu'>";
if(results[j].childrennum == 0){
var param = {};
param.catalog_id = results[j].catalog_id;
param.module_id = results[j].module_id;
var link_url = results[j].link_url;
var url = FrameService.getInstance().getCommonUrl("",param,link_url,"");
html +="<li><a class='multitabs' href='"+url+"' data-type='info' data-iframe='true'><i class='nav_icon nav_icon_0"+nums+"'></i>"+results[j].name+"</a>";
html +="</li>";
nums = nums+1;
}else{
var childrenhtml="";
childrenhtml += queryCatalogChildren(num,childrenhtml,results[j],results);
html += childrenhtml;
}
html +="</ul>";
}
}
html +="</li>";
}
}
$(page_id+" #header_menu").empty().html(html);
}
}
function queryCatalogChildren(num,html,result,results){
html +="<li><a href='javascript:;' class='has_menu_0"+num+"'><i class='fa_close'></i><span>"+result.name+"</span></a>";
for(var n=0;n < results.length;n++){
if(result.catalog_id == results[n].parent_id)
{
html +="<ul class='treeview-menu three_menu_list'>";
num = num+1;
if(results[n].childrennum == 0){
var param = {};
param.catalog_id = results[n].catalog_id;
param.module_id = results[n].module_id;
var link_url = results[n].link_url;
var url = FrameService.getInstance().getCommonUrl("",param,link_url,"");
html +="<li><a class='multitabs' href='"+url+"' data-type='info' data-iframe='true'><i class='nav_icon nav_icon_0"+num+"'></i>"+results[n].name+"</a>";
html +="</li>";
}else{
var childrenhtml="";
childrenhtml += queryCatalogChildren(num,childrenhtml,results[n],results);
html += childrenhtml;
//html +="<li><a href='javascript:;' class='has_menu_0"+m+"'><i class='fa_close'></i><span>"+results[n].name+"</span></a>";
//html +="</li>";
}
html +="</ul>";
}
}
html +="</li>";
return html;
}
$(document).ready(function(){
$('#content_wrapper').multitabs({
link : '.multitabs', //触发multitabs的selector text，注意需要有".","#"等
iframe : true, //iframe模式的总局设置。当值为false的时候，为智能模式，自动判断（内网用ajax，外网用iframe）。缺省为false。
class : '', //主框架的class
init : [ //需要在初始加载的tab
{
type :'main', //标签页的类型，有 main | info，缺省为 info
title : '首页', //标题（可选），没有则显示网址
content: '<p style="text-align:center; padding-top:80px;"><img src="${ctxPath}/framework/image/pic17.jpg"/></p>', //html内容，如果设定此值，下面的URL设定则无效
url : ''
},
{ /** 更多tab。。**/ }, //依次添加需要的页面
{ /** 更多tab。。**/ }, //依次添加需要的页面
],
nav : {
backgroundColor : '#f7f7f7', //默认nav-bar 背景颜色
class : '', //为nav添加class
draggable : true, //nav tab 可拖动选项
fixed : true, //固定标签头列表
layout : 'default', //有两种模式，'default', 'classic'(所有隐藏tab都在下拉菜单里) 和 'simple'
maxTabs : 15, //最多tab数量。（main和editor不计算在内) 当为1时，整个标签栏隐藏。main和editor分别只能有1个标签。
maxTabTitleLength : 25, //tab标题的最大长度
showCloseOnHover : true, //当值为true，仅在鼠标悬浮时显示关闭按钮。false时一直显示
style : 'nav-tabs', //可以为nav-tabs 或 nav-pills
},
content : {
ajax : {
class : '', //为ajax tab-pane 添加class
error : function (htmlCallBack) {
//modify html and return
return htmlCallBack;
},
success : function (htmlCallBack) {
//modify html and return
return htmlCallBack;
}
},
iframe : {
class : '' //为iframe tab-pane 添加class
}
},
language : { //语言配置
nav : {
title : 'Tab', //默认的标签页名称
dropdown : '', //标签栏的下拉菜单名称
showActivedTab : '显示激活页面', //下拉菜单的显示激活页面
closeAllTabs : '关闭所有页面', //下拉菜单的关闭所有页面
closeOtherTabs : '关闭其他页面', //下拉菜单的关闭其他页面
}
}
});
$(".sidebar_nav_box .treeview .has_menu").click(function(){
if($(this).parent(".treeview").hasClass("active")){
$(this).parent(".treeview").removeClass("active");
$(this).siblings(".treeview-menu").slideUp(500);
$(this).children("i").removeClass("fa_open");
}else{
$(this).parent(".treeview").addClass("active").siblings().removeClass("active");
$(this).siblings(".treeview-menu").slideDown(500);
$(this).parent(".treeview").siblings().children(".treeview-menu").slideUp(500);
$(this).children("i").addClass("fa_open");
$(this).parents(".treeview").siblings().children(".has_menu").children().removeClass("fa_open");
}
});
$(".sidebar_nav_box .treeview .has_menu_02").click(function(){
if($(this).hasClass("current")){
$(this).removeClass("current");
$(this).siblings(".three_menu_list").slideUp(500);
$(this).children("i").removeClass("fa_open");
}else{
$(this).addClass("current").parent("li").siblings().children("a").removeClass("current");
$(this).siblings(".three_menu_list").slideDown(500);
$(this).parent("li").siblings().children(".treeview-menu").slideUp(500);
$(this).children("i").addClass("fa_open");
$(this).parent("li").siblings().children(".has_menu").children().removeClass("fa_open");
}
});
$(".sidebar_nav_box .treeview .has_menu_03").click(function(){
if($(this).hasClass("current")){
$(this).removeClass("current");
$(this).siblings(".three_menu_list").slideUp(500);
$(this).children("i").removeClass("fa_open");
}else{
$(this).addClass("current").parent("li").siblings().children("a").removeClass("current");
$(this).siblings(".three_menu_list").slideDown(500);
$(this).parent("li").siblings().children(".treeview-menu").slideUp(500);
$(this).children("i").addClass("fa_open");
$(this).parent("li").siblings().children(".has_menu").children().removeClass("fa_open");
}
});
$(".sidebar_nav_box .treeview .has_menu_04").click(function(){
if($(this).hasClass("current")){
$(this).removeClass("current");
$(this).siblings(".three_menu_list").slideUp(500);
$(this).children("i").removeClass("fa_open");
}else{
$(this).addClass("current").parent("li").siblings().children("a").removeClass("current");
$(this).siblings(".three_menu_list").slideDown(500);
$(this).parent("li").siblings().children(".treeview-menu").slideUp(500);
$(this).children("i").addClass("fa_open");
$(this).parent("li").siblings().children(".has_menu").children().removeClass("fa_open");
}
});
$(".sidebar_nav_box .treeview-menu .multitabs").click(function(){
//var self = $(".multitabs").not($(this));
if($(this).hasClass("current")){
$(this).removeClass("current");
}else{
$(this).addClass("current");
$(".multitabs").not($(this)).removeClass("current");
}
});
$(".sidebar_nav_box .treeview-menu .multitabs").on("click", function(){
$(this).addClass("current").parent().siblings().children().removeClass("current")
})
$(".sidebar_nav_box .header").unbind("click").click(function(){
if($(this).hasClass('small_header')){
$(this).removeClass('small_header');
$(this).parents(".sidebar_nav_box").removeClass('small_slider').stop().animate({width:'180px'},250);
$('.main_content_box').stop().animate({marginLeft:"180px"},250);
}else{
$(this).addClass('small_header');
$(this).parents(".sidebar_nav_box").addClass('small_slider').stop().animate({width:'50px'},250);
$('.main_content_box').stop().animate({marginLeft:"50px"},250);
}
return false;
});
$(".sidebar_nav_box .sidebar-menu").unbind("click").click(function(){
if($(this).parents(".sidebar_nav_box").children(".header").hasClass('small_header')){
$(this).parents(".sidebar_nav_box").removeClass('small_slider').stop().animate({width:'180px'},250);
$('.main_content_box').stop().animate({marginLeft:"180px"},250);
}
})
/*
$(".sidebar_nav_box .sidebar-menu").mouseleave(function(){
if($(this).parents(".sidebar_nav_box").children(".header").hasClass('small_header')){
$(this).parents(".sidebar_nav_box").addClass('small_slider').stop().animate({width:'50px'},250);
$('.main_content_box').stop().animate({marginLeft:"50px"},250);
}
})*/
/*获取sidebar-menu的高度*/
var sidebar_menu_H = $(".sidebar_nav_box").height() - $(".navbar ").outerHeight() - $(".sidebar_nav_box .header").outerHeight()
$(".sidebar_nav_box .sidebar-menu").height(sidebar_menu_H + "px");
/*滚动条*/
$(".sidebar_nav_box .sidebar-menu").niceScroll({
cursorcolor:"#e5e5e5",
cursoropacitymax:1,
touchbehavior:false,
cursorwidth:"8px",
cursorborder:"0",
cursorborderradius:"8px"
});
$(".sidebar_nav_box .treeview a").click(function(){
setTimeout(function(){
$(".sidebar_nav_box .sidebar-menu").getNiceScroll().resize();
},500);
})
$(".navbar_inner .inner_fr").hover(function(){
if($(this).children().children(".icon_down").hasClass("icon_up")){
$(this).children(".dropdown-menu").slideUp(300);
$(this).children().children(".icon_down").removeClass("icon_up");
}else{
$(this).children(".dropdown-menu").slideDown(300);
$(this).children().children(".icon_down").addClass("icon_up");
}
})
$(".mt-nav-bar .mt-dropdown").hover(function(){
$(this).addClass("open");
},function(){
$(this).removeClass("open");
});
$("#updatePassWord").click(function(){
FrameService.getInstance().popWindow("修改密码","m_edit_updatepassword",null,"400","260","",null,null,"${ctxPath}/servlet/UpdatePassword");
});
});
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/bootstrap/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>