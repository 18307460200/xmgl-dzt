<TK:Page>
    <TK:Form id="form1">
    	<TK:Hidden name="sort_id">
        	<TK:Property dataType="url" format="sort_id"/> 
        </TK:Hidden>
         <TK:Table>
             <TK:Group>
                 <TK:Textbox label="角色名称："  name="name"  required="true" />
             </TK:Group>
              <TK:Group>
                 <TK:Textbox label="角色英文名："  name="role_no"  required="true" />
             </TK:Group>
             <TK:Group>
              	<TK:RadioButtonList label="系统角色标志："  name="is_system" value="0">
					<TK:Property dataType="select" format="is_system"/>
				</TK:RadioButtonList>
             </TK:Group>
             <TK:Group style="display:none">
                 <TK:Textbox label="分类编号：" name="parent_no" required="true"/>
             </TK:Group>
             <TK:Group>
                 <TK:RadioButtonList label="是否临时角色：" onvaluechanged="onInvalidChanged" name="is_temp" value="0">
					<TK:Property dataType="select" format="is_temp"/>
				</TK:RadioButtonList>
             </TK:Group>
             <TK:Group id="invalidDate" style="display:none">
		 		<TK:Datepicker label="角色失效时间：" name="invaliddate" format='yyyy-MM-dd' required="true"/>
		 	</TK:Group>
             <TK:Group>
                 <td align="center">
                     <TK:Button displayName="提交" style="width:60px;margin-right:20px;" iconCls="icon-ok">
                         <TK:Property function="submit" eventNo="e_add_role" isAlert="true" isClose="true" alertMsg="是否提交？" isValid="true"/>
                     </TK:Button>
                    <TK:Button displayName="重置" iconCls="icon-redo">
                        <TK:Property function="reset"/>
                    </TK:Button>
                 </td>
             </TK:Group>
        </TK:Table>
    </TK:Form>
<TK:Script>
<![CDATA[
  	function onInvalidChanged(e){
  		if(e.value == "0"){
  			$("#invalidDate").hide();
  		}else{
  			$("#invalidDate").show();
  		}
  		mini.parse();
  	}
  ]]>
</TK:Script>
</TK:Page>                                          
