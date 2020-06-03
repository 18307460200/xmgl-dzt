define("framework/scripts/thinkive_xmgl/product_affiliation",function(require, exports, module){
	require("/framework/css/thinkive_xmgl/common/style.css");
	var exp = {};	
	debugger;
	function init() {
		$("#mainView").load("/framework/views/thinkive_xmgl/product_affiliation.html",function(){
			var queryname_event_no="e_query_product_affiliation";  //事件号
			var product_affiliation_id=getQueryString("product_affiliation_id");
			var resource = getQueryString("option");
			//参数
			var queryParam={"product_affiliation_id":product_affiliation_id};  
			//回调函数
			var queryName = function(resultVo){
				if(resultVo.getErrorNo()== "0"){   
					var results = resultVo.obj.results.results;
					initInformation4(results);
				}else{
					alert(resultVo.getErrorInfo());
				}
			}
			FrameService.getInstance().processSubmit(queryName,queryname_event_no,queryParam, null,null,null,null);
			
		});
	};
	
	//初始化产品归属信息
	function initInformation4 (results){
		var html="<tr>";
		var html2="<tr>";
		if(results.length > 0){
			for (var i = 0; i < results.length; i++) {
				html+='<th align="center">'+results[i].name+'</th>';
				html2+='<td align="center">'+results[i].name_value+'</td>';
			}
			html+="</tr>";
			html2+="</tr>";
			$("#table_content").append(html+html2);
		}
	}
	
	/** 获取url参数值 */
	function getQueryString(name)
	{
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if(r!=null){
			return unescape(r[2]); 
		}
		return "";
	}
	
	function bindPageEvent() {
		
	}
	
	function  destroy ()
	{
		 
	}
	exp.init = init;
	exp.bindPageEvent = bindPageEvent;
	exp.destroy = destroy;
	//暴露对外的接口
	module.exports = exp;
});