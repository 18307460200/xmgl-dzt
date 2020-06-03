 <TK:Page>
  <TK:Form id="form1"  eventNo="e_query_catalog" inputs="catalogId:'$id$'" style="width:500px;">
     <TK:Table>
       <TK:Group>
         <TK:Textbox label="目录名：" name="name" required="true" />
       </TK:Group>
       <TK:Group>
         <TK:Textbox label="访问地址：" name="link_url" />
       </TK:Group>     
       <TK:Group>
          <TK:Buttonedit label="模板链接："  name="module_id"  id="module_id" allowInput="false">
          	<TK:Property dataType="popWindow" format="add_module" title="添加模块" displayName="添加模块"  width="800" height="580" callbackFunc="addModule" inputs="catalog_id:'$id$'"/>
          </TK:Buttonedit>
       </TK:Group>
      <TK:Group>
         <TK:Textbox label="排序值：" name="orderline" />
       </TK:Group> 
       <TK:Group>
            <TK:ComboBox label="栏目状态：" name="state" >
	 			<TK:Property dataType="select" format="state"/>
	 		</TK:ComboBox>
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
           <TK:Button displayName="修改" style="width:60px;margin-right:20px;" iconCls="icon-ok">
      <TK:Property function="submit" eventNo="e_edit_catalog" inputs="catalogId:'$id$'"  isValid="true" callbackFunc="freshTree" /> 
       </TK:Button>
           <TK:Button displayName="重置" function="reset" style="width:60px;" iconCls="icon-redo">
        <TK:Property function="reset"/> 
       </TK:Button>         
         </td>
       </TK:Group>
    </TK:Table> 
  </TK:Form>
<TK:Script>
<![CDATA[
   	 function freshTree(){ 
   		var node = window.Owner.mini.get("tree1").getSelectedNode();
    	window.Owner.$.tkui['tree1'].refresh(2);
        if(node){
        	setTimeout(function(){
        		window.Owner.mini.get("tree1").selectNode(node);
        	},300);
        }
     }
     function addModule(action,iframe)
     {
           var btnEdit = mini.get("module_id")
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
