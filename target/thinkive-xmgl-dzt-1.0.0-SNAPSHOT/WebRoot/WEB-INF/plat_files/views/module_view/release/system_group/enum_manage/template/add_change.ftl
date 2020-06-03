<TK:Page>
  <TK:Form id="form1">
     <TK:Table>
       <TK:Hidden name="item_id">
		 	<TK:Property dataType="url" format="item_id"/>
		 </TK:Hidden>
       <TK:Group>
                <TK:ComboBox label="对应平台：" name="change_plat" >
		 			<TK:Property dataType="select" format="third_platform"/>
		 		</TK:ComboBox>
       </TK:Group>
       <TK:Group>
         <TK:Textbox label="平台转换值：" name="change_value" required="true"/>
       </TK:Group>     
       <TK:Group>
           <TK:ComboBox label="是否有效：" name="state" value="1">
		 			<TK:Property dataType="select" format="state"/>
		 		</TK:ComboBox>
       </TK:Group>
       <TK:Group>
         <td align="center">
           <TK:Button displayName="添加" style="width:60px;margin-right:20px;" iconCls="icon-ok">
          <TK:Property function="submit"  eventNo="e_add_enumchange"  isValid="true" isClose="true" /> 
           </TK:Button>       
                 <TK:Button displayName="重置" style="width:60px;" iconCls="icon-redo">
                 <TK:Property function="reset"/>
                </TK:Button>  
         </td>
       </TK:Group>
    </TK:Table>
  </TK:Form>
</TK:Page>                                                                                                                        
