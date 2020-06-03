<TK:Page>
  <TK:Form id="form1">
     <TK:Table>
       <TK:Group>
         <TK:Textbox label="名称："  name="item_name"  required="true" />
       </TK:Group>
       <TK:Group>
         <TK:Textbox label="枚举值：" name="item_value" required="true"/>
       </TK:Group>  
       <TK:Group>
             <TK:ComboBox label="是否有效：" name="status" value="1">
		 			<TK:Property dataType="select" format="state"/>
		 		</TK:ComboBox>
       </TK:Group>
       <TK:Group>
         <td align="center">
           <TK:Button displayName="添加" style="width:60px;margin-right:20px;" iconCls="icon-ok">
          <TK:Property function="submit" eventNo="e_add_enumvalue"  isValid="true" inputs="enum_id:'$id$'" isClose="true"/> 
           </TK:Button>         
                 <TK:Button displayName="重置"  style="width:60px;" iconCls="icon-redo">
                <TK:Property function="reset"/>
                </TK:Button>  
         </td>
       </TK:Group>
    </TK:Table>
  </TK:Form>
</TK:Page>                                                                                                    
