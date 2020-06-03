<TK:Page>
    <TK:Form id="form1">
        <TK:Table>
            <TK:Group>
                <TK:Textarea label="更新说明：" style="width:100%;height:100px;" name="update_content"></TK:Textarea>
            </TK:Group>
            <TK:Group>
                <TK:Textarea label="备注：" style="width:100%;height:50px;" name="remarks"></TK:Textarea>
            </TK:Group>
            <tr>
                <td align="center">
                    <TK:Button displayName="确定" style="width:60px;margin-right:20px;" iconCls="icon-ok">
                         <TK:Property function="submit" eventNo="e_publish_moudletype" inputs="module_id:'$module_id$'" isAlert="true" alertMsg="是否提交？" isValid="true" isClose="true"/>
                     </TK:Button> 
                   <TK:Button displayName="取消" iconCls="icon-cancel">
                       <TK:Property isClose="true"/>
                    </TK:Button>
                </td>
            </tr>
        </TK:Table>
    </TK:Form>
</TK:Page>                 
