<TK:Page>
	<TK:Form id="from1" eventNo="e_query_rolesort" inputs="sort_id:'$sort_id$'">
		 <TK:Table>
		 	<TK:Group>
		 		<TK:Textbox label="分类名称：" style="margin-right:20px;" name="name" required="true"  emptyText="请输入分类名称"/>
		 	</TK:Group>
		 	<TK:Group>
                 <td align="center">
                     <TK:Button displayName="提交" style="width:60px;margin-right:20px;" iconCls="icon-ok">
                         <TK:Property function="submit" eventNo="e_edit_role_sort" isAlert="true" isClose="true" alertMsg="是否提交？" isValid="true"/>
                     </TK:Button>
                    <TK:Button displayName="重置" iconCls="icon-redo">
                        <TK:Property function="reset"/>
                    </TK:Button>
                 </td>
             </TK:Group>
		</TK:Table>
	</TK:Form>
</TK:Page>
