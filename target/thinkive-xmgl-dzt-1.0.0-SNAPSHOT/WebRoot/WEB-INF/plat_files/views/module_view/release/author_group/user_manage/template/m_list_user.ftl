<TK:Page>
<TK:Splitter allowResize="false">
 <TK:group showCollapseButton="false" size="0" visible="false">
            </TK:group> 
            <TK:group showCollapseButton="true" >
	    <TK:DataGrid id="datagrid1" eventNo="e_query_user"  pageSize="20" isPage="true"  >
	    	<TK:Toolbar>
		    	<TK:Group style="width:100%;">
					<TK:Button displayName="增加" iconCls="icon-add">
						<TK:Property function="popWindow" templateNo="m_add_user" title="添加用户"  width="650" height="530" />
					</TK:Button>
					<TK:Button displayName="编辑" iconCls="icon-edit" >
						<TK:Property function="popWindow" isSelect="true" templateNo="m_edit_user" title="修改用户" inputs="user_id:''"  width="650" height="500" />
					</TK:Button> 
					<TK:Button displayName="删除" iconCls="icon-remove" >
						<TK:Property function="submit" isMulSelect="true"  eventNo="e_delete_user" inputs="user_id:'$user_id$'"  isAlert="true" alertMsg="是否确认删除?" isReLoad="true"/>
					</TK:Button>
					<TK:Button displayName="注销" iconCls="icon-edit" >
						<TK:Property function="submit" isMulSelect="true" eventNo="e_edit_statey" inputs="user_id:''" isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
					</TK:Button>
					<TK:Button displayName="激活" iconCls="icon-edit" >
						<TK:Property function="submit" isMulSelect="true" eventNo="e_edit_statex" inputs="user_id:''" isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
					</TK:Button>
					<TK:Button displayName="导入" iconcls="icon-upload">
						<TK:Property function="popWindow" templateNo="m_import_user" title="导入用户信息" width="450" height="250" />
					</TK:Button>
					<TK:Button displayName="刷新" iconCls="icon-reload" plain="true" >
                        <TK:Property function="refresh" />
					</TK:Button>
				</TK:Group>
				<TK:Group style="white-space:nowrap;">
					<TK:Textbox emptyText="用户姓名：" name="name"  style="width:120px;"/>
					<TK:Textbox emptyText="登录账号：" name="login_id"  style="width:120px;"/>
					<TK:Textbox emptyText="联系电话：" name="mobile_phone"  style="width:120px;"/>
					<TK:Button displayName="查询" iconCls="icon-redo">
						<TK:Property function="query" isSelect="false" isMulSelect="false" inputs="" />
					</TK:Button>
				</TK:Group>
		    </TK:Toolbar>
		    <TK:Fields>
		    	<TK:Field type="checkcolumn" displayName="序号"/>
		    	<TK:Field field="login_id" displayName="登录账号" width="100"/>
		    	<TK:Field field="name" displayName="用户姓名" width="120"/>
		    	<TK:Field field="state" displayName="状态" width="80" dataType="select" format="user_state"/>
		    	<TK:Field field="login_times" displayName="登录次数" width="100"/>
		    	<TK:Field field="employee_no" displayName="员工编号" width="100"/>
		    	<TK:Field field="mobile_phone" displayName="联系电话" width="100"/>
				<TK:Field displayName="操作" width="120">
					<TK:Property function="popWindow" templateNo="m_user_info" title="查看详情" displayName="查看详情" inputs="user_id:''" width="600" height="500" />
                  	<TK:Property function="popWindow" templateNo="m_user_rights" title="查看权限" displayName="查看权限" inputs="user_id:''" width="450" height="600" />
                  	<TK:Property function="popWindow" templateNo="m_editpwd_user" title="重置密码" displayName="重置密码" inputs="user_id:''" width="400" height="200" />
				</TK:Field>
			</TK:Fields>
		</TK:DataGrid>
		  </TK:group>	        
        </TK:Splitter>
</TK:Page>
