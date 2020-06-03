<TK:Page>
        <!--Splitter-->
        <TK:Splitter>
        <TK:group size="220" showCollapseButton="true">
        <!--Tree-->  
          <TK:Tree id="tree1" eventNo="e_query_orgtree" ondrawnode="changeIcons"  style="width:100%;height:90%;" onnodeclick="onNodeSelect" inputs="id:''">
          <TK:Toolbar>
	          <TK:Group style="white-space:nowrap;">
            	<TK:Button displayName="添加组织机构" iconCls="icon-add">
                    <TK:Property function="popWindow" templateNo="add_org" title="添加组织机构" refreshMode="0"   width="400" height="250" />
               </TK:Button>
	          </TK:Group>
	        </TK:Toolbar>
	          <TK:TreeMenus onbeforeopen="onBeforeOpen">
	               <TK:TreeMenu displayName="添加组织机构" name="addOrg" iconCls="icon-add">
	                    <TK:Property type="right" function="popWindow" isRefreshRoot="true"  templateNo="add_org" title="添加组织机构" refreshMode="1"   width="400" height="250" paramFunc="getAddOrgParam"/>
	               </TK:TreeMenu>
	               <TK:TreeMenu displayName="增加岗位" name="addPost" iconCls="icon-add">
	                    <TK:Property type="right" function="popWindow" isRefreshRoot="true"  templateNo="add_post" title="添加岗位" refreshMode="1"   width="800" height="700" paramFunc="getAddPostParam" />
	               </TK:TreeMenu>
	              <TK:TreeMenu displayName="修改组织机构" name="editOrg" iconCls="icon-edit">
	                    <TK:Property type="right" function="popWindow" isRefreshRoot="true"  templateNo="edit_org" title="修改组织机构"  refreshMode="2"  width="350" height="280" inputs="id:''" />
	              </TK:TreeMenu>
	               <TK:TreeMenu displayName="移动组织机构" name="moveOrg" iconCls="icon-edit">
	                    <TK:Property type="right" function="popWindow" isRefreshRoot="true"  templateNo="m_move_org" title="移动组织机构"  refreshMode="0"  width="350" height="500" inputs="id:''" />
	              </TK:TreeMenu>
	              <TK:TreeMenu displayName="删除" name="deleteOrg" iconCls="icon-remove">
	                    <TK:Property type="right" function="delete" eventNo="e_delete_org" title="删除" inputs="id:'',type:'',pid:'',post_id:''"  isAlert="true" alertMsg="是否删除？" />
	              </TK:TreeMenu>
	               <TK:TreeMenu displayName="刷新" iconCls="icon-reload">
	                    <TK:Property type="right" function="refresh"  isReLoad="true"/>
	              </TK:TreeMenu>
	              <TK:TreeMenu displayName="导入组织机构信息" iconCls="icon-upload">
	                    <TK:Property function="popWindow" templateNo="m_import_org" title="导入组织机构信息" width="400" height="200" />
	              </TK:TreeMenu> 
	          </TK:TreeMenus> 
          </TK:Tree>
      </TK:group>

    <TK:group showCollapseButton="true" style="border:0px;">
        <TK:Tabs id="mainTabs" activeIndex="0" style="height:100%;" plain="false">
            <TK:Group title="首页" id="tabtitle">
                <p style="text-align:center;padding-top:80px;">
                  <img src="${ctxPath}/framework/image/pic17.jpg"/>
                </p>
            </TK:Group>
        </TK:Tabs>
    </TK:group> 

    </TK:Splitter>

  <TK:Script>
  <![CDATA[
    mini.parse();
    var tree = mini.get("tree1");

    //单击栏目树加载右侧数据列表界面
    function onNodeSelect(e) 
    {
    	var node = e.node;
    	var param = new Object();	 
  		if(node.type=='D'){
  			param.post_id = "-1";
  			param.dept_id = "-1";
       		//e.isLeaf = false;
       		var frameService = FrameService.getInstance();
            frameService.loadWindow("mainTabs", "用户列表", "user_list", param,"true","");
  		}else{
  			param.post_id = node.post_id;
  			param.dept_id = node.pid;
  			var frameService = FrameService.getInstance();
            frameService.loadWindow("mainTabs", "用户列表", "user_list", param,"true",""); 
  		}
    }
  
    //添加岗位获取参数
    function getAddPostParam()
    {
	      var node = tree.getSelectedNode();
	      var param = new Object();
	      if(node.type=='P')
	      	param.id=node.post_id;
	      else
	      	param.id=node.id;
	      return param;
    }
  
    function getAddOrgParam(){
       var node = tree.getSelectedNode();
       var param = new Object();
       param.dept_id = node.id;
       return param;
    }

    function changeIcons(e){
        var node = e.node;
        var type = node.type;
        if(type == "P"){
            e.iconCls = "icon-user";
        }
    }
    
    function onBeforeOpen(e){
        var menu = e.sender;
        var tree = mini.get("tree1");
        var node = tree.getSelectedNode();
        var addOrg = mini.getbyName("addOrg", menu);
        var addPost = mini.getbyName("addPost", menu);
        var moveOrg = mini.getbyName("moveOrg", menu);
        var editOrg = mini.getbyName("editOrg", menu);
        var deleteOrg = mini.getbyName("deleteOrg", menu);
        addOrg.show();
        addPost.show();
        editOrg.show();
        moveOrg.hide();
        debugger;
        if(node.type=='P'){
        	addOrg.hide();
          	addPost.hide();
          	editOrg.hide();
          	moveOrg.hide();
        }
        
        if(node.type=='D' && node.pidchird =='0'){
        	moveOrg.show();
        }
    }
     ]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
