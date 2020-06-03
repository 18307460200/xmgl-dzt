<TK:Page>
	<TK:Form id="form1" style="width:100%;">
		 <TK:Table>
		 	<TK:Group>
		 		<TK:Textbox label="岗位名称："  name="post_name"  required="true" />
		 	</TK:Group>
		 	<TK:Group>
		 		<TK:Textbox label="岗位英文名："  name="post_no"  required="true" />
		 	</TK:Group>
		 	<TK:Group>
               <TK:ComboBox label="岗位类别：" name="post_type" value="0">
		 			<TK:Property dataType="select" format="post_type"/>
		 		</TK:ComboBox>
		 	</TK:Group>
		 	<TK:Group>
		 		<td align="center">
		 			<TK:Button displayName="添加" style="width:60px;margin-right:20px;" iconCls="icon-ok">    
                         <TK:Property function="submit" eventNo="e_add_post" inputs="dept_id:'$id$'" isValid="true"  isClose="true"/>  
                   </TK:Button>   
   			       <TK:Button displayName="重置"  style="width:60px;" iconCls="icon-redo"> 
                       <TK:Property function="reset" /> 
                  </TK:Button>
		 		</td>
		 	</TK:Group>
		</TK:Table>
	</TK:Form>
</TK:Page>
