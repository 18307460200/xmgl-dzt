<TK:Page>
	<TK:Form id="form1"  eventNo="e_query_userinfo" inputs="user_id:'$user_id$'">
		 <TK:Fieldset displayName="基本信息">
			<TK:Table>
				<input id="user_id" class="mini-hidden"/>
			 	<input id="info_id" class="mini-hidden"/>
			 	<TK:Group>
			 		<TK:Textbox label="用户姓名："  name="name"  required="true"  enabled="false"/> 
			 		<TK:Textbox label="员工编号："  name="employee_no"  enabled="false" /> 
				</TK:Group>
			 	<TK:Group>
					<TK:radiolist label="性别：" name="sex" valueField="item_value" textField="item_name" value="1"  enabled="false">
			 			<TK:Property dataType="select" format="sex"/>
			 		</TK:radiolist>
			 		<TK:Datepicker label="生日：" name="birthday"  vtype="yyyy-MM-dd" format="yyyy-MM-dd" enabled="false"/>
				</TK:Group>
				<TK:Group>
			 		<TK:ComboBox label="商户信息：" name="merchant_no"  required="true" showNullItem="false" enabled="false">
			 			<TK:Property dataType="select" format="merchant_no"/>
			 		</TK:ComboBox>
			 		<TK:ComboBox label="系统用户：" name="is_system"  required="true" showNullItem="false" enabled="false">
			 			<TK:Property dataType="select" format="is_system_user"/>
			 		</TK:ComboBox>
			 	</TK:Group>
				<TK:Group>
			 		<TK:ComboBox label="营业部信息：" name="orgno"  showNullItem="true" enabled="false">
			 			<TK:Property dataType="select" format="branch_id"/>
			 		</TK:ComboBox>
			 		<TK:Textbox label="手机号码：" name="mobile_phone" vtype="mobile;maxLength:11;minLength:11"  enabled="false"/>
			 	</TK:Group>
			 	<TK:Group>
			 		<TK:Textbox label="联系电话：" name="telephone" enabled="false"/>
			 		<TK:Textbox label="邮箱："  name="email" vtype="email"  enabled="false"/>
			 	</TK:Group>
			 	<TK:Group>
			 		<TK:Buttonedit label="所属角色：" id="role_id" name="role_id" showButton="false" colspan="2" enabled="false">
	         			<TK:Property dataType="popWindow" format="m_add_role" title="添加角色" displayName="添加角色"    width="800" height="580"  />
	        		</TK:Buttonedit>
	        	</TK:Group>
			 	<TK:Group>
			 		<TK:Buttonedit label="所属岗位：" id="post_id" name="post_id" showButton="false" colspan="2" enabled="false">
	         			<TK:Property dataType="popWindow" format="m_add_dept" title="归属岗位" displayName="归属岗位"    width="350" height="450"  />
	        		</TK:Buttonedit>
			 	</TK:Group>
			 	<TK:Group>
			 		<TK:Textbox label="所属部门：" name="dept_name" colspan="2" enabled="false"/> 
			 	</TK:Group>
			 	 <TK:Group >
			 		<TK:Textbox label="住址：" name="address" colspan="2" enabled="false"/>
			 	</TK:Group>
			</TK:Table>
		</TK:Fieldset>
		<TK:Fieldset displayName="账号信息">
			 <TK:Table>
			 	<TK:Group>
			 		<TK:Textbox label="登录账号："  name="login_id"  enabled="false"/>
			 		<TK:radiolist label="状态：" name="state" valueField="item_value" textField="item_name" enabled="false" >
			 			<TK:Property dataType="select" format="user_state"/>
			 		</TK:radiolist>
			 	</TK:Group>
			</TK:Table>
		</TK:Fieldset> 
	</TK:Form>
</TK:Page>
