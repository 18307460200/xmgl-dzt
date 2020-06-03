<TK:Page>
<TK:Splitter allowResize="false">
 <TK:group showCollapseButton="false" size="0" visible="false">
    </TK:group> 
    <TK:group showCollapseButton="true" >
	    <TK:DataGrid id="datagrid1" eventNo="e_query_account" inputs="user_id:'$user_id$'" pageSize="20" isPage="true"  >
	    	<TK:Toolbar>
		    	<TK:Group style="width:100%;">
					<TK:Button displayName="刷新" iconCls="icon-reload" plain="true" >
                        <TK:Property function="refresh" />
					</TK:Button>
				</TK:Group>
				<TK:Group style="white-space:nowrap;">
					<TK:Textbox emptyText="登录账号：" name="account"  style="width:200px;"/>
					<TK:Button displayName="查询" iconCls="icon-redo">
						<TK:Property function="query" isSelect="false" isMulSelect="false" inputs="" />
					</TK:Button>
				</TK:Group>
		    </TK:Toolbar>
		    <TK:Fields>
		    	<TK:Field type="checkcolumn" displayName="序号"/>
		    	<TK:Field field="type" displayName="类型" width="120"/>
		    	<TK:Field field="account" displayName="账号" width="120"/>
			</TK:Fields>
		</TK:DataGrid>
		  </TK:group>	        
        </TK:Splitter>
</TK:Page>
