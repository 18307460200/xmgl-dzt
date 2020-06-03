<TK:Page>
	<TK:Splitter allowResize="false">
		<TK:group showCollapseButton="false" size="0" visible="false">
		</TK:group> 
		<TK:group showCollapseButton="true" >
			<TK:DataGrid id="datagrid1" inputs="role_id:'$role_id$'" eventNo="e_query_roleuser_list" isPage="true">
			  <TK:Toolbar id="toolbutton">
			    <TK:Group style="width:100%;">
			      <TK:Button displayName="增加用户" iconCls="icon-add" plain="true">
			        <TK:Property function="submit" isMulSelect="true" eventNo="e_add_role_user" isClose="true" inputs="user_id:'$user_id$',role_id:'$role_id$'" isAlert="true" alertMsg="是否确认添加?" />
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
