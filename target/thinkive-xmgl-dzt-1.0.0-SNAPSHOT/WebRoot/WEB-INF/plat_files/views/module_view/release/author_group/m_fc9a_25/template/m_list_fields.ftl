<TK:Page>
<TK:Splitter allowResize="false">
 <TK:group showCollapseButton="false" size="0" visible="false">
            </TK:group> 
            <TK:group showCollapseButton="true" >
	    <TK:DataGrid id="datagrid1" eventNo="e_query_fields"  pageSize="20" isPage="true"  >
	    	<TK:Toolbar>
		    	<TK:Group style="width:100%;">
					<TK:Button displayName="增加" iconCls="icon-add">
						<TK:Property function="popWindow" templateNo="m_add_fields" title="添加数据权限要素"  width="500" height="350" />
					</TK:Button>
					<TK:Button displayName="编辑" iconCls="icon-edit" >
						<TK:Property function="popWindow" isSelect="true" templateNo="m_edit_fields" title="修改数据权限要素" inputs="data_id:'$data_id$'"  width="500" height="380" />
					</TK:Button>
					<TK:Button displayName="删除" iconCls="icon-remove">
						<TK:Property function="submit" isMulSelect="true" eventNo="e_delete_fields" inputs="data_id:'$data_id$'" isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
					</TK:Button> 
					<TK:Button displayName="刷新" iconCls="icon-reload" plain="true" >
                        <TK:Property function="refresh" />
					</TK:Button>
				</TK:Group>
				<TK:Group style="white-space:nowrap;">
					<TK:Textbox emptyText="权限要素名称：" name="key"  style="width:200px;"/>
					<TK:Button displayName="查询" iconCls="icon-redo">
						<TK:Property function="query" isSelect="false" isMulSelect="false" inputs="key:'$key$'" />
					</TK:Button>
				</TK:Group>
		    </TK:Toolbar>
		    <TK:Fields>
		    	<TK:Field type="checkcolumn" displayName="序号"/>
				<TK:Field field="data_name" displayName="权限要素名称" width="80"/>
				<TK:Field field="data_type" displayName="英文标识" width="80"/>
				<TK:Field field="field_flag" displayName="数据权限字段标识" width="80"/>
				<TK:Field field="data_source_impl" displayName="数据权限实现类" width="200"/>
				<TK:Field field="status" displayName="是否启用" width="30" dataType="select" format="fields_status"/>
				<TK:Field field="field_type" displayName="数据权限类型" width="30" dataType="select" format="field_type"/>
			</TK:Fields>
		</TK:DataGrid>
		  </TK:group>
		        
        </TK:Splitter>
</TK:Page>
