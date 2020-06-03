<TK:Page>
<TK:Splitter allowResize="false">
 <TK:group showCollapseButton="false" size="0" visible="false">
            </TK:group> 
            <TK:group showCollapseButton="true" >
	    <TK:DataGrid id="datagrid1" eventNo="e_query_merchant"  pageSize="20" isPage="true"  >
	    	<TK:Toolbar>
		    	<TK:Group style="width:100%;">
					<TK:Button displayName="增加" iconCls="icon-add">
						<TK:Property function="popWindow" templateNo="m_add_merchant" title="添加商户信息"  width="600" height="450" />
					</TK:Button>
					<TK:Button displayName="编辑" iconCls="icon-edit" >
						<TK:Property function="popWindow" isSelect="true" templateNo="m_edit_merchant" title="修改商户信息" inputs="merchant__id:''"  width="650" height="500" />
					</TK:Button> 
					<TK:Button displayName="刷新" iconCls="icon-reload" plain="true" >
                        <TK:Property function="refresh" />
					</TK:Button>
				</TK:Group>
				<TK:Group style="white-space:nowrap;">
					<TK:Textbox emptyText="商户姓名：" name="merchant_name"  style="width:120px;"/>
					<TK:Textbox emptyText="商户编号：" name="merchant_no"  style="width:120px;"/> 
					<TK:Button displayName="查询" iconCls="icon-redo">
						<TK:Property function="query" isSelect="false" isMulSelect="false" inputs="" />
					</TK:Button>
				</TK:Group>
		    </TK:Toolbar>
		    <TK:Fields>
		    	<TK:Field type="checkcolumn" displayName="序号"/>
		    	<TK:Field field="merchant_name" displayName="商户名称" width="100"/>
		    	<TK:Field field="merchant_no" displayName="商户编号" width="120"/>
		    	<TK:Field field="status" displayName="状态" width="80" dataType="select" format="merchant_status"/>
		    	<TK:Field field="expiry_date" displayName="有效期" width="100"/>
		    	<TK:Field field="register_date" displayName="注册时间" width="100"/>
		    	<TK:Field field="modified_date" displayName="最后修改时间" width="100"/>
			</TK:Fields>
		</TK:DataGrid>
		  </TK:group>	        
        </TK:Splitter>
</TK:Page>
