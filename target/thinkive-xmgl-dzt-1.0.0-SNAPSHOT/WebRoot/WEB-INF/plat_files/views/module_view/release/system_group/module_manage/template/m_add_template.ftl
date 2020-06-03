<TK:Page>

<div id="layout1" class="mini-layout" style="width:100%;height:100%;">
	<div title="center" region="center" bodyStyle="overflow:hidden;" style="border:0;">			
    			<TK:Form id="form1">
                     <TK:Hidden name="module_id">
                    	<TK:Property dataType="url" format="module_id"/> 
                    </TK:Hidden>
					<TK:Table>
						<TK:Group>
							<TK:Textbox label="模板编号：" name="template_no" emptyText="请输入模板英文编号，同一模块下编号必须唯一，采用下划线命名法" required="true"/>
							<TK:Textbox label="模板名称：" name="template_name" emptyText="请输入模板中文名称" required="true"/>
						</TK:Group>
						<TK:Group>
                        <TK:ComboBox label="生成文件编码：" name="file_encoding" value="UTF-8" required="true">
		 			          <TK:Property dataType="select" format="encode"/>
		 		        </TK:ComboBox>
						<TK:ComboBox label="文件存储类型：" name="file_type" onvaluechanged="onEventTypeChanged" value="0" required="true" >
						  <TK:Property dataType="select" format="file_type"/>
						</TK:ComboBox>
						</TK:Group>
						<TK:Group>
					 		<td>
					 			<TK:Checkbox text="是否首页" name="is_index"  trueValue="1" falseValue="0"/>
                                <TK:ComboBox label="文件解析类型：" name="parse_type"  value="0" required="true" >
                                    <TK:Property dataType="select" format="parse_type"/>
                                </TK:ComboBox>
                            </td>
             </TK:Group>
             <TK:Group>
              <TK:Textbox label="弹窗宽度：" name="window_width"  visible="false" emptyText="请输入模板弹窗宽度" required="true"/>
              <TK:Textbox label="弹窗高度：" name="window_height"  visible="false" emptyText="请输入模板弹窗高度" required="true"/>
            </TK:Group>
            <TK:Group>
              <TK:Textarea label="模板简介：" style="width:100%;height:50px;" name="template_brief" colspan="2"></TK:Textarea>
            </TK:Group>
			<TK:Group>
              <TK:Textbox label="模板地址：" name="template_url" visible="false"  emptyText="请输入模板本地地址" required="true"/>
            </TK:Group>
            <TK:Group>
              <TK:CEditor label="模版内容：" name="content" style="width:100%;height:395px;" id="content" colspan="2" onvalidation="onValueCheck"/>
            </TK:Group>
          </TK:Table>
                        <TK:Table>
       <TK:Group>
         <td colspan="2" align="center" style="padding-top:10px;">
	           <TK:Button displayName="确定" style="width:60px;margin-right:20px;" iconCls="icon-ok"  >
	             <TK:Property function="submit" isAlert="true" alertMsg="是否提交？" isValid="true"   eventNo="e_add_template" isClose="true" />
	           </TK:Button>      
              <TK:Button displayName="取消" iconCls="icon-cancel">
                     <TK:Property isClose="true"/>
             </TK:Button>  
          </td>
          </TK:Group>
    </TK:Table>
        </TK:Form>       
  </div>
  <div region="east" title="事件列表" showheader="true"  expanded="false" bodystyle="padding-right:1px;overflow-y:hidden;" showspliticon="false"  width="350" >
    <TK:DataGrid id="datagrid1" isCellCopy="true" eventNo="e_query_eventbymoduleid" pageSize="20" idField="event_id" inputs="module_id:'$module_id$'" style="height:100%;width:100%;" >
            <TK:Toolbar>   
                               <TK:Group style="width:100%;">      
              <TK:Button displayName="新增" iconCls="icon-add" plain="true">
                                         <TK:Property function="popWindow"  templateNo="m_add_event" title="新增模板事件" inputs="module_id:'$module_id$'" width="600" height="300"/>
        </TK:Button>     
         <TK:Button displayName="编辑" iconCls="icon-edit" plain="true">
               <TK:Property function="popWindow"  templateNo="m_edite_event" title="修改事件" isSelect="true" inputs="event_id:'',module_id:'$module_id$'" width="600" height="300"/>
          </TK:Button>  
            <TK:Button displayName="删除" iconCls="icon-remove" plain="true" >
                   <TK:Property function="submit" isMulSelect="true" eventNo="e_delete_event" inputs="event_id:'',event_type:'',event_value:''" isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
			</TK:Button>  
           <TK:Button displayName="刷新" iconCls="icon-reload" plain="true" >
                 <TK:Property function="refresh" />
        </TK:Button>   
        </TK:Group>
            </TK:Toolbar>
            <TK:Fields>
                <TK:Field type="checkcolumn" allowSort="false"/>
              <TK:Field field="event_no" displayName="事件编号" width="120"/>
              <TK:Field field="event_name" displayName="事件名称" width="120"/>
            </TK:Fields>
      </TK:DataGrid>  
  </div>
</div>
<script type="text/javascript">
<![CDATA[
function onEventTypeChanged(e)
{
	var fileType = e.value;
	if(fileType=='0')
	{
		mini.getbyName("template_url").setVisible(false);
		$.tkui["content"].setVisible(true);
	}
	else
	{
		mini.getbyName("template_url").setVisible(true);
		$.tkui["content"].setVisible(false);
	}
}
function onValueCheck(e){
	if (e.isValid) {
		var type = mini.getbyName("file_type").getValue();
                if (type=='0' && e.value.length==0) {
                    e.errorText = "必须输入模版内容";
                    e.isValid = false;
                }
            }
}

]]>
</script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
