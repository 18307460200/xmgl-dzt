/**
 * 程序入口配置读取
 * 项目开发时需要的自定义配置
 * 另外：configuration为系统配置模块或者配置模板
 * 这里可以扩展，支持多个系统共用一个项目：
 * 思路：在最开始的地方做一个sysCode的获取，然后在这个模块初始化时赋不同系统的configuration配置模块的引用，
 * 当然还要做修改的地方，比如地址栏hash处理，需要增加sysCode（涉及到的模块main和appUtils）
 */
define(function(require, exports, module) {
	var configuration = {
	   /**
		* 项目中需要调用到的常量、变量这里配置
		* 调用方式，通过require("gconfig").global.*来调用
		*/
		"global": {
			"pwd_is_encrypt": "1"  //密码是否加密传输 0:或空不加密 1:加密
		}
	};
	//暴露对外的接口
	module.exports = window.configuration = configuration;
});