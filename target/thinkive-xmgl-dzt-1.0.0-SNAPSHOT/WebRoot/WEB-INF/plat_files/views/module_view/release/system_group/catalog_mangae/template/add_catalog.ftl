 <TK:Page>
  <TK:Form id="form1" style="width:500px;">
     <TK:Table>
       <TK:Group>
         <TK:Textbox label="目录名："  name="name"  required="true"/>
       </TK:Group>
       <TK:Group>
         <TK:Textbox label="访问地址：" name="link_url"/>
       </TK:Group>       
       <TK:Group>
      	<TK:Buttonedit label="模板链接：" id="module_id" name="module_id" allowInput="false">
     		<TK:Property dataType="popWindow" format="add_module" title="添加模块" displayName="添加模块"    width="800" height="580" callbackFunc="addModule"/>
    	</TK:Buttonedit>
       </TK:Group> 
       <TK:Group>
            <TK:CheckBoxList label="app对应的权限：" name="app_id" repeatItems="4" repeatLayout="table">
	 			<TK:Property dataType="select" format="app_id"/>
	 		</TK:CheckBoxList>
       </TK:Group>
       <TK:Group>
         <TK:TextArea label="栏目描述：" name="description"/>
       </TK:Group>
       <TK:Group>
         <td align="center">
           <TK:Button displayName="添加" style="width:60px;margin-right:20px;" iconCls="icon-ok">
           <TK:Property function="submit"  eventNo="e_add_catalog"  isValid="true" callbackFunc="freshTree" inputs="parent_id:'$id$'"/> 
           </TK:Button>         
                 <TK:Button displayName="关闭"  style="width:60px;" iconCls="icon-redo">
                 <TK:Property isClose="true"/>
                </TK:Button>  
         </td>
       </TK:Group>
    </TK:Table>
  </TK:Form>
  <TK:Script>
  <![CDATA[      
      function freshTree(){
         window.Owner.$.tkui['tree1'].refresh(1);
      }
       function addModule(action,iframe)
     {
           var btnEdit = mini.get("module_id");
           if (action == "ok") {
              var data = iframe.contentWindow.GetData();
              data = mini.clone(data);    //必须
              if (data) {
                  btnEdit.setValue(data.module_id);
                  btnEdit.setText(data.module_type_name+" --> "+data.name+"("+data.module_no+")");
              }
          }
     }
    ]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
