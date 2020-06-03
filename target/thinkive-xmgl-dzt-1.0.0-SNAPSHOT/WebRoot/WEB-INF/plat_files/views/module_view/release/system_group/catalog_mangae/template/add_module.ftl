 <TK:Page>
        <!--Splitter-->
        <TK:Splitter>
            <TK:group size="200"  showCollapseButton="true">
                <!--Tree-->
            <TK:Tree id="tree1" dataField="data" style="height:92%"  eventNo="e_tree_module"  inputs="id:'$id$'"
                showTreeIcon="true" resultAsTree="false" expandOnLoad="true" loadDataCallBackFunc="loadDataCallBackFunc">
                  <TK:Property type="left" function="onNodeSelect" />  
            <TK:Toolbar>
	          <TK:Group style="white-space:nowrap;">
	            <TK:TextBox id="typeKey" name="typeKey" emptyText="请输入模块类型名称" style="width:70%;"/>   
	          	<TK:Button displayName="查询" iconCls="icon-redo">
	            	<TK:Property function="query" isSelect="false" isMulSelect="false" inputs="typeKey:''" />
	            </TK:Button>
	          </TK:Group>
          </TK:Toolbar>
            </TK:Tree> 
            </TK:group>
            <TK:group showCollapseButton="true"> 
            <TK:DataGrid  id="datagrid1"  onrowdblclick="onRowDblClick" isLoad="false" pageSize="20"  eventNo="e_query_module" isPage="true">
                <TK:Toolbar  id="toolbar" >
	              <TK:Group style="width:100%;">
	              <TK:Button displayName="选择模块" iconCls="icon-add" plain="true">
	                <TK:Property function="addModule" />
	              </TK:Button>
	               <TK:Button displayName="导入模块" iconCls="icon-upload" plain="true">
	              	 <TK:Property function="upload" bcode="module_import" inputs="" url="${ctxPath}/servlet/Import" width="600" height="400"/>
	              </TK:Button>
	            </TK:Group>
	            <TK:Group style="white-space:nowrap;">
	              <TK:TextBox name="key" id="key" emptyText="请输入名称" style="width:150px;"/>   
	              <TK:Button displayName="查询" iconCls="icon-redo">
	                <TK:Property function="query" paramFunc="getModuleParam" />
	              </TK:Button>
	            </TK:Group>
            </TK:Toolbar>
                <TK:Fields>
                    <TK:Field type="checkcolumn" displayName="序号"/>
                    <TK:Field field="name" displayName="模块名称" width="110"/>
                    <TK:Field field="module_no" displayName="模块编号" width="110"/> 
                    <TK:Field field="description" displayName="模块描述" width="110"/>
                </TK:Fields>
        </TK:DataGrid>
        
            </TK:group>        
        </TK:Splitter>
 <TK:Script>
  <![CDATA[
	mini.parse();
	var grid = mini.get("datagrid1");
	var tree = mini.get("tree1");
    //加载完树之后执行的回调方法
    function loadDataCallBackFunc(e) {
       	var firstNode= tree.getNode(0);
       	tree.selectNode(firstNode);
       	if(firstNode){
           	$.tkui["datagrid1"].loadData({module_type_id:firstNode.id });
        }
    }   
    //单击栏目树出来右侧数据列表界面
	function onNodeSelect() 
	{
		var node = tree.getSelectedNode(); 
        if(node.childrennum == 0)
        {
        	var el=mini.get("toolbar").getEl();
		    if(el.style.display=="none"){
		  		el.style.display="block";
		    }
    		grid.setVisible(true);
    		$("#bakImg").hide();
          	$.tkui["datagrid1"].loadData({module_type_id:node.id });
    	}else{
     		//mini.alert("请选择该类型下具体的模块进行操作！", "提醒");
    	}
	}
    function getModuleParam(){
        var key = mini.get("key").getValue();
        var node = tree.getSelectedNode();
        var param = new Object();
        param.key =key ;
        param.module_type_id=node.id ;
        return param;
    }
          
 	function onRowDblClick(e) {
 		onOk();
 	}
     
  	function addModule(){
    	var row = grid.getSelected();
	    if(row) 
	    {
	       onOk();
	    }else{
	       mini.alert("请选择一条记录!", "提醒");
	    }
  	}
    function onOk() {
       var frameService = FrameService.getInstance();
       frameService.closeWindow("ok");
    }
      
    function GetData() { 
        var row = grid.getSelected(); 
        var node = tree.getSelectedNode();  
        row.module_type_name=node.name;
        return row;
    }
]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
