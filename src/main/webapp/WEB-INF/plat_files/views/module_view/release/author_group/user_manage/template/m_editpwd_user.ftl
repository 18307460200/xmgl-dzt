<TK:Page>
	<TK:Form id="form1">
		 <TK:Table>
		 	<TK:Group>
		 		<TK:Password  label="输入新密码："  name="password"   required="true" vtype="strongPwd"/>
		 	</TK:Group>
		 	<TK:Group>
		 		<TK:Password  label="确认新密码："  name="password2"   required="true" vtype="strongPwd"/>
		 	</TK:Group>
		</TK:Table>
		<div style="text-align:center;padding:10px;">               
            <TK:Button displayName="修改"  style="width:60px;margin-right:20px;" iconCls="icon-ok">
           		<TK:Property function="submit" eventNo="e_edit_password" paramFunc="getParam"  isValid="true" isClose="true" inputs="user_id:''"/>
           	</TK:Button>         
            <TK:Button displayName="取消"  iconCls="icon-cancel" >
            	<TK:Property isClose="true"/>
            </TK:Button>       
        </div>  
	</TK:Form>
<TK:Script>
  <![CDATA[	
	 
     function getParam(){
     	var param = new Object(); 
		var password = $.string.trim2(mini.getbyName("password").getValue());
		var password2 = $.string.trim2(mini.getbyName("password2").getValue());
		var isEncrypt = $.gconfig.global.pwd_is_encrypt;
		if($.string.isNotEmpty(isEncrypt) && '1' === isEncrypt)
		{
			var getRsaPubKey = $.gconfig.global.getRsaPubKey || "";
			var paraMap = new Object();
			paraMap["getRsaPubKey"] = "getRsaPubKey";
			FrameService.getInstance().processSubmit(function(resultVo){
				if(resultVo && resultVo!=null){
					if(resultVo.getErrorNo() == 0){
						var result = resultVo.getResults();
						modulus = result["modulus"];
						publicExponent = result["publicExponent"]; 
						password = $.crypto.sm2.encrypt(modulus,publicExponent,password);
						password2 = $.crypto.sm2.encrypt(modulus,publicExponent,password2);
						password = "encrypt_sm2:"+password;
						password2 = "encrypt_sm2:"+password2;
					}
				}
			
			},"", paraMap, null, null, false, getRsaPubKey);
		}
		param.password = password;
		param.password2 = password2; 
		return param;
     } 
     ]]>
</TK:Script>
</TK:Page>
