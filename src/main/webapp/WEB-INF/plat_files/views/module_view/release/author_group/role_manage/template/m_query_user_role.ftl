<TK:Page>
	<TK:Splitter allowResize="false">
		<TK:group showCollapseButton="false" size="0" visible="false">
		</TK:group> 
		<TK:group showCollapseButton="true" >
			<TK:DataGrid id="datagrid1" inputs="role_id:'$role_id$'" eventNo="e_query_roleuser" isPage="true">
			  <TK:Toolbar id="toolbutton">
			    <TK:Group style="width:100%;">
			      <TK:Button displayName="增加用户" iconCls="icon-add" plain="true">
			        <TK:Property function="popWindow" templateNo="m_add_role_user" inputs="role_id:'$role_id$'" title="添加角色用户" width="900" height="500" />
			      </TK:Button>
			      <TK:Button displayName="删除角色用户" iconCls="icon-remove" plain="true">
			        <TK:Property function="submit" isMulSelect="true"  eventNo="e_delete_role_user" inputs="user_id:'$user_id$',role_id:'$role_id$'"  isAlert="true" alertMsg="是否确认删除?" isReLoad="true"/>
			      </TK:Button>
			    </TK:Group>
			    <TK:Group style="white-space:nowrap;">
			      <TK:TextBox id="key" emptyText="请输入名称" style="width:150px;"/>   
			      <TK:Button displayName="查询" iconCls="icon-redo">
			        <TK:Property function="query"  paramFunc="getSearchParam"/>
			      </TK:Button>
			    </TK:Group>
			  </TK:Toolbar>
			  <TK:Fields >
			  	<TK:Field type="checkcolumn" allowSort="false" width="20"/>
			    <TK:Field field="login_id" displayName="登录账号"  width="80"/>
			    <TK:Field field="name" displayName="名称" width="80"/>
			    <TK:Field id="state" field="state" displayName="是否有效" width="60" dataType="select" format="state"/>
			    <TK:Field id="dept_id" field="dept_id" displayName="所属机构" width="80" dataType="select" format="dept_id"/>
			    <TK:Field id="post_id" field="post_id" displayName="所属岗位" width="80" dataType="select" format="post_id"/>
			  </TK:Fields>
			</TK:DataGrid>
		</TK:group>
	</TK:Splitter>
<TK:Script>
  <![CDATA[
  		
	function getSearchParam(){
		var param = new Object();
		var key = mini.get("key").getValue();
		param.key=key;
		return param;
	}
   ]]>
</TK:Script>
</TK:Page>
