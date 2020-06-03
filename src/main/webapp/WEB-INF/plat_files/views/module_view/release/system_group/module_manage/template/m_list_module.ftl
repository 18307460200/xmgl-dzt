<TK:Page>
    <div id="layout1" class="mini-layout" style="width:100%;height:100%;">

    <div title="center" region="center" bodyStyle="overflow:hidden;" style="border:0;">
        <!--Splitter-->
        <div class="mini-splitter" style="width:100%;height:100%;">
             <div size="240" showCollapseButton="true">
              <div class="mini-fit">
                <TK:Tree id="tree1" eventNo="e_query_moudletypetree" inputs="id:'$id$'" style="width:100%;height:90%;" loadDataCallBackFunc="loadDataCallBackFunc">
                    <TK:Property type="left" function="loadFunc" input="id:'$id$'" />
                    <TK:Toolbar>
			          <TK:Group style="white-space:nowrap;">
		            	<TK:Button displayName="添加模块类型" iconCls="icon-add">
							<TK:Property function="popWindow" templateNo="m_add_module_type" title="添加模块类型" width="400" height="150" refreshMode="0"/>
						</TK:Button>
			          </TK:Group>
			        </TK:Toolbar>
		            <TK:TreeMenus>
			            <TK:TreeMenu displayName="添加模块类型" name="addOrg" iconCls="icon-add">
			              <TK:Property type="right" function="popWindow" templateNo="m_add_module_type" title="添加模块类型"  width="400" height="150" inputs="parent_id:'$id$',id:'$id$'" refreshMode="1"/>
			            </TK:TreeMenu>
			            <TK:TreeMenu displayName="修改模块类型" name="addPost" iconCls="icon-edit">
			              <TK:Property type="right" function="popWindow" templateNo="m_edite_module_type" title="修改模块类型" width="400" height="200" inputs="module_type_id:'$id$',id:'$id$'"   refreshMode="2"/>
			            </TK:TreeMenu>
			            <TK:TreeMenu displayName="删除模块" name="edit" iconCls="icon-remove">
			              <TK:Property type="right" function="delete" eventNo="e_delete_moudletype"  title="删除模块"  inputs="module_type_id:'$id$',id:'$id$'" isAlert="true" alertMsg="是否删除？"/>
			            </TK:TreeMenu>
			            <TK:TreeMenu displayName="备份模板下所有模块" name="edit" iconCls="icon-save">
			              <TK:Property type="right" function="submit" eventNo="e_back_moduletype"  title="备份模板下所有模块" inputs="id:'$id$'" isAlert="true" alertMsg="是否备份？" callbackFunc="backFunc" isAlertResultInfo="false"/>
			            </TK:TreeMenu>
			            <TK:TreeMenu displayName="备份所有模块" name="edit" iconCls="icon-save">
			              <TK:Property type="right" function="submit" eventNo="e_backup_module"  title="备份所有模块" isAlert="true" alertMsg="是否备份？" callbackFunc="backFunc" isAlertResultInfo="false"/>
			            </TK:TreeMenu>
		            </TK:TreeMenus>
	          	</TK:Tree>
            </div>
          </div>
            <div showCollapseButton="true">
               <TK:DataGrid id="datagrid1" eventNo="e_query_moudletypeinfo" pageSize="20"    isLoad="false" isPage="true" >

                   <TK:Toolbar>
                       <TK:Group style="width:100%;">
                          <TK:Hidden name="module_type_id"/>
                        <TK:Button displayName="新增" iconCls="icon-add" plain="true" >
							<TK:Property function="add_module" isReLoad="true" width="600" height="180"/>
                        </TK:Button>
                        <TK:Button displayName="编辑" iconCls="icon-edit" plain="true">
                          <TK:Property function="popWindow" isSelect="true" templateNo="m_edit_module" title="修改模块" inputs="module_type_id:'',module_id:''"  width="600" height="180"/>
                        </TK:Button>
                        <TK:Button displayName="删除" iconCls="icon-remove" plain="true" >
                            <TK:Property function="submit" isMulSelect="true" eventNo="e_delete_moudletypeinfo" inputs="module_id:''"  isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
                        </TK:Button>
                           <TK:Button displayName="刷新" iconCls="icon-reload" plain="true">
                            <TK:Property function="refresh"/>
                           </TK:Button>
                           <TK:Button displayName="导出模块" iconCls="icon-save" plain="true">
                          	<TK:Property function="link" isSign="true" isMulSelect="true" url="${ctxPath}/servlet/ModuleEvent" eventNo="e_exp_moudule" inputs="module_id:''" isEncodeURI="false" isAlert="true" alertMsg="是否确认导出?" isReLoad="true"/>
                           </TK:Button>
                           <TK:Button displayName="导出字典" iconCls="icon-save" plain="true">
                               <TK:Property function="link" isSign="true" isMulSelect="true" url="${ctxPath}/servlet/ModuleEvent" eventNo="e_exp_module_dicts" inputs="module_id:''" isEncodeURI="false"
                                            isAlert="true" alertMsg="是否确认导出?" isReLoad="true"/>
                           </TK:Button>
                           <TK:Button displayName="导入模块" iconCls="icon-upload" plain="true">
                          	<TK:Property function="upload" bcode="module_import" inputs="" eventNo="e_imp_moudule" width="600" height="400"/>
                           </TK:Button>
                           <TK:Button displayName="发布版本" iconCls="icon-edit" plain="true">
                          	<TK:Property function="popWindow"  templateNo="m_publish_module" isMulSelect="true" title="发布模块" inputs="module_id:''" isAlert="true" alertMsg="确定发布选中模块？" width="600" height="250"/>
                         </TK:Button>
                     </TK:Group>
                     <TK:Group style="white-space:nowrap;">
                         <TK:Textbox emptyText="模块名称：" name="name" style="width:120px;"/>
						<TK:Button displayName="查询" iconCls="icon-redo">
							<TK:Property function="query" isSelect="false" isMulSelect="false" inputs="" />
						</TK:Button>
					</TK:Group>
              </TK:Toolbar>
              <TK:Fields>
                  <TK:Field type="checkcolumn" allowSort="false"></TK:Field>
                  <TK:Field field="name" displayName="模块名称" width="120"/>
                  <TK:Field field="version" displayName="模块版本" width="120"/>
                  <TK:Field field="catalog_name" displayName="关联栏目名称" width="120"/>
                  <TK:Field field="create_date" displayName="创建时间" width="120"/>
                  <TK:Field field="modified_date" displayName="最后修改时间" width="120"/>
                  <TK:Field displayName="操作">
					<TK:Property function="popWindow" templateNo="m_list_template" title="查看模板" displayName="查看模板" inputs="module_id:'',module_no:'',_catalog_id:'$catalog_id$'" width="1000" height="600" isMax="false"/>
					<TK:Property function="link" url="${ctxPath}/servlet/ModuleView" displayName="预览"  inputs="_module_id:'$module_id$',_catalog_id:'$catalog_id$',_version_type:'0'" />
				</TK:Field>
               </TK:Fields>
               </TK:DataGrid>
        </div>
    </div>
