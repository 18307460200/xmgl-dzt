<TK:Page>
    <TK:Form id="form1" inputs="module_id:'$module_id$',isPage:'false'" eventNo="e_query_moudletypeinfo">
        <TK:Table>
              <TK:Group>
                <TK:Textbox label="模块名称：" name="name" required="true"/>
                <TK:Textbox label="模块编号：" name="module_no" required="true"/>
            </TK:Group>
            <TK:Group>
                <TK:Textbox label="模块描述：" name="description" colspan="2"/>
            </TK:Group>
        </TK:Table>
<TK:Table>
             <TK:Group>
                 <td colspan="2" align="center">
                     <TK:Button displayName="确定" style="width:60px;margin-right:20px;" iconCls="icon-ok" >
                         <TK:Property function="submit" eventNo="e_edit_moudletypeinfo"  isAlert="true" alertMsg="是否提交？" isValid="true"   isClose="true"/>
                     </TK:Button> 
                   <TK:Button displayName="取消" iconCls="icon-cancel">
                       <TK:Property isClose="true"/>
                    </TK:Button>
                 </td>
             </TK:Group>
        </TK:Table>
    </TK:Form>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
