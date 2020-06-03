<TK:Page>
	<TK:DataGrid style="width:100%;height:100%;" id="datagrid1"  eventNo="e_query_orguserlist" inputs="post_id:'$post_id$',dept_id:'$dept_id$'" isPage="true">
		<TK:Toolbar>
	    	<TK:Group style="width:100%;">
				<TK:Button displayName="增加" iconCls="icon-add">
					<TK:Property function="submit" isSelect="true"  eventNo="e_add_orguser" inputs="dept_id:'$dept_id$',post_id:'$post_id$',user_id:''"  isReLoad="true" callbackFunc="freshUserList"/>
				</TK:Button>
			</TK:Group>
			<TK:Group style="white-space:nowrap;">
				<TK:TextBox id="employee_no" emptyText="请输入员工编号" style="width:150px;"/>   
				<TK:TextBox id="key" emptyText="请输入姓名" style="width:150px;"/>   
				<TK:Button displayName="查询" iconCls="icon-redo">
					<TK:Property function="query"  paramFunc="getParam"/>
				</TK:Button>
			</TK:Group>
	    </TK:Toolbar>
	    <TK:Fields >
			<TK:Field type="checkcolumn" allowSort="false"/>
			<TK:Field field="employee_no" displayName="员工编号" width="100"/>
			<TK:Field field="name" displayName="姓名" width="100"/>
			<TK:Field field="mobile_phone" displayName="手机号码" width="100"/>
		</TK:Fields>
	</TK:DataGrid>
	<TK:Script>
	<![CDATA[
		mini.parse();
		var grid = mini.get("datagrid1");
		var param = mini.getParams();
		var post_id = param.post_id;
		function getParam()
		{
			var key = mini.get("key").getValue();
			var employee_no = mini.get("employee_no").getValue();
			var paraMap = {};
			paraMap["post_id"] = post_id;
			paraMap["key"] = key;
			paraMap["employee_no"]= employee_no;
			return paraMap;
		}
		//添加用户前验证是不是岗位
		function conditionFilter(){
			alert(post_id);
			return false;
		}
		
		function getAddParam()
		{
			var row = grid.getSelected();
			var paraMap = {};
			paraMap["post_id"] = post_id;
			paraMap["user_id"] = row.user_id;
			return paraMap;
		}
		//刷新父窗口
        function freshUserList(){
            $.tkui["datagrid1"].loadData({post_id:post_id});
            window.Owner.$.tkui["datagrid1"].loadData({post_id:post_id});
        }
		
		]]>
</TK:Script>
</TK:Page>
