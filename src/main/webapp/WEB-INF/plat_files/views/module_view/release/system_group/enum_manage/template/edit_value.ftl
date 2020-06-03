<TK:Page>
  <TK:Form id="form1" eventNo="e_query_enumvalueinfo"  inputs="id:'$item_id$'">
     <TK:Table>
       <TK:Group>
         <TK:Textbox label="名称："  name="item_name"  required="true" />
       </TK:Group>
       <TK:Group>
         <TK:Textbox label="枚举值：" name="item_value" required="true"/>
       </TK:Group>  
      <TK:Group>
         <TK:Textbox label="排序值：" name="orderline" required="true"/>
       </TK:Group>  
       <TK:Group>
           <TK:ComboBox label="是否有效：" name="status" value="1">
		 			<TK:Property dataType="select" format="state"/>
		 		</TK:ComboBox>
       </TK:Group>
       <TK:Group>
         <td align="center">
           <TK:Button displayName="修改"  style="width:60px;margin-right:20px;" iconCls="icon-ok" >
          <TK:Property function="submit" eventNo="e_edit_enumvalue"  isValid="true" isClose="true" inputs="id:'$item_id$'"/> 
          </TK:Button>       
                 <TK:Button displayName="关闭"  style="width:60px;" iconCls="icon-cancel">
                 <TK:Property isClose="true"/>
                </TK:Button>  
         </td>
       </TK:Group>
    </TK:Table>
  </TK:Form>
</TK:Page>                                                                                                                        
