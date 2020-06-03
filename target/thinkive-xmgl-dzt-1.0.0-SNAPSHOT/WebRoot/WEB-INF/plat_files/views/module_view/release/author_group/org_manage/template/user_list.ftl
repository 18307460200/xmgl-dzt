<TK:Page>
<TK:Splitter allowResize="false">
	 <TK:group showCollapseButton="false" size="0" visible="false">
	</TK:group> 
	<TK:group showCollapseButton="true" >
	<TK:DataGrid id="datagrid1" eventNo="e_query_userlist"  inputs="post_id:'$post_id$',dept_id:'$dept_id$'" isPage="true">
		<TK:Toolbar>
	    	<TK:Group style="width:100%;">
				<TK:Button displayName="增加" iconCls="icon-add">
					<TK:Property function="popWindow" templateNo="add_user" title="添加用户" filterFunc="conditionFilter"  inputs="post_id:'$post_id$',dept_id:'$dept_id$'" width="650" height="500" />
				</TK:Button>
				<TK:Button displayName="删除" iconCls="icon-remove">
				<TK:Property function="submit" isMulSelect="true" eventNo="e_delete_orguser" inputs="id:''"  isAlert="true" alertMsg="是否确认删除?" isReLoad="true"/>
				</TK:Button>
			</TK:Group>
			<TK:Group style="white-space:nowrap;">
				<TK:TextBox id="key" name="key" emptyText="请输入姓名" style="width:150px;"/>   
				<TK:Button displayName="查询" iconCls="icon-redo">
					<TK:Property function="query"  inputs="key:''"/>
				</TK:Button>
			</TK:Group>
	    </TK:Toolbar>
	    <TK:Fields >
			<TK:Field type="checkcolumn" allowSort="false"/>
			<TK:Field field="employee_no" displayName="员工编号" width="100" align="center"/>
			<TK:Field field="name" displayName="姓名" width="100" align="center"/>
			<TK:Field field="mobile_phone" displayName="手机号码" width="100" align="center"/>
		</TK:Fields>
	</TK:DataGrid>
</TK:group>
</TK:Splitter>
<TK:Script>
<![CDATA[
		mini.parse();
		var grid = mini.get("datagrid1");
		var param = mini.getParams();
		var post_id = param.post_id;
		
		//添加用户前验证是不是岗位
		function conditionFilter(){
			if(post_id == "-1"){
				mini.alert("请选择组织机构下面的岗位添加用户!");
				return false;
			}else{
				return true;
			}
		}  
]]>
</TK:Script>
</TK:Page>
