<TK:Page>
   <TK:DataGrid id="datagrid1" eventNo="e_query_alltemplateinfo" idField="module_id" pageSize="20" inputs="module_id:'$module_id$'">
		
		<TK:Toolbar>   
                   <TK:Group style="width:100%;">  
                  <TK:Hidden name="id">
		 	<TK:Property dataType="url" format="module_id"/>
		  </TK:Hidden> 
			<TK:Button displayName="新增" iconCls="icon-add" plain="true" >
                                 <TK:Property function="popWindow" templateNo="m_add_template" title="新增模板"  inputs="module_id:'$module_id$'" isMax="true"/>
			</TK:Button>
			<TK:Button displayName="编辑" iconCls="icon-edit" plain="true" >
                                  <TK:Property function="popWindow" isSelect="true" templateNo="m_edite_template" title="修改模板" inputs="template_id:'',module_id:''"   isMax="true"/>
			</TK:Button>
			<TK:Button displayName="删除" iconCls="icon-remove" plain="true" >
                               <TK:Property function="submit" isMulSelect="true" eventNo="e_delete_template" inputs="template_id:''" isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
			</TK:Button>           
			<TK:Button displayName="刷新" iconCls="icon-reload" plain="true">
                                 <TK:Property function="refresh"  isReLoad="true"/>
			</TK:Button>
               </TK:Group>	
		</TK:Toolbar>
		<TK:Fields>
			<TK:Field type="checkcolumn" allowSort="false"></TK:Field>
			<TK:Field field="template_no" displayName="模板编号" width="120"/>
			<TK:Field field="template_name" displayName="模板名称" width="120"/>
			<TK:Field field="template_type" displayName="模板类型" dataType="select" format="template_type" align="center" width="120"/>
			<TK:Field field="is_index" displayName="是否首页模板" headerAlign="center" dataType="select" format="is_index" align="center" width="120"/>
                        <TK:Field displayName="操作">
					<TK:Property function="link" url="${ctxPath}/servlet/ModuleView" displayName="预览"  inputs="_module_id:'$module_id$',_version_type:'0',_template_no:'$template_no$',_catalog_id:'$_catalog_id$'" />
				</TK:Field>
		</TK:Fields>
	</TK:DataGrid>
</TK:Page>                                                                                                                                                                                                            
