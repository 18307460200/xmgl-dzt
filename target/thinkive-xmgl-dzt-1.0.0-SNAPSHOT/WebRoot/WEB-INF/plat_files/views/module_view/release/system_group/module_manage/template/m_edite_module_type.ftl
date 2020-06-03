<TK:Page>
    <TK:Form id="form1" style="margin-right:15px;" inputs="module_type_id:'$module_type_id$'" eventNo="e_query_moudletypebyid" >
       <TK:Table>
         <TK:Group>
           <TK:Textbox  name="module_type_id" visible="false"/>
         </TK:Group>
         <TK:Group>
           <TK:Textbox label="模块类型编号：" name="module_type_no" required="true"  emptyText="请输入模块类型编号"/>
         </TK:Group>
         <TK:Group>
           <TK:Textbox label="模块类型名称：" name="module_type_name" required="true" emptyText="模块类型名称"/>
         </TK:Group>
      </TK:Table>
                          <TK:Table>
             <TK:Group>
                 <td colspan="2" align="center">
                     <TK:Button displayName="确定" style="width:60px;margin-right:20px;" iconCls="icon-ok" >
                         <TK:Property function="submit" eventNo="e_edit_moudletype" isAlert="true" alertMsg="是否提交？" isValid="true"   isClose="true"/>
                     </TK:Button> 
                   <TK:Button displayName="取消" iconCls="icon-cancel">
                       <TK:Property isClose="true"/>
                    </TK:Button>
                 </td>
             </TK:Group>
        </TK:Table> 
    </TK:Form>
</TK:Page>                                                                                                                                                  
