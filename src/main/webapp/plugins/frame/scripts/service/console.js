//让IE支持console
define("plugins/frame/scripts/service/console",function(require, exports, module) {
	var console = window.console = window.console || (function(){ 
		var c = {}; c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile 
		= c.clear = c.exception = c.trace = c.assert = function(){}; 
		return c; 
	})();
	module.exports = console;
});