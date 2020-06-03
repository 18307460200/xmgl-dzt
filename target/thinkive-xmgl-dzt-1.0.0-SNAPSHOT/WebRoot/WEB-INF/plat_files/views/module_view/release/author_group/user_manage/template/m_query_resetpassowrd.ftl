<TK:Page>
<TK:Splitter allowResize="false">
 <TK:group showCollapseButton="false" size="0" visible="false">
    </TK:group> 
    <TK:group showCollapseButton="true" >
	    <TK:DataGrid id="datagrid1" eventNo="e_query_loginuser"  pageSize="20" isPage="true"  >
	    	<TK:Toolbar>
		    	<TK:Group style="width:100%;">
		    		<TK:Button displayName="有效" iconCls="icon-edit" >
						<TK:Property function="submit" isMulSelect="true" eventNo="e_edit_statey" inputs="user_id:''" isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
					</TK:Button>
					<TK:Button displayName="无效" iconCls="icon-edit" >
						<TK:Property function="submit" isMulSelect="true" eventNo="e_edit_statex" inputs="user_id:''" isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
					</TK:Button>
					<TK:Button displayName="刷新" iconCls="icon-reload" plain="true" >
                        <TK:Property function="refresh" />
					</TK:Button>
				</TK:Group>
				<TK:Group style="white-space:nowrap;">
					<TK:Textbox emptyText="登录账号：" name="login_id"  style="width:200px;"/>
					<TK:Textbox emptyText="用户姓名：" name="name"  style="width:200px;"/>
					<TK:Button displayName="查询" iconCls="icon-redo">
						<TK:Property function="query" isSelect="false" isMulSelect="false" inputs="" />
					</TK:Button>
				</TK:Group>
		    </TK:Toolbar>
		    <TK:Fields>
		    	<TK:Field type="checkcolumn" allowSort="false"/>
		    	<TK:Field field="login_id" displayName="登录账号" width="120"/>
		    	<TK:Field field="name" displayName="用户姓名" width="120"/>
		    	<TK:Field field="sex" displayName="性别" width="80" dataType="select" format="sex"/>
		    	<TK:Field field="state" displayName="状态" width="80" dataType="select" format="state"/>
		    	<TK:Field field="employee_no" displayName="员工编号" width="100"/>
		    	<TK:Field field="mobile_phone" displayName="联系电话" width="100"/>
				<TK:Field field="login_times" displayName="登录次数" width="100"/>
				<TK:Field displayName="操作">
					<TK:Property function="popWindow" templateNo="m_editpwd_user" title="重置密码" displayName="重置密码" inputs="user_id:''" width="400" height="200" />
				</TK:Field>
			</TK:Fields>
		</TK:DataGrid>
		  </TK:group>	        
        </TK:Splitter>
</TK:Page>
