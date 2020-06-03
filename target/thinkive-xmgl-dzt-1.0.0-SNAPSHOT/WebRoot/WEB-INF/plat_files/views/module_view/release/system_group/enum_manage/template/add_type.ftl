<TK:Page>
  <TK:Form id="form1">
     <TK:Table>
       <TK:Hidden name="sql_ids" />
       <TK:Group>
         <TK:Textbox label="类型名称："  name="enum_name"  required="true" colspan="2"/>
       </TK:Group>
       <TK:Group>
         <TK:Textbox label="英文编号：" name="enum_no" required="true" colspan="2"/>
       </TK:Group>     
       <TK:Group>
         <TK:ComboBox label="是否系统参数：" name="is_system" value="1" colspan="2">
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
           <TK:Button displayName="添加"  style="width:60px;margin-right:20px;" iconCls="icon-ok">
           <TK:Property function="submit" eventNo="e_add_enumtype"  isValid="true"  inputs="id:'$id$'" isClose="true"/>
           </TK:Button>       
                 <TK:Button displayName="重置" style="width:60px;" iconCls="icon-redo">
                 <TK:Property function="reset"/>
                </TK:Button> 
         </td>
       </TK:Group>
    </TK:Table>
  </TK:Form>
  <TK:Script>
  <![CDATA[
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
			$("#execBusGroupId").show();
			$("#execFuncImplGroupId").hide();
			$("#execSqlGroupId").hide();
			$("#execProcessGroupId").hide();
			$("#dynameicEnumId").show();
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
		var frameService = FrameService.getInstance();
		frameService.popWindow('添加SQL信息','add_sql',param,650,540,'',function(){

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
