<TK:Page>
  <TK:Form id="form1"  eventNo="e_query_enumchangevalue" inputs="exchange_id:'$exchange_id$'">
     <TK:Table>
       <TK:Group>
             <TK:ComboBox label="对应平台：" name="change_plat" value="">
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
           <TK:Button displayName="修改" style="width:60px;margin-right:20px;" iconCls="icon-ok" >
            <TK:Property function="submit" eventNo="e_edit_enumchangevalue"  isValid="true"  isClose="true" inputs="exchange_id:'$exchange_id$'"/> 
           </TK:Button>        
                 <TK:Button displayName="关闭" style="width:60px;" iconCls="icon-cancel">
                 <TK:Property isClose="true"/>
                </TK:Button>  
         </td>
       </TK:Group>
    </TK:Table>
  </TK:Form>
</TK:Page>                                                                                                                                                
