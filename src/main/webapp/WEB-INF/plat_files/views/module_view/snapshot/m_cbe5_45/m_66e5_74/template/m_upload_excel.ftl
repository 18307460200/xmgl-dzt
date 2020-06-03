<TK:Page >
      <TK:Script>
    	<![CDATA[
    		function queryDetail(){
				debugger;
				var param = mini.getParams();
				var _version_id = param._version_id;
				var _catalog_id = param._catalog_id;
				var _module_id  =  param._module_id;
				var _version_type =  param._version_type;				
				var htmlurl = "/framework/views/thinkive_xmgl/projectExcelUpload.html?_version_id="+_version_id+"&_catalog_id="+_catalog_id+"&_module_id="+_module_id+"&_version_type="+_version_type;
				var url = getLocationURL()+htmlurl;
				window.location.href=url;		
			}
			function getLocationURL(){
				return window.location.protocol+"//"+window.location.host;
			}
			queryDetail();

		]]>
	</TK:Script>
     
 </TK:Page>