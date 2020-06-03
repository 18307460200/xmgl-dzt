<TK:Page>
	<TK:Form id="form1" style="width:100%;">
		 <TK:Table>
		 	<TK:Group>
		 		<TK:Textbox label="机构名称："  name="name"  required="true" />
		 	</TK:Group>
		 	<TK:Group>
		 		<TK:Textbox label="机构英文名："  name="dept_name_en"  required="true" />
		 	</TK:Group>
		 	<TK:Group>
		 		<TK:RadioButtonList label="是否营业部：" name="is_branch" repeatItems="1" value="0" onvaluechanged="valuechanged">
		 			<TK:Property dataType="select" format="is_branch"/>
		 		</TK:RadioButtonList>
		 	</TK:Group>
		 	<TK:Group>
		 		<TK:ComboBox label="营业部名称：" name="branch_id" required="true" visible="false" popupHeight="80">
		 			<TK:Property dataType="select" format="branch_id"/>
		 		</TK:ComboBox>
		 	</TK:Group>
		 	<TK:Group>
		 		<td align="center">
		 		    <TK:Button displayName="添加" style="width:60px;margin-right:20px;" iconCls="icon-ok" >
                          <TK:Property function="submit" eventNo="e_add_org" isValid="true" inputs="dept_id:'$dept_id$'"  isClose="true"/>
                    </TK:Button>
                    <TK:Button displayName="重置" style="width:60px;" iconCls="icon-redo">
                          <TK:Property function="reset" />
                     </TK:Button>
		 		</td>
		 	</TK:Group>
		</TK:Table>
	</TK:Form>
	<TK:Script>
		function valuechanged(e){
			var value=e.value;
			if(value=='1')
			{
				mini.getbyName("branch_id").setVisible(true);
			}
			else
				mini.getbyName("branch_id").setVisible(false);
		}
	</TK:Script>
</TK:Page>
