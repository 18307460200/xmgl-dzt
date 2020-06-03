<TK:Page >
	<TK:Form id="form1" eventNo="e_query_sqlevent" inputs="module_id:'$module_id$',sql_id:'$sql_id$'" loadDataCallBackFunc="loadDataCallBackFunc">
		<TK:Hidden name="module_id">
		 	<TK:Property dataType="url" format="module_id"/>
		 </TK:Hidden>
         <TK:Hidden name="sql_id">
		 	<TK:Property dataType="url" format="sql_id"/>
		 </TK:Hidden>
		<TK:Table>
		<TK:Group>
				<TK:Textbox label="SQL编号：" name="sql_no"  emptyText="英文字符" required="true" />
				<TK:Textbox label="排序值：" name="orderline"   required="true" />
			</TK:Group>
			<TK:Group>
				<TK:ComboBox label="数据源：" name="datasource"  emptyText="不填为默认数据源">
					<TK:Property dataType="select" format="datasource"/>
				</TK:ComboBox>
				<TK:ComboBox label="SQL类型：" onvaluechanged="valuechanged" name="sql_type"  emptyText="请选择SQL类型">
					<TK:Property dataType="select" format="sql_type"/>
				</TK:ComboBox>
			</TK:Group>
			<TK:Group>
				<TK:Textbox label="查询结果集数量：" name="result_number" value="0" visible="false"/>
                <TK:ComboBox label="数据返回类型：" name="result_type" visible="false" value="1" emptyText="默认为list类型">
					<TK:Property dataType="select" format="result_type"/>
				</TK:ComboBox>               
			</TK:Group>
            <TK:Group>
				<TK:Textbox label="数据库表名：" name="tableName" /> 
		    </TK:Group>
		    <tr><td colspan="2" >   
					<TK:Button displayName="一键生成SQL语句" style="margin-left:450px;margin-top:-60px;">
						<TK:Property  function="submit" eventNo="e_genrate_sql" paramFunc="returnSqlParam" callbackFunc="getSqlCallBac"  />
					</TK:Button>
				</td>
			</tr>
			<TK:Group>
				<TK:RadioButtonList label="状态：" name="state" id="state">
		 			<TK:Property dataType="select" format="state"/>
		 		</TK:RadioButtonList> 
		 	</TK:Group>
			<TK:Group>
             	<TK:CEditor label="SQL语句：" name="sql_value" id="sql_value" style="width:100%;height:340px;"  colspan="2" emptyText="支持mybatis动态SQL语法" required="true"/>
			</TK:Group>
		</TK:Table>
                 <TK:Table>
		 	<TK:Group>
		 		<td colspan="2" align="center" id="button">
				 <TK:Button displayName="添加" id="submit" iconCls="icon-ok" >
					<TK:Property function="submit" isAlert="true" isClose="true" eventNo="e_add_sql"  alertMsg="是否提交？" isValid="true"/>
				</TK:Button>
                <TK:Button displayName="取消" id="delete" iconCls="icon-cancel">
					<TK:Property   isClose="true" />
				</TK:Button>   
		 	   </td>
		      </TK:Group>
		</TK:Table>
	</TK:Form>
    <TK:Script type="text/javascript">
    <![CDATA[
    	function loadDataCallBackFunc(e){
    		var type = e.sql_type;
    		if(type == "0"){
    			mini.getbyName("result_number").setVisible(true);
    			mini.getbyName("result_type").setVisible(true);
    			mini.parse();
    		}
    	}
    
       	function valuechanged(e)
    	{
    		var value = e.value;
    		var sqlType= $.tkui["sql_value"];
    		if(value=='0')
    		{
    			sqlType.setContent("<select></select>");
    			mini.getbyName("result_number").setVisible(true);
    			mini.getbyName("result_type").setVisible(true);
    			mini.parse();
    		}
    		else if(value=='1')
    		{
    			sqlType.setContent("<update></update>");
    			mini.getbyName("result_number").setVisible(false);
    			mini.getbyName("result_type").setVisible(false);
    			mini.parse();
    		}
    		else if(value=='2')
    		{
    			sqlType.setContent("<insert></insert>");
    			mini.getbyName("result_number").setVisible(false);
    			mini.getbyName("result_type").setVisible(false);
    			mini.parse();
    		}
    		else
    		{
    			sqlType.setContent("<delete></delete>");
    			mini.getbyName("result_number").setVisible(false);
    			mini.getbyName("result_type").setVisible(false);
    			mini.parse();
    		}
    	
    	}
		function returnSqlParam()
		{
			var dataSource = mini.getbyName("datasource").value;
    		var tableName = mini.getbyName("tableName").value;
    		var sqlType = mini.getbyName("sql_type").value;
    		if(sqlType=='0')
    			sqlType='select';
    		else if(sqlType=='1')
    			sqlType='update';
    		else if(sqlType=='2')
    			sqlType='insert';
    		else  if(sqlType=='3')
    			sqlType='delete';
      	 	var data={"tableName":tableName,"dataSource":dataSource,"sqlType":sqlType};
			return data;
		}
		function getSqlCallBac(e)
		{
			if(e.error_no=='0')
			{
				var sqlType= $.tkui["sql_value"];
	            sqlType.setContent(e.results.results[0].sqlContent);
	        } 
		}
       
        function submitCallBack(e)
		{
			window.parent.closeAll();
		}
        function GetData() {
        	var map = {};
        	map['sql_id'] = mini.getbyName("sql_id").getValue();
        	map['sql_value'] = mini.getbyName("sql_value").getValue();
	        return map;
	    }
            
		function add_sql(){
		    var form =  new mini.Form("form1");
			if(!form.isValid()){
				return;
			}
			var data = new mini.Form("form1").getData();
			FrameService.getInstance().processSubmit(submitComplte, "e_add_sql", data,
					null, null,true,null);
			function submitComplte(e)
			{
				$("#button").find(".mini-button").each(function(){
					$(this).attr("class","mini-button mini-button-disabled");
				});
				var n =mini.getParams().n;
				window.parent.closeCurWin(n);
				window.parent.add_sql();
			}
		}
		function delete_sql(){
			var data = new mini.Form("form1").getData();
			var sql_id = data.sql_id;
 			FrameService.getInstance().processSubmit(submitComplte, "e_delete_sql", data,
					null, null,true,null);
			function submitComplte(e)
			{
				if(e.getErrorNo() == 0){
					FrameService.getInstance().closeWindow("ok");
					window.parent.getSqlId(sql_id);
				}else{
					var errorInfo = e.getErrorInfo();
                    if ($.string.isNotEmpty(errorInfo)) {
                   		window.top.mini.alert(errorInfo);
                    }
				}
			}
		}
    	]]>
    </TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                              
