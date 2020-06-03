<TK:Page>
	<style type="text/css">  
		.dc_list h3 {
		    padding: 0 0 0 12px;
		    height: 28px;
		    line-height: 28px;
		    color: #074895;
		    background: #ebebeb;
		    font-size: 14px;
		    font-weight: bold;
		}
		.dc_list .con {
		    padding: 14px 0 14px 20px;
		    overflow: hidden;
		}
		.dc_itspan {
		    display: block;
		    width: 100%;
		    height: 30px;
		    line-height: 26px;
		    margin-bottom: 4px;
		    overflow: hidden;
		}
		.dc_itspan .dc_text {
		    display: inline-block;
		}
		.dc_enter {
		    padding: 20px 0 0 0;
		    margin-top: 8px;
		    text-align: center; 
		    overflow: hidden;
		} 
    </style> 
	<TK:Form id="form1">
		<TK:Fieldset displayName="选择导入的数据字典类型" style="font-size: 14px;line-height: 40px;border-width:1px">
			 <div class="fieldset-body">
				<span class="dc_itspan">
					<label> <input type="radio" name="RadioGroup1" value="1" checked="checked" /> 全量导入</label>
				</span>
				<span class="dc_itspan" style="height:50px;">
					<label> <input type="radio" name="RadioGroup1" value="2"  /> 单个类型</label>
					<span class="dc_text"> 
						<TK:ComboBox  name="dict_sort"  id="dict_sort" emptyText="请选择..." nullItemText="请选择..." allowInput="flase">
	 						<TK:Property dataType="select" format="dict_sort"/>
	 					</TK:ComboBox>
					</span>
				</span>
				
			</div>
		</TK:Fieldset>
		
		<TK:Fieldset displayName="上传文件" style="font-size: 14px;line-height: 40px;border-width:1px">
			<div class="fieldset-body">
				<span class="dc_itspan" style="height:50px;"><label> 上传文件：</label>
					<span class="dc_text"> 	<TK:Upload  name="dict_url"   labelStyle="width:120px;text-align:right;"   >
                        <TK:Property bcode="png_upload" width="600" height="400"/>
                    </TK:Upload >
					</span>
				</span>
			</div>
		</TK:Fieldset>
		<div class="dc_enter">
		   <div class="lit" style="width: 100%;text-align:center;">
		      <TK:Button displayName="添加" style="width:60px;margin-right:20px;" iconCls="icon-ok">
           <TK:Property function="submit"  eventNo="e_imp_dict"  isValid="true" paramFunc = "getParam" isClose="true"/> 
           </TK:Button>         
                 <TK:Button displayName="关闭"  style="width:60px;" iconCls="icon-redo">
                 <TK:Property isClose="true"/>
                </TK:Button>  
		   </div>
		</div>
	</TK:Form>
 <TK:Script>
<![CDATA[
	$.tkReady=function()
    {
    	mini.parse(); 
    	var params = mini.getParams();
    	var id = params.id;
    	var type = params.type;
    	var data = mini.get("dict_sort").getData();
    	if(data.length>0 && typeof(id)!='undefined' && type=='S')
    	{
    		$("input[type='radio'][value='2']").prop("checked", "checked");
    		mini.get("dict_sort").setValue(id);
    	}else{
    		mini.get("dict_sort").setEnabled(false);
    	}
		$("input[type='radio']").change(function(){
			var stype = parseInt($(this).val());
			switch(stype){
				case 1 :{
					noEditable();
					break;
				};
				case 2 :{
					editable();
					break;
				};
			};
		});
    }
     	function noEditable()
     	{
     		mini.get("dict_sort").setEnabled(false);
     	}
     	function editable()
     	{
     		mini.get("dict_sort").setEnabled(true);
     	}
     	function getParam()
		{
			var param = {};
		 	param.dict_type = $("input[type='radio']:checked").val();
		 	return param;
		}
	
]]>
</TK:Script>
</TK:Page>
