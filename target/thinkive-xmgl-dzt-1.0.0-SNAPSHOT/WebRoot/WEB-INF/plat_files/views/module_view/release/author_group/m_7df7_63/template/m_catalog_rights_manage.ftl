<TK:Page> 
<style type="text/css">
.mini-panel-body
{
    position:relative;
    text-align:left;
  	padding:0px;
    width:auto;
    overflow:auto;
    clear:both;
}
</style> 
	<TK:Splitter>
		<TK:Group  size="20%" showCollapseButton="true">
			<TK:Tabs id="leftTabs" activeIndex="1" style="width:100%;height:100%;" bodyStyle="padding:0;border:0;"  onactivechanged="changeLeftTabs">
				<TK:Group title="用户" name="user" showCloseButton="false">	
                 	<TK:Tree id="userTree"  eventNo="e_query_user_tree" style="width:100%;padding:5px;height:95%"  onDrawnode="changeIcons" inputs="id:'',nameRoute:''" >
    					<TK:Property type="left" function="userTreeLoadFunc" />
					</TK:Tree>
				</TK:Group>
				<TK:Group title="角色" name="role" showCloseButton="false">  
					<TK:Tree id="roleTree"  eventNo="e_query_role_sort_tree" style="width:100%;padding:5px;height:95%" onDrawnode="ondrawnode" loadDataCallBackFunc="loadDataCallBackFunc" expandOnLoad="true">
    					<TK:Property type="left" function="roleTreeLoadFunc" />
					</TK:Tree>
				</TK:Group>
				<TK:Group title="组织" name="org" showCloseButton="false">
					<TK:Tree id="orgTree"  eventNo="e_org_tree" style="width:100%;padding:5px;height:95%"  onDrawnode="changeIcons"  inputs="id:'',nameRoute:''">
    					<TK:Property type="left" function="orgTreeLoadFunc" />
    					 <TK:TreeMenus id="rights_copy" onbeforeopen="onBeforeOpen">
				               <TK:TreeMenu displayName="权限复制" name="rightscopy" iconCls="icon-add">
				                    <TK:Property type="right" function="popWindow" isRefreshRoot="true"  templateNo="m_rights_copy" paramFunc="rightsCopy" title="岗位权限复制" width="350" height="450" refreshMode="1 "/>
				               </TK:TreeMenu>
				          </TK:TreeMenus>
					</TK:Tree>
				</TK:Group>
			</TK:Tabs>
		</TK:Group>
		<TK:Group showCollapseButton="true">
			<TK:Tabs id="rightsTabs"  bodyStyle="padding:0;border:0;" activeIndex="1" callBackFunc="changeRightTab">
				<TK:Group title="隶属角色" name="roleRight" showCloseButton="false" visible="false">
				</TK:Group>
				<TK:Group title="功能权限" name="funcRight" showCloseButton="false">
						<div class="mini-panel" id="panel2" style="height:98%;width:99.5%;margin-top:0.5%;margin-left:0.5%;" >	                         	
						    <TK:Tree id="catalogRightsTree"  resultAsTree="true" style="height:92%;width:100%;" autoCheckParent="true" eventNo="e_tree_catalog" paramFunc="roleTreeParam"  expandOnLoad="0" inputs="id:''"  showCheckBox = "true">
								<TK:Toolbar>
								  <TK:Group >
									<TK:Button displayName="更新权限" iconCls="icon-edit">
										<TK:Property function="submit" eventNo="e_add_catalog_rights"  filterFunc="conditionFilter" paramFunc="uploadRights" refreshMode="0" isReLoad="true"/>
									</TK:Button>
								  </TK:Group>
								</TK:Toolbar>
                          </TK:Tree>
						</div>	
				</TK:Group>
				<TK:Group title="数据权限" name="dataRight" showCloseButton="false">
					<div class="mini-panel" id="panel3" style="height:99%;width:99.5%;margin-top:0.5%;margin-left:0.5%;" >	
						<TK:Tree id="dataRightsTree" resultAsTree="true" style="height:92%;width:100%;" autoCheckParent="false" eventNo="e_data_right_tree" loadDataCallBackFunc="dataTreeCallBack" paramFunc="roleDataRightsParam"   expandOnLoad="0" inputs="id:''"  showCheckBox = "true">
							<TK:Toolbar>
								<TK:Group>
									<TK:Button displayName="更新权限" iconCls="icon-edit">
										<TK:Property function="submit" eventNo="e_add_data_rights" filterFunc="conditionFilter"  paramFunc="uploadDataRights" refreshMode="0" isReLoad="true"/>
									</TK:Button>
								</TK:Group>
								<TK:Group>
                                	<TK:Form>
										<TK:ComboBox name="right_type" required="true" isAddTd="false" emptyText="请选择权限要素" value="branch_data" onvaluechanged="dataTypeChanged" style="width:30%;float:right;" >
											 <TK:Property dataType="select" format="data_type" />
										</TK:ComboBox>
                                    </TK:Form>
								</TK:Group>
							</TK:Toolbar>
						</TK:Tree>
					</div>	
				</TK:Group>
			</TK:Tabs>
		</TK:Group>
	</TK:Splitter>
  <TK:Script>
	var sourceType=0,sourceId;
	var flag=false;
	var rightIndex=1;//右侧tab页标
	var title='按角色：';
	//左侧tab切换事件
	function changeLeftTabs()
	{
		var tab = mini.get("leftTabs").getActiveTab();
		
		if(tab.name=='user')
		{
			sourceType=2;				
		}
		else if(tab.name=='role')
		{
			sourceType=0;
		}
		else
		{
			sourceType=1;
		}
		title="按"+tab.title+":";
	}
	
	function onBeforeOpen(e){
		var menu = e.sender;
        var tree = mini.get("orgTree");
        var node = tree.getSelectedNode(); 
        var rightscopy = mini.getbyName("rightscopy", menu);
        if(node.type=='D'){ 
        	rightscopy.hide();
        	document.getElementById('rights_copy').style.display ="none";
        	//$("#rights_copy").style.display = "none";
        	$("#rights_copy").hide();
        }else if(node.type=='P'){
        	rightscopy.show();
        }
        mini.parse();
	}
	
	 //右侧tab切换事件
	function changeRightTab()
	{
		var tab = mini.get("rightsTabs").getActiveTab(); 
		if(tab.name=='roleRight')
		{
			rightIndex=0;	
		}
		else if(tab.name=='funcRight')
		{
			rightIndex=1;	
			//$.tkui['catalogRightsTree'].loadData();
		}
		else
		{
			rightIndex=2;
			//$.tkui['dataRightsTree'].loadData();
		} 
		if(sourceType == "2")
		{
			userTreeLoadFunc();
		}
		else if(sourceType == "0")
		{
			roleTreeLoadFunc();
		}
		else if(sourceType == "1")
		{
			orgTreeLoadFunc();
		}
	}
	//左侧树加载后回调函数
	function loadDataCallBackFunc()
	{
		var tree = mini.get("roleTree");//默认是角色树
		if(sourceType==1)
		{//机构	
			tree = mini.get("orgTree");			
		}
		else if(sourceType==2)
		{//用户		
			tree = mini.get("userTree");
		}
	}
	//权限复制获取参数
	function rightsCopy(){
		var tree = mini.get("orgTree");
        var node = tree.getSelectedNode();  
        var source_id = node.id;
        return {'source_id':source_id,'id':''};
	}
	//栏目权限提交获取的参数
  	function uploadRights()
  	{
  		var tree = mini.get("catalogRightsTree");
  		var rightsData = tree.getValue(true);	 
  		return {"rightsData":rightsData,'source_id':sourceId,'source_type':sourceType};
  	}
  	//数据权限查询获取的参数
  	function roleDataRightsParam(){ 
  		var dataType = mini.getbyName("right_type").getValue(); 
  		return {'source_id':sourceId,'source_type':sourceType,'data_type':dataType};
  	}
  	
  	//数据权限提交获取的参数
	function uploadDataRights()
	{ 
		var tree = mini.get("dataRightsTree");
  		var rightsData = tree.getValue(false); 
  		var dataType = mini.getbyName("right_type").getValue();  
  		return {"rightsData":rightsData,'source_id':sourceId,'source_type':sourceType,'data_type':dataType};
	}
	//角色--功能权限入参
  	function roleTreeParam()
  	{
  		return {'source_id':sourceId,'source_type':sourceType};
  	}
	
	//角色权限树左键点击事件
  	function roleTreeLoadFunc()
  	{
  		var node = mini.get("roleTree").getSelectedNode();
        if(node){
		   sourceId = node.id;
		   flag=(node.type=='P')?true:false;
		   if(flag)
			{
				if(rightIndex==1)
				{
					mini.get("panel2").setTitle(title+node.name);
					$.tkui['catalogRightsTree'].loadData();
				}						
				else if(rightIndex==2)
				{
					mini.get("panel3").setTitle(title+node.name);
					$.tkui['dataRightsTree'].loadData();
				}	
			}				
        }
  	}
	//用户权限树左键点击事件
	function userTreeLoadFunc()
	{
		var node = mini.get("userTree").getSelectedNode();
        if(node){
			sourceId = node.id;
			flag=(node.type=='P')?true:false;
			if(flag)
			{
				if(rightIndex==1)
				{
					mini.get("panel2").setTitle(title+node.nameRoute);
					$.tkui['catalogRightsTree'].loadData();
				}						
				else if(rightIndex==2)
				{
					mini.get("panel3").setTitle(title+node.nameRoute);
					$.tkui['dataRightsTree'].loadData();
				}
			}				
        }		
	}
	//组织权限树左键点击事件
	function orgTreeLoadFunc()
	{
		var node = mini.get("orgTree").getSelectedNode();
        if(node){
			sourceId = node.id;
			flag=(node.type=='P')?true:false;
			if(flag)
			{
				if(rightIndex==1)
				{
					mini.get("panel2").setTitle(title+node.nameRoute);
					$.tkui['catalogRightsTree'].loadData();
				}						
				else if(rightIndex==2)
				{
					mini.get("panel3").setTitle(title+node.nameRoute);
					$.tkui['dataRightsTree'].loadData();
				}
			}			
        }	
	}
    function dataTreeCallBack()
    {
    	var dataTree = mini.get('dataRightsTree');
    	var firstNode = dataTree.getNode(0);
    	if(firstNode)
    		dataTree.expandNode(firstNode);
    	
    }

    	//权限要素更改
	function dataTypeChanged(e)
	{
		$.tkui['dataRightsTree'].loadData();
	}
   
    function conditionFilter()
    {
    	var tree = mini.get("roleTree");//默认是角色树
    	var mesg='请选择角色!';
		if(sourceType==1)
		{//机构	
			tree = mini.get("orgTree");		
    		mesg='请选择岗位!';
		}
		else if(sourceType==2)
		{//用户		
			tree = mini.get("userTree");
    		mesg='请选择用户!';
		}
    	var node = tree.getSelectedNode();
    	if($.string.isEmpty(node) || node.type=='D')
    	{
    		mini.alert(mesg,"温馨提示");
    		return false;
    	}
    	else
    		return true;
    }
    //绘制图标
    function changeIcons(e){
        var node = e.node;
        var type = node.type; 
        if(type == "D"){
            e.iconCls = "icon-node";
        }else if(type == "P"){
        	e.iconCls = "icon-user";
        }else{
        	e.iconCls = "icon-folder";
        }
    }
    
    //绘制图标
    function ondrawnode(e){
        var node = e.node;
        var type = node.type; 
        if(type == "P"){
        	e.iconCls = "icon-find";
        }
    }
  </TK:Script>
</TK:Page>
