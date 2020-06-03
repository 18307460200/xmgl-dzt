/**
 * 程序入口配置读取 项目开发时需要的自定义配置
 */
define(function(require, exports, module) {
	var baseDir ="";  
	var project_configuration = require("/framework/project-configuration");
	var errorInfo = require("/framework/errorInfo");
	if (!project_configuration) {
		project_configuration = {};
	}
	if (!errorInfo) {
		errorInfo = {};
	}
	var configuration = {};
	// 项目中的需要先加载的css样式文件
	configuration["firstLoadCss"] = project_configuration["firstLoadCss"];
	// 页面标题
	configuration["pageTitle"] = project_configuration["pageTitle"] || "思迪信息";
	// 工程目录
	configuration["projPath"] = project_configuration["projPath"]
			|| baseDir+"/framework/";
	configuration["platRoot"] = project_configuration["platRoot"]
	|| baseDir+"/";
	configuration["seaBaseUrl"] = project_configuration["seaBaseUrl"]
	|| baseDir+"/";
	// 正则表达式替换
	configuration["expMap"] = project_configuration["expMap"]
			|| [ [ /^(.*\/(?:framework|plugins)\/.*\.(?:css|js))(?:.*)$/i,
					'$1?v=' + seajs._sysVersion ] ];
	// 错误功能号定义
	configuration["filters"] = {
		// 未登录
		"-999" : function(resultVo) {
			debugger;
			$.removeStorage("userInfo");
			window.top.location.href = baseDir+"/servlet/Login";
		},
		// 后台返回数据格式不正确，请联系管理员！
		"-998" : function(resultVo) {

		},
		// 网络中断或跨域请求或服务器异常！
		"-997" : function(resultVo) {

		},
		// 请求超时
		"-996" : function(resultVo) {

		},
		// 没有权限
		"-1001" : function(resultVo) {
		},
		"-1030" : function(resultVo) {
			$.jAlert("您的账号已在其它机器登录", "", "", "true", function() {
				$.removeStorage("userInfo");
				var loginPageCode = "index";
				var jsonParam = {};
				if (window.top.$) {
					window.top.$.redirect(loginPageCode, jsonParam);
				} else {
					$.redirect(loginPageCode, jsonParam);
				}
			});

		}

	};
	if (project_configuration["filters"]) {
		for ( var key in project_configuration["filters"]) {
			configuration["filters"][key] = project_configuration["filters"][key];
		}
	}
	// 登录检测
	configuration["loginCheck"] = {
		"pageFilters" : [
				], // 过滤的pageCode,可以绕过登录
		"checkFunc" : function(pageCode, param) { // 检测处理函数
			var checkFlag = true;
			return checkFlag;
		}
	};
	if(project_configuration["loginCheck"]){
		for(var key in project_configuration["loginCheck"]){
			configuration["loginCheck"][key] = project_configuration["loginCheck"][key];
		}
	}
	// 全局初始化函数
	configuration["initFunc"] = project_configuration["initFunc"]
			|| function(callBackFunc) { 
				//判断浏览器上面的回退按钮
				var pathname = window.location.pathname; 
				if(pathname.indexOf("/servlet/Login") > -1)
				{  
					var search = window.location.search;
					if(search.indexOf("R=-999") > -1){
						$.removeStorage("userInfo");
						window.location.href = baseDir+"/servlet/Login";; //在浏览器中不弹出框 
						return;
					}
					var userInfo = $.getStorage("userInfo"); 
					if($.string.isNotEmpty(userInfo))
					{ 
						window.location.href = baseDir+"/servlet/Main";; //在浏览器中不弹出框 
						return;
					}  
				}
		        $.tkui = {};
		        var miniAlert = window.mini.alert;
				window.mini.alert = function(content,title,callback){
					var ct = "";
					if(content && content.length > 0){
						var index = 0;
						var count = 40;
						while((index + count) < content.length){
							ct += content.substring(index,index + count)+"<BR/>";
							index += count;
						}
						if(index < content.length){
							ct += content.substring(index,content.length)+"<BR/>";
						}
					}
					miniAlert(ct,title,callback);
				};

				// 初始化js和css
				var jsAndCss = [];
				jsAndCss.push("frameService");
				jsAndCss.push("projectService");
				jsAndCss.push("datagrid");
				jsAndCss.push("treegrid");
				jsAndCss.push("tree");
				jsAndCss.push("outlooktree");
				jsAndCss.push("form");
				jsAndCss.push("lazypanel");
				jsAndCss.push("uewebeditor");
				jsAndCss.push("ueditor");
				jsAndCss.push("editor");
				jsAndCss.push("ceditor");
				jsAndCss.push("upload");
				jsAndCss.push("calendar");
				jsAndCss.push("chart");
				jsAndCss.push("tab");
				jsAndCss.push("label");
				jsAndCss.push("jquery-migrate"); 
				jsAndCss.push("smUtil");
				require.async(jsAndCss, function() {
					if (callBackFunc) {
						callBackFunc();
					}
				});
			};

	/**
	 * 项目中模块的别名配置
	 */
	configuration["pAlias"] = {
		"projectService" : "framework/scripts/service/projectService",
		"frameService" : "plugins/frame/scripts/service/frameService",
		"datagrid" : "plugins/frame/scripts/datagrid",
		"treegrid" : "plugins/frame/scripts/treegrid",
		"tree" : "plugins/frame/scripts/tree",
		"outlooktree" : "plugins/frame/scripts/outlooktree",
		"form" : "plugins/frame/scripts/form",
		"lazypanel" : "plugins/frame/scripts/lazypanel",
		"uewebeditor" : "plugins/ueditor/ueditor.all.min",
		"ueditor" : "plugins/frame/scripts/ueditor",
		"ewebeditor" : "plugins/editor/ewebeditor/ewebeditor",
		"editor" : "plugins/frame/scripts/editor",
		"ceditor" : "plugins/frame/scripts/ceditor",
		"upload" : "plugins/frame/scripts/upload",
		"calendar" : "plugins/frame/scripts/calendar",
		"chart" : "plugins/frame/scripts/chart",
		"tab" : "plugins/frame/scripts/tab",
		"label" : "plugins/frame/scripts/label",
		"jquery-migrate" : "plugins/frame/scripts/service/jquery-migrate-1-2-1",
		"smUtil" : "plugins/sm/scripts/smUtil"
	};

	if (project_configuration["pAlias"]) {
		for ( var key in project_configuration["pAlias"]) {
			configuration["pAlias"][key] = project_configuration["pAlias"][key];
		}
	}
	
	/**
	 * 项目中需要调用到的常量、变量这里配置
	 */
	configuration["global"] = {
		"server" : baseDir + "/servlet/ModuleEvent", // 接入服务器接口地址
		"uploadAction": baseDir + "/servlet/Upload",//上传文件地址
		"importModule":baseDir + "/servlet/Import",//导入zip文件的地址
		"exportServer" : baseDir + "/servlet/function/ExportFunction", // 导出的url地址
		"uploadUrl" : baseDir + "/servlet/UploadAction", //上传弹层的地址
		"uploadLimitTypeUrl" : baseDir + "/servlet/function/FileUploadInfoFunction", //上传类型限制的查询地址
		"uploadDeleteUrl" : baseDir + "/servlet/function/FileDeleteFunction", //删除上传文件的接口地址
		"getRsaPubKey" : baseDir + "/servlet/function/GetRsaPubKey", //获取RSA加密的公钥信息
		"fullScreenCatalogId" : "", // 需要全屏的栏目id，多个|分割
		"timers" : [], // 当前页面定时任务数组
		"dicMap" : {}, // 数据字典
		"signKey":"nPeaYkREFgwhlz6/UN582G8s+z8T6jaWk+NOBwYFNMweT9CVhloh0e0kmq2PagBU", //签名key
		"requestMode":"1" //0:不加密，不加签，1：加签不加密，2：加密加签	
	};
	if (project_configuration["global"]) {
		for ( var key in project_configuration["global"]) {
			configuration["global"][key] = project_configuration["global"][key];
		}
	}
	// 暴露对外的接口
	module.exports = window.configuration = configuration;
});