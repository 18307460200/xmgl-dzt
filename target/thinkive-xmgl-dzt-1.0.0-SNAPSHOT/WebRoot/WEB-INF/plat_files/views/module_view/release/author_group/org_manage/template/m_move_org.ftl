 <TK:Page>
 	<div style="height:400px">
	    <TK:Tree id="tree1" eventNo="e_tree_dept" style="height:95%" inputs="id:'$id$'" showRadioButton="true" multiSelect="false" >
	
	    </TK:Tree>
	</div>
    <TK:Form id="form2" style="width:100%;">
		 <TK:Table>
		 	<TK:Group>
		 		<td align="center">
		 			<TK:Button displayName="确定" style="width:60px;margin-right:20px;" iconCls="icon-ok">    
                         <TK:Property function="add_dept" />  
                   </TK:Button>   
   			       <TK:Button displayName="关闭"  style="width:60px;" iconCls="icon-cancel"> 
                       <TK:Property isClose="true" /> 
                  </TK:Button>
		 		</td>
		 	</TK:Group>
		</TK:Table>
	</TK:Form>
 <TK:Script>
  <![CDATA[
        mini.parse();
        var tree = mini.get("tree1"); 
        
        function add_dept() {    
        	var params = mini.getParams();
            var node = tree.getSelectedNode();
            var param = new Object();
            param.dept_id = params.id;
            param.deptId_id = node.id; 
            FrameService.getInstance().processSubmit(callFunction, "e_edit_deptorg", param,null, null,false,null);
			function callFunction(resultVo){
				 if (resultVo.getErrorNo() == 0) {
				 	var frameService = FrameService.getInstance();
           			frameService.closeWindow("ok"); 
				 } 
				 var errorInfo = resultVo.getErrorInfo();
				 if ($.string.isNotEmpty(errorInfo)) {
					 window.top.mini.alert(errorInfo);
				 }
			} 
        } 
       ]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
