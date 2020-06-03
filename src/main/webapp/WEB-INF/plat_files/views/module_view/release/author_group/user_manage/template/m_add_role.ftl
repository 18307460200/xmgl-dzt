 <TK:Page> 
      <TK:DataGrid  id="datagrid1"  onrowdblclick="onRowDblClick" pageSize="20"  eventNo="e_query_role" isPage="true" loadDataCallBackFunc="selectDatagrid">
        <TK:Toolbar  id="toolbar" >
      <TK:Group style="width:100%;">
      <TK:Button displayName="选择角色" iconCls="icon-add" plain="true">
        <TK:Property function="addRole" />
      </TK:Button>
    </TK:Group>
    <TK:Group style="white-space:nowrap;">
      <TK:TextBox name="key" id="key" emptyText="请输入名称" style="width:150px;"/>   
      <TK:Button displayName="查询" iconCls="icon-redo">
        <TK:Property function="query"  />
      </TK:Button>
    </TK:Group>
    </TK:Toolbar>
        <TK:Fields>
            <TK:Field type="checkcolumn" displayName="序号"/>
            <TK:Field field="role_no" displayName="角色英文名" width="110"/>
            <TK:Field field="name" displayName="角色名称" width="110"/>
        </TK:Fields>
    </TK:DataGrid>   
 <TK:Script>
  <![CDATA[
        mini.parse();
        var grid = mini.get("datagrid1");
        var tree = mini.get("tree1");
        
        function selectDatagrid()
        {
	         var params = mini.getParams();
	         var role_id = params.role_id;
	         if(typeof(role_id)!="undefined"){
		         var rows=grid.findRows(function(row){
		         	var roles = role_id.split(",");
		           	for(var i=0;i<roles.length;i++){
						if(row.role_id==roles[i]){
				      		return true;
				   		}
				   	}
				 })
			 }
			grid.selects(rows)
        }
        
        
        function selectNote(e) 
        {
      		var tree = mini.get("tree1");
       		var firstNode= tree.getNode(0);
            tree.selectNode(firstNode);
        	if(firstNode){
               $.tkui["datagrid1"].loadData({sort_id:firstNode.sort_id });
        	}
    	}  
        function onRowDblClick(e) 
        {
            onOk();
        }
     
      function addRole()
      {
        var rows = grid.getSelecteds();
        if (rows.length > 0) 
        {
        	onOk();
        }else{
        	mini.alert("请选择一条记录!", "提醒");
        }
      }
        function onOk() 
        {
           var frameService = FrameService.getInstance();
           frameService.closeWindow("ok");
        }
      
        function getData() 
        {
            var rows = grid.getSelecteds();
            return rows;
        }
       ]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
