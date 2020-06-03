<TK:Page>
    <TK:Form id="form1">
        <TK:Table>
            <TK:Group>
                <TK:Textbox label="模块名称：" name="name" required="true" emptyText="请输入模块名称"/>
              
            </TK:Group>
            <TK:Group>
                <TK:Textarea label="模块描述：" style="width:100%;height:50px;" name="description"></TK:Textarea>
            </TK:Group>
                   </TK:Table>
                    <TK:Table>
             <TK:Group>
                 <td colspan="2" align="center">
                     <TK:Button displayName="确定" style="width:60px;margin-right:20px;" iconCls="icon-ok">
                         <TK:Property function="submit" eventNo="e_add_moudletypeinfo" inputs="module_type_id:'$module_type_id$'"  isAlert="true" alertMsg="是否提交？" isValid="true"   isClose="true"/>
                     </TK:Button> 
                   <TK:Button displayName="取消"  iconCls="icon-cancel" >
                       <TK:Property isClose="true"/>
                    </TK:Button>
                 </td>
             </TK:Group>
        </TK:Table>            
    </TK:Form>
</TK:Page>                                                                                
