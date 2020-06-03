<TK:Page>
  <TK:Form id="form1" eventNo="e_query_fieldsinfo" inputs="data_id:'$data_id$'">
     <TK:Table>
     <TK:Group>
         <TK:Textbox label="名称：" name="data_name" required="true"/>
       </TK:Group>  
       <TK:Group>
         <TK:Textbox label="英文标识：" name="data_type" required="true"/>
       </TK:Group> 
        <TK:Group>
         <TK:Textbox label="字段标识：" name="field_flag" required="true"/>
       </TK:Group> 
       <TK:Group>
         <TK:Textbox label="排序值：" name="orderline" required="true"/>
       </TK:Group>  
       <TK:Group>
         <TK:Textbox label="数据来源实现类：" name="data_source_impl" required="true"/>
       </TK:Group> 
       <TK:Group>
              	<TK:RadioButtonList label="字段类型：" name="field_type" required="true">
		 			<TK:Property dataType="select" format="field_type"/>
		 		</TK:RadioButtonList>
       		</TK:Group>  
         <TK:Group>
              	<TK:RadioButtonList label="是否启用：" name="status" required="true">
		 			<TK:Property dataType="select" format="fields_status"/>
		 		</TK:RadioButtonList>
       		</TK:Group>
       <TK:Group>
         <td align="center">
           <TK:Button displayName="修改" style="width:60px;margin-right:20px;" iconCls="icon-ok">
           <TK:Property function="submit" eventNo="e_edit_fields"  isValid="true"  inputs="data_id:'$data_id$'" isClose="true"/> 
           </TK:Button>       
                 <TK:Button displayName="关闭"  iconCls="icon-cancel">
                <TK:Property isClose="true"/>
                </TK:Button> 
         </td>
       </TK:Group>
    </TK:Table>
  </TK:Form>
</TK:Page>                                                                                                                                                                                                                                                              
