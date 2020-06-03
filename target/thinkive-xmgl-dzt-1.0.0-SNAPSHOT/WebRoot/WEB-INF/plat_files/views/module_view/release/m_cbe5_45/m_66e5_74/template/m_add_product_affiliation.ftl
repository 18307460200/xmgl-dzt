<TK:Page>
 	<div style="height:370px">
	    <TK:Tree id="tree1" eventNo="e_tree_dept" style="height:80%" inputs="id:'$id$'"  onDrawnode="onBeforeNodeSelect" >
	        <TK:Toolbar>
	        <TK:Group style="white-space:nowrap;">
	          <TK:TextBox id="key" name="key" emptyText="请输入岗位名称" style="width:70%;"/>   
	          <TK:Button displayName="查询" iconCls="icon-redo">
	            <TK:Property function="query"  inputs="key:'$key$'" />
	          </TK:Button>
	        </TK:Group>
	      </TK:Toolbar>  
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
            var node = tree.getCheckedNodes();
            if (node) { 
               	onOk(); 
            }
        }
        function onOk() 
        {
           var frameService = FrameService.getInstance();
           frameService.closeWindow("ok");
        }
      
        function getData() 
        {
            var node = tree.getCheckedNodes(false); 
            if(node)
            {
            	return node;
            }
        }
        function onBeforeNodeSelect(e)
        {
        	var tree = e.sender;
            var node = e.node;
            if (node.type=='P') {
                //e.showRadioButton='true';
                e.showCheckBox='true';
                e.iconCls = "icon-user";
            }else{
            	e.iconCls = "icon-node";
            } 
        }
       ]]>
</TK:Script>
</TK:Page>