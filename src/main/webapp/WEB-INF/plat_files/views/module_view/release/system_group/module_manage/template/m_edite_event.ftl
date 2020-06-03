<TK:Page>
	<TK:Form id="form1" inputs="event_id:'$event_id$'" eventNo="e_query_eventbyid" loadDataCallBackFunc="loadDataCallbackFunc">
        <TK:Hidden name="module_id">
                    	<TK:Property dataType="url" format="module_id"/> 
                    </TK:Hidden>
        <TK:Hidden name="event_id">
                    	<TK:Property dataType="url" format="event_id"/> 
                    </TK:Hidden>
		<TK:Table>
			<TK:Group>
				<TK:Textbox label="事件名称：" name="event_name" required="true" />
                <TK:Textbox label="事件编号："  name="event_no" required="true" emptyText="请输入事件英文编号，同一模块下编号必须唯一，采用小写下划线命名法"/>
			</TK:Group>
            <TK:Group>
				<TK:ComboBox label="事件类型：" name="event_type"  onvaluechanged="onEventTypeChanged" required="true">
                       <TK:Property dataType="select" format="event_type" />
                 </TK:ComboBox>
              	<td>
                 <TK:Checkbox text="是否判断权限" name="is_rights"  visible="false"  trueValue="1" falseValue="0"/>
               </td>
			</TK:Group>
			<TK:Group>
			 <td>
                 <TK:Checkbox text="是否判断数据权限" name="data_rights"  visible="false"  trueValue="1" falseValue="0" onvaluechanged="onValueChanged"/>
               </td>
               <TK:ComboBox label="数据权限要素：" name="data_type" id="data_type" required="true" style="display:none">
                       <TK:Property dataType="select" format="data_type"/>
                </TK:ComboBox>
			</TK:Group>
			<TK:Group id="execBusGroupId" style="display:none">
				<TK:Textbox label="BusKey：" name="bus_key" required="true"/>
				<TK:Textbox label="功能号：" name="func_no" required="true"/>
			</TK:Group>
			<TK:Group id="execFuncImplGroupId" style="display:none">
				<TK:Textbox label="自定义实现类：" name="func_impl" required="true" colspan="2" />
			</TK:Group>
			<TK:Group id="execSqlGroupId" style="display:none">
				<TK:Buttonedit label="自定义SQL：" name="sql_id" id="sql_id" required="true"   colspan="2">
					<TK:Property dataType="popWindow" format="m_edit_sql_n" title="添加SQL信息" displayName="添加SQL信息"  paramFunc="addSqlParam"  width="1200" height="600" callbackFunc="addSQL"/>
				</TK:Buttonedit>
			</TK:Group>
			<TK:Group id="execProcessGroupId" style="display:none">
				<TK:Textbox label="存储过程：" name="proc_id" required="true" colspan="2"/>
			</TK:Group>
			<TK:Group>
				<TK:Textarea label="事件描述：" style="width:100%;height:50px;" name="description" colspan="2" />
			</TK:Group>
		</TK:Table>
        <TK:Table>
		 	<TK:Group>
		 		<td colspan="2" align="center">
		 			<TK:Button displayName="确定" style="width:60px;margin-right:20px;" iconCls="icon-ok" >
		 				<TK:Property function="submit" eventNo="e_edite_event" isAlert="true" alertMsg="是否提交？"  isValid="true"  isClose="true" />
		 			</TK:Button> 
                    <TK:Button displayName="取消" iconCls="icon-cancel">
                    	<TK:Property isClose="true" />
                    </TK:Button>
		 		</td>
		 	</TK:Group>
		</TK:Table>
	</TK:Form>
    <TK:Script type="text/javascript">
   <![CDATA[	
        function loadDataCallbackFunc(e){
			var eventType = e.event_type; 
		    if(eventType=='0')
		    {
				$("#execBusGroupId").show();
		    }else if(eventType=='1')
		    {
		        mini.getbyName("sql_id").setText(e.sql_id);
				$("#execSqlGroupId").show();
		    }
		    else if(eventType=='2')
		    {
				$("#execFuncImplGroupId").show();
		    }
			else if(eventType=='3')
		    {
				$("#execProcessGroupId").show();
		    }
		    var data_rights = e.data_rights; 
		    if(data_rights=='1'){
		    	mini.get("data_type").show();
		    }else{
		    	mini.get("data_type").hide();
		    }
			mini.parse();
		}
		
function onEventTypeChanged(e){
			if(e.value == '0'){
				//执行BUS接口
				$("#execBusGroupId").show();
				$("#execFuncImplGroupId").hide();
				$("#execSqlGroupId").hide();
				$("#execProcessGroupId").hide();	
			}
			else if(e.value == '2'){
				//执行自定义实现类　
				//alert("执行自定义实现类");
				$("#execBusGroupId").hide();
				$("#execFuncImplGroupId").show();
				$("#execSqlGroupId").hide();
				$("#execProcessGroupId").hide();
			}
			else if(e.value == '1'){
				//执行自定义SQL
				//alert("执行自定义SQL");
				$("#execBusGroupId").hide();
				$("#execFuncImplGroupId").hide();
				$("#execSqlGroupId").show();
				$("#execProcessGroupId").hide();
			}
			else if(e.value == '3'){
				//执行存储过程
				$("#execBusGroupId").hide();
				$("#execFuncImplGroupId").hide();
				$("#execSqlGroupId").hide();
				$("#execProcessGroupId").show();
			}
			mini.parse();
		}
		
		function addSqlParam()
		{
			var param = new Object();
			param.event_id =  mini.getbyName("event_id").value; 
			var module_id = mini.getbyName("module_id").value;      
            param.module_id=module_id;
            return param;
		}
		
		function addSQL(action,iframe) 
		{
            var btnEdit = mini.get("sql_id");
            	var data = iframe.contentWindow.GetData();
                data = mini.clone(data);    //必须
                if (data) 
                {
                	btnEdit.setValue(data);
                    btnEdit.setText(data);
                }
        }
		
	    function onValueChanged(e) {
            var checked = this.getChecked();
            if(checked){
            	mini.get("data_type").show();
            }else{
            	mini.get("data_type").hide();
            	mini.get("data_type").setValue("")
            }
        }
        ]]>
    </TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                             
