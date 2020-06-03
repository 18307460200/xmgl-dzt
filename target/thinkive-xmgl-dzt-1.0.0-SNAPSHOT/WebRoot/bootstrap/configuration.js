/**
 * 程序入口配置读取 项目开发时需要的自定义配置
 */
define(function(require, exports, module) {
	var baseDir ="";  
	var project_configuration = require("/bootstrap/project-configuration");
	var errorInfo = require("/bootstrap/errorInfo");
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
			|| [ [ /^(.*\/(?:bootstrap|plugins)\/.*\.(?:css|js))(?:.*)$/i,
					'$1?v=' + seajs._sysVersion ] ];
	// 错误功能号定义
	configuration["filters"] = {
		// 未登录
		"-999" : function(resultVo) { 
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
						window.top.location.href = baseDir+"/servlet/Login";; //在浏览器中不弹出框 
						return;
					}
					var userInfo = $.getStorage("userInfo"); 
					if($.string.isNotEmpty(userInfo))
					{ 
						window.top.location.href = baseDir+"/servlet/Main";; //在浏览器中不弹出框 
						return;
					}  
				} 
				$.tkui = {};
				// 初始化js和css
				var jsAndCss = [];
				jsAndCss.push("frameService");
				jsAndCss.push("jquery-migrate"); 
				jsAndCss.push("radiobox");
				jsAndCss.push("checkbox");
				jsAndCss.push("select");
				jsAndCss.push("form"); 
				jsAndCss.push("upload"); 
				jsAndCss.push("datagrid");
				jsAndCss.push("tree"); 
				jsAndCss.push("ueditor");
				jsAndCss.push("editor");
				jsAndCss.push("tab");
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
		"frameService" : "bootstrap/plugins/frame/scripts/service/frameService",
		"jquery-migrate" : "bootstrap/jquery/jquery-migrate-1-2-1",
		"radiobox" : "bootstrap/plugins/frame/scripts/radiobox",
		"checkbox" : "bootstrap/plugins/frame/scripts/checkbox", 
		"select" : "bootstrap/plugins/frame/scripts/select",
		"form" : "bootstrap/plugins/frame/scripts/form",
		"upload" : "bootstrap/plugins/frame/scripts/upload", 
		"datagrid" : "bootstrap/plugins/frame/scripts/datagrid",
		"tree" : "bootstrap/plugins/frame/scripts/tree",
		"ewebeditor" : "bootstrap/plugins/editor/ewebeditor/ewebeditor",
		"editor" : "bootstrap/plugins/frame/scripts/editor",
		"uewebeditor" : "bootstrap/plugins/ueditor/ueditor.all.min",
		"ueditor" : "bootstrap/plugins/frame/scripts/ueditor",
		"tab" : "bootstrap/plugins/frame/scripts/tab",
		"smUtil" : "bootstrap/plugins/sm/scripts/smUtil"
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