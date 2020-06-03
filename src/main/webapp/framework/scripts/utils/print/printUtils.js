/**
 * 打印
 */
define(function(require, exports, module){
	require("jquery");
	require("/framework/scripts/utils/print/jquery.migrate.min");
	require("/framework/scripts/utils/print/jquery.jqprint");
	
	$.fn.extend({
		print:function(){
			$(this).jqprint();
		}
	});
});