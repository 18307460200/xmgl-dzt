<TK:Page>
	<TK:Form id="form1" eventNo="e_query_sqlenum" inputs="sql_id:'$sql_id$'">
		<TK:Hidden name="sql_type" value="5" />
		<TK:Hidden name="sql_id" />
		<TK:Table>
			<TK:Group>
				<TK:ComboBox label="数据源：" name="datasource"  value="" emptyText="不填为默认数据源">
                	<TK:Property dataType="select" format="datasource"/>
                </TK:ComboBox>
				<TK:ComboBox label="数据返回类型：" name="result_type" require="true" value="1"  visible="false" emptyText="默认为list类型">
                	<TK:Property dataType="select" format="result_type"/>
                </TK:ComboBox>  
			</TK:Group>
            <TK:Group>
				<TK:Textbox label="数据库表名：" name="tableName" /> 
            </TK:Group>
             <tr><td colspan="2">   
            		<TK:Button displayName="一键生成SQL语句" style="margin-left:350px;margin-top:-30px;">
         				<TK:Property  function="submit" eventNo="e_genrate_sql" paramFunc="returnSqlParam" callbackFunc="getSqlCallBac"  />
                    </TK:Button>
            	 </td>
			</tr>
			<TK:Group>
             	<TK:CEditor label="SQL语句：" name="sql_value" id="sql_value" style="width:100%;height:350px;"  colspan="2" emptyText="支持mybatis动态SQL语法" required="true"/>
            </TK:Group>
		</TK:Table>
        <TK:Table>
		 	<TK:Group>
		 		<td colspan="2" align="center" id="button">
		 			<TK:Button displayName="确定" style="width:60px;margin-right:20px;" iconCls="icon-ok"  >
		 				<TK:Property function="submit" isAlert="true" isClose="true" eventNo="e_add_enumsql" callbackFunc="submitCallBack"  alertMsg="是否提交？" isValid="true"/>
		 			</TK:Button>      
					<TK:Button displayName="取消"  iconCls="icon-cancel">
						<TK:Property isClose="true"/>
					</TK:Button>       
		 	   </td>
		      </TK:Group>
		</TK:Table>
	</TK:Form>
    <TK:Script type="text/javascript">
    <![CDATA[
       	
		function returnSqlParam()
		{
			var dataSource = mini.getbyName("datasource").value;
    		var tableName = mini.getbyName("tableName").value;
    		var sqlType = 'select';
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
			var sql_id=e.results.results[0].sql_id;
			mini.getbyName("sql_id").setValue(sql_id);
		}
		 function GetData() {
        	var map = {};
        	map['sql_id'] = mini.getbyName("sql_id").getValue();
	        return map;
	    }
    	]]>
    </TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                              