</div>
</div>
 <TK:Script type="text/javascript">
<![CDATA[

	function loadDataCallBackFunc(e) {
       var tree = mini.get("tree1");
       var firstNode= tree.getNode(0);
       tree.selectNode(firstNode);
       if(firstNode){
           var grid = mini.get("datagrid1");
           grid.load({module_type_id:firstNode.id});
           var moduleObj = mini.getbyName("module_type_id");
           moduleObj.setValue(firstNode.id);
        }
    }
	function loadFunc(){
        var node = mini.get("tree1").getSelectedNode();
        if(node){
           var grid = mini.get("datagrid1");
           grid.load({module_type_id:node.id});
           var moduleObj = mini.getbyName("module_type_id");
           moduleObj.setValue(node.id);
        }
	}
	function add_module(){
		var node = mini.get("tree1").getSelectedNode();
        var param = new Object();
		if(node.childrennum > 0){
			mini.alert("请选择子节点添加模块！");
		}else{
			param.module_type_id = node.id;
        	var frameService = FrameService.getInstance();
        	frameService.popWindow("添加模块","m_add_module", param,"600","180",null,"",function onloadCallBack(){
        		var grid = mini.get("datagrid1");
        		param.module_type_id = node.id;
        		grid.load({module_type_id:node.id});
        	});
		}
	}
	function backFunc(e){
		var messageid = mini.alert(e.error_info,"提醒");
        setTimeout(function(){
            mini.hideMessageBox(messageid);
        }, 2000);
	}
]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
