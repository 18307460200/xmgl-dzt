<TK:Page>
        <!--Splitter-->
        <TK:Splitter>
            <TK:group size="240" showCollapseButton="true">
                     <!--Tree-->  
          <TK:Tree id="tree1" eventNo="e_query_enumtree" ondrawnode="changeIcons"
               contextMenu="#treeMenu"  onnodeclick="onNodeSelect"  inputs="id:''" style="width:100%;height:95%;">
          <TK:Toolbar>
	          <TK:Group style="white-space:nowrap;">
	            <TK:TextBox id="typeKey" name="typeKey" emptyText="请输入类型或名称" style="width:70%;"/>   
	          	<TK:Button displayName="查询" iconCls="icon-redo">
	            	<TK:Property function="query" isSelect="false" isMulSelect="false" inputs="typeKey:''" />
	            </TK:Button>
	          </TK:Group>
          </TK:Toolbar>
            <TK:TreeMenus onbeforeopen="onBeforeOpen">
              	<TK:TreeMenu displayName="添加字典类型" name="addSort" iconCls="icon-add">
                	<TK:Property type="right" function="popWindow" isRefreshRoot="true"  refreshMode="0" templateNo="add_sort" title="添加数据字典分类"   width="350" height="250" />
              	</TK:TreeMenu>
              	<TK:TreeMenu displayName="增加数据字典" name="addType" iconCls="icon-add">
                	<TK:Property type="right" function="popWindow" isRefreshRoot="true" refreshMode="1"  templateNo="add_type" title="添加数据字典类型" inputs="id:'$id$'"  width="500" height="400" paramFunc="getAddTypeParam" />
              	</TK:TreeMenu>
             	<TK:TreeMenu displayName="修改数据字典" name="editType" iconCls="icon-edit">
                	<TK:Property type="right" function="popWindow" isRefreshRoot="true" refreshMode="2" templateNo="edit_type" title="修改数据字典类型"   width="500" height="400" inputs="id:'$id$'" />
              	</TK:TreeMenu>
              	<TK:TreeMenu displayName="删除字典分类" name="deleteSort" iconCls="icon-remove">
                	<TK:Property type="right" function="delete" eventNo="e_delete_enumsort" title="删除字典分类" inputs="id:''"  isAlert="true" alertMsg="是否删除？" />
              	</TK:TreeMenu>
              	<TK:TreeMenu displayName="删除数据字典类型" name="deletetype" iconCls="icon-remove">
                	<TK:Property type="right" function="delete" eventNo="e_delete_enumtype" title="删除数据字典类型" inputs="id:''"  isAlert="true" alertMsg="是否删除？" />
              	</TK:TreeMenu>
              	<TK:TreeMenu displayName="导出当前数据字典分类" name="exportDictType" iconCls="icon-save">
              		<TK:Property function="link" isSign="true"  url="${ctxPath}/servlet/ModuleEvent" eventNo="e_export_dict" inputs="sort_id:'$id$'"  isAlert="true" alertMsg="是否确认导出?" isReLoad="true"/>
              	</TK:TreeMenu>
              	<TK:TreeMenu displayName="导出当前数据字典" name="exportDict" iconCls="icon-save">
                	<TK:Property function="link" isSign="true"  url="${ctxPath}/servlet/ModuleEvent" eventNo="e_export_dict" inputs="id:''"  isAlert="true" alertMsg="是否确认导出?" isReLoad="true"/>
              	</TK:TreeMenu>
              	<TK:TreeMenu displayName="备份所有数据字典" name="backupDict" iconCls="icon-downgrade">
                	<TK:Property function="link" isSign="true"  url="${ctxPath}/servlet/ModuleEvent" eventNo="e_backup_dict" inputs="id:''"  isAlert="true" alertMsg="是否确认备份?" isReLoad="true"/>
              	</TK:TreeMenu> 
              	<TK:TreeMenu displayName="导入字典" name="importDict" iconCls="icon-upload" plain="true"> 
                  	<TK:Property type="right" function="popWindow" isRefreshRoot="true" refreshMode="2" templateNo="m_import_dict" title="导入数据字典"   width="500" height="400" inputs="id:'$id$',type:'$type$'" />
              	</TK:TreeMenu>   
            </TK:TreeMenus>
          </TK:Tree>
            </TK:group>
             <TK:group  showCollapseButton="true" style="border:0;">
            	<TK:Tabs id="mainTabs"  activeIndex="0" plain="false" style="width: 100%; height: 100%;">        
                     <TK:Group title="欢迎" id="tabtitle">
                       <p style="text-align:center; padding-top:80px;">
                         <img src="${ctxPath}/framework/image/pic17.jpg"/>
                       </p>
                     </TK:Group>
                  </TK:Tabs> 
            </TK:group>        
        </TK:Splitter>

  <TK:Script>
  <![CDATA[
    mini.parse();
    var sort_no;
    var grid = mini.get("datagrid1");
    var tree = mini.get("tree1");
        
	function getParam()
	{
		 var node = tree.getSelectedNode();
		 var paraMap = {};    
		 if(typeof(node)!='undefined'){
		 	paraMap["id"] = node.id;
		 }
		 return paraMap;
	 }
     //单击栏目树出来右侧数据列表界面
    function onNodeSelect(e) 
    {
		var node = e.node;
		var param = new Object();	
		param.sort_no = node.sort_no;
	    if(node.type=='T'){
            if(node.is_dynamic =="1"){
            	param.dictId = node.id;
            	var frameService = FrameService.getInstance();
            	frameService.loadWindow("mainTabs", "动态数据字典列表", "e_datagrid_dynameic", param,"true","");
            }else{
            	param.id = node.id;
            	var frameService = FrameService.getInstance();
            	frameService.loadWindow("mainTabs", "静态数据字典列表", "e_datagrid_list", param,"true","");
            }
            
	    }
    }
  
    //添加数据字典类型
    function getAddTypeParam()
    {
	      var node = tree.getSelectedNode();
	      var param = new Object();
          param.id=node.id;
          return param;
    }
  
    //模糊查询
    function getSearchParam() {
  		var param = new Object();
        param.sort_no=sort_no;
        return param;
     }
     
    function changeIcons(e){
        var node = e.node;
        var type = node.is_dynamic;
        if(type == "0"){
            e.iconCls = "icon-user";
        }else if(type == "1"){
        	e.iconCls = "icon-goto";
        }else{
        	e.iconCls = "icon-find";
        }
    }
    
    function onBeforeOpen(e){
        var menu = e.sender;
        var tree = mini.get("tree1");
        var node = tree.getSelectedNode();
        var addSort = mini.getbyName("addSort", menu);
        var addType = mini.getbyName("addType", menu);
        var editType = mini.getbyName("editType", menu);
        var deleteSort = mini.getbyName("deleteSort", menu);
        var deletetype = mini.getbyName("deletetype", menu);
        var exportDictType = mini.getbyName("exportDictType",menu);
        var exportDict = mini.getbyName("exportDict",menu);
        var backupDict = mini.getbyName("backupDict",menu);
        var importDict = mini.getbyName("importDict",menu);
        if(node.type=='S'){
	        addType.show();
	        editType.hide();
	        exportDict.hide();
	        exportDictType.show();
	        backupDict.show();
	        deletetype.hide();
	        addSort.show(); 
	        deleteSort.show();
	        importDict.show();
        }else{
	        addSort.hide();
	        deleteSort.hide();
	 		addType.hide();
	        editType.show();
	        exportDict.show();
	        exportDictType.hide();
	        backupDict.show();
	        deletetype.show();
	        importDict.show();
        }
    }
     ]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
