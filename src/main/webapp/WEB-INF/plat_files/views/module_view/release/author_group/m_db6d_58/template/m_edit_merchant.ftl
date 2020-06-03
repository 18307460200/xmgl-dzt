<TK:Page>
	<TK:Form id="form1" eventNo="e_query_merchant" inputs="merchant_id:'$merchant_id$'">
		 <TK:Fieldset displayName="商户基本信息">
			<TK:Table>
				<TK:Hidden name="merchant_id" id="merchant_id"/>
			 	<TK:Group>
			 		<TK:Textbox label="商户名称："  name="merchant_name"  required="true" emptyText="请输入商户名称"/> 
			 	</TK:Group> 
			 	<TK:Group>
			 		<TK:Textbox label="商户编号："  name="merchant_no" allowInput="false" required="true" emptyText="请输入商户编号(小写英文字母)"/> 
			 	</TK:Group>
			 	<TK:radiolist label="状态：" name="status"  repeatItems="3" repeatLayout="table" value="1" >
			 			<TK:Property dataType="select" format="merchant_status" />
			 		</TK:radiolist>
			 	<TK:Group>
			 		<TK:Datepicker label="注册时间：" name="register_date" emptyText="请选择日期" alwaysView="true"/>
			 	</TK:Group>
			 	<TK:Group>
			 		<TK:Datepicker label="有效期：" name="expiry_date"  vtype="yyyy-MM-dd" format="yyyy-MM-dd" emptyText="请选择日期" alwaysView="true"/>
			 	</TK:Group> 
			 	<TK:Group >
			 		<TK:Textbox label="描述：" name="description"  />
			 	</TK:Group>
			</TK:Table>
		</TK:Fieldset>
		<TK:Fieldset displayName="商户安全信息">
			 <TK:Table>
			 	<TK:Group>
			 		<TK:Textbox label="签名KEY："  name="sign_key" vtype="maxLength:32"  emptyText="请输入签名key"/>
			 	</TK:Group> 
			 	<TK:Group>
			 		<TK:Textbox label="数据加密KEY："  name="encrypt_key"  vtype="maxLength:32" emptyText="请输入数据加密key"/>
			 	</TK:Group> 
			</TK:Table>
		</TK:Fieldset>
		<div style="text-align:center;padding:10px;">               
             <TK:Button displayName="保存"  style="width:60px;margin-right:20px;" iconCls="icon-ok">
           		<TK:Property function="submit" eventNo="e_edit_merchant" inputs="merchant_id:'$merchant_id$'" isValid="true" isClose="true"/>
           	</TK:Button>         
            <TK:Button displayName="取消"  iconCls="icon-cancel" >
            	<TK:Property isClose="true"/>
            </TK:Button>         
        </div>  
	</TK:Form>																								
</TK:Page>
