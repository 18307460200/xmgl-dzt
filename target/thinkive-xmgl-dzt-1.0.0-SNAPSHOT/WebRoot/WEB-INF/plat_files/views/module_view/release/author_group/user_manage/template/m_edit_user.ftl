<TK:Page>
	<TK:Form id="form1"  eventNo="e_query_userinfo" inputs="user_id:'$user_id$'" loadDataCallBackFunc="loadDataCallBackFunc">
		 <TK:Fieldset displayName="基本信息">
			<TK:Table>
				<input id="user_id" class="mini-hidden"/>
			 	<input id="info_id" class="mini-hidden"/>
			 	<input id="type" name="type" class="mini-hidden"/>
			 	<TK:Group>
			 		<TK:Textbox label="用户姓名："  name="name"  required="true" emptyText="请输入姓名"/> 
			 		<TK:Textbox label="员工编号："  name="employee_no"  emptyText="请输入员工编号"/>
			 	</TK:Group> 
			 	<TK:Group>
			 		<TK:radiolist label="性别：" name="sex" valueField="item_value" textField="item_name" value="1" >
			 			<TK:Property dataType="select" format="sex"/>
			 		</TK:radiolist> 
			 		<TK:Datepicker label="生日：" name="birthday"  vtype="yyyy-MM-dd" format="yyyy-MM-dd" emptyText="请选择日期" alwaysView="true"/>
			 	</TK:Group>
			 	<TK:Group>
			 		<TK:ComboBox label="商户信息：" name="merchant_no" id="merchant_no" emptyText="请选择商户信息" required="true" showNullItem="false" allowInput="true">
			 			<TK:Property dataType="select" format="merchant_no"/>
			 		</TK:ComboBox>
			 		<TK:ComboBox label="系统用户：" name="is_system" emptyText="请选择系统用户" required="true" showNullItem="false" allowInput="true">
			 			<TK:Property dataType="select" format="is_system_user"/>
			 		</TK:ComboBox>
			 	</TK:Group>
				<TK:Group>
					<TK:ComboBox label="营业部信息：" name="orgno" emptyText="请选择营业部信息"  showNullItem="true" allowInput="true">
			 			<TK:Property dataType="select" format="branch_id"/>
			 		</TK:ComboBox>
			 		<TK:Textbox label="手机号码：" name="mobile_phone" vtype="mobile;maxLength:11;minLength:11" />
			 	</TK:Group>
			 	<TK:Group>
			 		<TK:Textbox label="联系电话：" name="telephone" />
			 		<TK:Textbox label="邮箱："  name="email" vtype="email"  />
			 	</TK:Group>
			 	<TK:Group>
			 		<TK:Buttonedit label="所属角色：" id="role_id" name="role_id" allowInput="false" colspan="2">
	         			<TK:Property dataType="popWindow" format="m_add_role" title="添加角色" displayName="添加角色" inputs="role_id:'$role_id$'" width="800" height="580" callbackFunc="addRole"/>
	        		</TK:Buttonedit>
	        	</TK:Group>
			 	<TK:Group>
			 		<TK:Buttonedit label="所属岗位：" id="post_id" name="post_id" allowInput="false" required="true" colspan="2">
	         			<TK:Property dataType="popWindow" format="m_add_dept" title="归属岗位" displayName="归属岗位"  width="350" height="450" callbackFunc="addDept"/>
	        		</TK:Buttonedit>
			 	</TK:Group> 
			 	<TK:Group >
			 		<TK:Textbox label="住址：" name="address" colspan="2"/>
			 	</TK:Group>
			</TK:Table>
		</TK:Fieldset>
		<TK:Fieldset displayName="账号信息">
			 <TK:Table>
			 	<TK:Group>
			 		<TK:Textbox label="登录账号："  name="login_id" allowInput="false" emptyText="请输入帐号"/>
			 		<TK:radiolist label="状态：" name="state" valueField="item_value" textField="item_name" repeatItems="3" repeatLayout="table" value="1" >
			 			<TK:Property dataType="select" format="user_state" />
			 		</TK:radiolist>
			 	</TK:Group> 
			</TK:Table>
		</TK:Fieldset>
		<div style="text-align:center;padding:10px;">               
             <TK:Button displayName="修改"  style="width:60px;margin-right:20px;" iconCls="icon-ok">
           		<TK:Property function="submit" eventNo="e_edit_user"  isValid="true" isClose="true"/>
           	</TK:Button>         
            <TK:Button displayName="取消"  iconCls="icon-cancel" >
            	<TK:Property isClose="true"/>
            </TK:Button>         
        </div>  
	</TK:Form>
<TK:Script>
<![CDATA[	
  	mini.parse();
  	function loadDataCallBackFunc(e){
  		if($.string.isEmpty(e.login_id)){ 
  			mini.getbyName("type").setValue("add");
  		}else{
  			mini.getbyName("type").setValue("edit");
  		}
  		var is_system = e.is_system;
  		if(is_system ==1){
  			
  		}else{
  			var merchant_no = mini.get("merchant_no");
  			merchant_no.setText(e.merchant_no);
  			merchant_no.setValue(e.merchant_no);
  			merchant_no.disable();
  		}
  		mini.parse();
  	}
  
	function addRole(action,iframe)
    {
    	var btnEdit = mini.get("role_id")
        if (action == "ok") 
        {
        	var data = iframe.contentWindow.getData();
            data = mini.clone(data);    //必须
            if (data) 
            {
            	var ids = [];
            	var names = [];
                for (var i = 0, l = data.length; i < l; i++) 
                {
                   var r = data[i];
                   ids.push(r.role_id);
                   names.push(r.name);
                }
                   var id = ids.join(',');
                   var name = names.join(',');
            	btnEdit.setValue(id);
             	btnEdit.setText(name);
          	}
   		}
     }
     
     function addDept(action,iframe)
    {
    	var btnEdit = mini.get("post_id");
        if (action == "ok") 
        {
        	var data = iframe.contentWindow.getData();
            data = mini.clone(data);    //必须
            if (data) 
            {	
            	var id ="";
            	var pid ="";
            	var name ="";
            	for(var i=0;i < data.length;i++){
            		id += data[i].id+",";
            		pid += data[i].pid+",";
            		name += data[i].name+",";
            	}
            	id = id.substring(0,id.length-1);
            	pid = pid.substring(0,pid.length-1);
            	name = name.substring(0,name.length-1);
            	btnEdit.setValue(id+':'+pid);
             	btnEdit.setText(name); 
          	}
   		}
     }
     ]]>
</TK:Script>
</TK:Page>
