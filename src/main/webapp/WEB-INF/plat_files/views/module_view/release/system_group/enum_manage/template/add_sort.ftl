<TK:Page>
  <TK:Form id="form1">
     <TK:Table>
       <TK:Group>
         <TK:Textbox label="分类名称：" name="sort_name" required="true"/>
       </TK:Group>  
       <TK:Group>
         <TK:ComboBox label="是否展示：" name="is_show" value="0">
		 			<TK:Property dataType="select" format="isshow"/>
		 		</TK:ComboBox>
       </TK:Group>
       <TK:Group>
         <td align="center">
           <TK:Button displayName="添加"  style="width:60px;margin-right:20px;" iconCls="icon-ok" >
          <TK:Property function="submit"  eventNo="e_add_enumsort" isValid="true" isClose="true"/>
          </TK:Button>       
                 <TK:Button displayName="重置" style="width:60px;" iconCls="icon-redo">
                <TK:Property function="reset"/>
                 </TK:Button>
         </td>
       </TK:Group>
    </TK:Table>
  </TK:Form>
</TK:Page>                                                                                                                                                                                                  
