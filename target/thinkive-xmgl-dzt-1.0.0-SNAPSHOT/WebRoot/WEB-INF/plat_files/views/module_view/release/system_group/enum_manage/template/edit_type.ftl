<TK:Page>
  <TK:Form id="form1" eventNo="e_query_enumtype" inputs="id:'$id$'" loadDataCallBackFunc="loadDataCallbackFunc">
     <TK:Table>
     <TK:Group>
         <TK:Textbox label="类型英文值："  name="enum_no"  required="true" colspan="2"/>
       </TK:Group>
       <TK:Group>
         <TK:Textbox label="类型名称："  name="enum_name"  required="true" colspan="2"/>
       </TK:Group>
       <TK:Group>
         <TK:ComboBox label="是否系统参数：" name="is_system" value="" colspan="2">
			<TK:Property dataType="select" format="issystem"/>
		 </TK:ComboBox>
        </TK:Group>
	    <TK:Group>
			<TK:RadioButtonList label="是否动态数据字典：" onvaluechanged="onSysDynamicChanged" name="is_dynamic" value="0" colspan="2">
				<TK:Property dataType="select" format="is_dynamic"/>
			</TK:RadioButtonList>
        </TK:Group>
        <TK:Group id="isCache" style="display:none">
			<TK:RadioButtonList label="是否缓存：" name="is_cache" value="0" colspan="2">
				<TK:Property dataType="select" format="is_cache"/>
			</TK:RadioButtonList>
        </TK:Group>
		<TK:Group  id="eventTypeId" style="display:none">
			<TK:ComboBox label="事件类型：" name="dynamic_type"  onvaluechanged="onEventTypeChanged" required="true" colspan="2">
				   <TK:Property dataType="select" format="event_type"/>
			</TK:ComboBox>
		</TK:Group>
		<TK:Group id="execBusGroupId" style="display:none">
			<TK:Textbox label="BusKey：" name="bus_key" required="true"/>
			<TK:Textbox label="功能号：" name="func_no" required="true"/>
		</TK:Group>
		<TK:Group id="execFuncImplGroupId" style="display:none">
			<TK:Textbox label="自定义实现类：" name="func_impl" required="true" colspan="2"/>
		</TK:Group>
		<TK:Group id="execSqlGroupId" style="display:none">
			<TK:Buttonedit label="自定义SQL：" name="sql_id" onbuttonclick="onButtonEdit" colspan="2"/>
		</TK:Group>
		<TK:Group id="execProcessGroupId" style="display:none">
			<TK:Textbox label="存储过程：" name="proc_id" required="true" colspan="2"/>
		</TK:Group>
		<TK:Group id="dynameicEnumId" style="display:none">
			<TK:Textbox label="枚举字段标识：" name="dynamic_enum_name" required="true"/>
			<TK:Textbox label="枚举字段值标识：" name="dynamic_enum_value" required="true"/>
		</TK:Group>
       <TK:Group>
         <td align="center" colspan="2">
           <TK:Button displayName="修改" style="width:60px;margin-right:20px;" iconCls="icon-ok" >
           <TK:Property function="submit" eventNo="e_edit_enumtype"  isValid="true" inputs="id:'$id$'" isClose="true"/> 
           </TK:Button>       
                 <TK:Button displayName="关闭"  style="width:60px;" iconCls="icon-cancel">
                <TK:Property isClose="true"/>
                </TK:Button> 
         </td>
       </TK:Group>
    </TK:Table>
  </TK:Form>
  <TK:Script>
  <![CDATA[
    
	
	function loadDataCallbackFunc(e)
	{
		(new mini.Form("form1")).setData(e);
		var is_dynamic = e.is_dynamic; 
		if(is_dynamic == "1"){
			var dynamic_type = e.dynamic_type;
			$("#eventTypeId").show();
			$("#isCache").show();
			if(dynamic_type=='0')
			{
				$("#execBusGroupId").show();
				$("#dynameicEnumId").show();
				mini.parse();
			}
			else if(dynamic_type=='1')
			{
				mini.getbyName("sql_id").setText(e.sql_id);
				$("#execSqlGroupId").show();
				$("#dynameicEnumId").show();
				mini.parse();
			}
			else if(dynamic_type=='2')
			{
				$("#execFuncImplGroupId").show();
				$("#dynameicEnumId").show();
				mini.parse();
			}else if(dynamic_type=='3'){
				$("#execProcessGroupId").show();
				$("#dynameicEnumId").show();
				mini.parse();
			}
		}
		mini.parse();
	}
  
	function onSysDynamicChanged(e){
		if(e.value == "0"){
			$("#eventTypeId").hide();
			$("#execBusGroupId").hide();
			$("#execFuncImplGroupId").hide();
			$("#execSqlGroupId").hide();
			$("#execProcessGroupId").hide();
			$("#dynameicEnumId").hide();
			$("#isCache").hide();
			mini.parse();
		}else if(e.value == "1"){
			$("#isCache").show();
			$("#eventTypeId").show();
			$("#dynameicEnumId").show();
		    var  dynamic_type = mini.getbyName("dynamic_type").getValue();
			onEventTypeChanged({"value":dynamic_type});
			mini.parse();
		}
	}
	function onEventTypeChanged(e){
		if(e.value == '0'){
			//执行BUS接口
			$("#execBusGroupId").show();
			$("#execFuncImplGroupId").hide();
			$("#execSqlGroupId").hide();
			$("#execProcessGroupId").hide();
			mini.parse();
		}
		else if(e.value == '2'){
			//执行自定义实现类　
			$("#execBusGroupId").hide();
			$("#execFuncImplGroupId").show();
			$("#execSqlGroupId").hide();
			$("#execProcessGroupId").hide();
			mini.parse();
		}
		else if(e.value == '1'){
			//执行自定义SQL
			$("#execBusGroupId").hide();
			$("#execFuncImplGroupId").hide();
			$("#execProcessGroupId").hide();
			$("#execSqlGroupId").show();
			mini.parse();
		}
		else if(e.value == '3'){
			//执行自定义JS
			$("#execBusGroupId").hide();
			$("#execFuncImplGroupId").hide();
			$("#execSqlGroupId").hide();
			$("#execProcessGroupId").show();
			mini.parse();
		}
	}
	function onButtonEdit(e) {
		var btnEdit = this;      
		var param = new Object();	
		var sql_id = mini.getbyName("sql_id").value;	
		param.sql_id = sql_id;
		var frameService = FrameService.getInstance();
		frameService.popWindow('修改SQL信息','add_sql',param,650,540,'',function(){

		},function(action){
			if (action == "ok") {
				var iframe = this.getIFrameEl();
				var data = iframe.contentWindow.GetData();
				data = mini.clone(data);    //必须
				if (data) {
					btnEdit.setValue(data.sql_id);
					btnEdit.setText(data.sql_id);
				}
			}
		});               
    }
	function closeAll()
    {
       var frameService = FrameService.getInstance();
       frameService.closeWindow();       
    }
     ]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                                                                                              
