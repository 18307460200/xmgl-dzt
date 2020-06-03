<TK:Page>
     <div style="height:100%;overflow:auto">
  	<TK:Form id="form1" >
      <TK:Hidden name="is_use">
      		<TK:Property dataType="url" format="is_use" inputs="is_use:'0'"/>
      </TK:Hidden>
      	<TK:Fieldset displayName="运营管理信息">
			 <TK:Table>
				  <TK:Group>
				 	<TK:Textbox label="年度（在建项目）："  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"  name="project_describe" required="true" emptyText="2020" vtype="text;maxLength:40"/>
                    <TK:Textbox label="项目编码："		   labelStyle="width:120px;text-align:right;"	 tdStyle="width:100px;"  name="project_code" required="true" emptyText="项目编码" />
                    <TK:Textarea label="项目名称："	 	   labelStyle="width:120px;text-align:right;"	 tdStyle="width:100px;"  name="project_name"  vtype="text;maxLength:500"/>
				 </TK:Group>
              
                 <TK:Group>
                     <TK:Textbox label="客户：" 	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"  name="client_name"  emptyText="" vtype="text;maxLength:20"/>
                     <TK:ComboBox label="部门：" 	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="department" required="true">
                       <TK:Property dataType="select" format="xmgl_department"/>
                	</TK:ComboBox>
                    <TK:Textbox label="项目经理：" 	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"  name="manager"  emptyText="" vtype="text;maxLength:20"/>
				 </TK:Group>
               
				<TK:Group>
					 <TK:ComboBox label="是否特殊立项：" 	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="is_special_project" required="true">
                       <TK:Property dataType="select" format="xmgl_is_special_project"/>
                	</TK:ComboBox>
                   <TK:Datepicker labelField="true" 	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"     label="邮件写的合回笼订日期：" format="yyyy-MM-dd"  name="email_date"  />
                   <TK:Textbox label="产品类别："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="product_type"  emptyText="" vtype="text;maxLength:30"/>
				</TK:Group>
                <TK:Group>
                     <TK:ComboBox label="合同文本是否已回："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="contract" required="true">
                       <TK:Property dataType="select" format="xmgl_contract"/>
                	</TK:ComboBox>
                 	 <TK:Textbox label="合同预计金额："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="predict_money" required="true"  emptyText="请输入合同预计金额" vtype="numeric"/>
                     <TK:Textbox label="合同执行金额："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"    name="reality_money"  emptyText="请输入合同执行金额"  vtype="Numeric"/>
				</TK:Group>
               
               	<TK:Group>
                	<TK:Textbox label="商务："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="commerce"  emptyText="" vtype="text;maxLength:30"/>
                 	<TK:Datepicker labelField="true"     labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   label="合同签订时间：" format="yyyy-MM-dd"  name="contract_sign_date" />
					<TK:Textbox label="已收款金额："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="gathering_money_ok" required="true" emptyText="请输入收款金额"  vtype="number"/>
				</TK:Group>
              
               	<TK:Group>
                	<TK:Datepicker labelField="true"  	labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"    label="项目启动时间：" format="yyyy-MM-dd"  name="project_start_date" required="true"  />
                    <TK:Textbox label="付款方式：" 	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"  name="payment_way"  emptyText="" vtype="text;maxLength:30"/>
                    <TK:Textbox label="未收款金额："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="gathering_money_not"  emptyText="" vtype="Numeric" required="true" /> 
                </TK:Group>
               
               	<TK:Group>
                 	<TK:Datepicker labelField="true" 	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"     label="上线日期：" format="yyyy-MM-dd"  name="online_date"  />
                  	<TK:Datepicker labelField="true"  	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"    label="验收日期：" format="yyyy-MM-dd"  name="acceptance_date"  />
                    <TK:Textbox label="进度负责人："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="schedule_person"  emptyText="" vtype="text;maxLength:30"/>
                  </TK:Group>
               
               	<TK:Group>
                    <TK:Datepicker labelField="true"  	  labelStyle="width:150px;text-align:right;" tdStyle="width:80px;"   label="计划上线报告回笼日期：" format="yyyy-MM-dd"  name="plan_report_date"  />
                    <TK:Datepicker labelField="true"  	  labelStyle="width:150px;text-align:right;" tdStyle="width:80px;"   label="计划验收报告回笼日期：" format="yyyy-MM-dd"  name="plan_acceptance_date"  />
                    <TK:ComboBox label="项目状态："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"  	name="project_state" required="true">
                     	 <TK:Property dataType="select" format="xmgl_project_state"/>
                    </TK:ComboBox>
                </TK:Group>
               
               	<TK:Group>
					<TK:Textarea label="产品归属模块："	   labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="reference_data"  vtype="text;maxLength:500"/>
                    <TK:ComboBox label="风险标签："	  labelStyle="width:120px;text-align:right;" tdStyle="width:80px;"   name="risk_label">
                       <TK:Property dataType="select" format="xmgl_risk_label"/>
                	</TK:ComboBox>
                    <TK:ComboBox label="是否跟进："	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   name="is_follow" required="true">
                       <TK:Property dataType="select" format="xmgl_is_follow"/>
                	 </TK:ComboBox>
				</TK:Group>
               	<TK:Group>
                    <TK:Buttonedit label="产品归属：" 	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"  id="product_affiliation_id" name="product_affiliation_id" allowInput="false" colspan="2">
	         			<TK:Property dataType="popWindow" format="m_add_product_affiliation" title="产品归属" displayName="产品归属"   width="350" height="450" callbackFunc="addDept"/>
	        		</TK:Buttonedit>
				</TK:Group>
			</TK:Table>
 		  </TK:Fieldset>
      <br/>
     	  <TK:Fieldset displayName="产品部反馈信息">
            	 <TK:Table>
					<TK:Group>
                      	<TK:Textbox label="项目进度：" 	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"  	name="project_progress"  emptyText="" vtype="text;maxLength:20"/>
                   		<TK:Datepicker labelField="true"   	  labelStyle="width:120px;text-align:right;" tdStyle="width:100px;"   label="计划上线日期：" format="yyyy-MM-dd"  name="plan_online_date"  />
                    	<TK:Datepicker labelField="true"  	  labelStyle="width:130px;text-align:right;" tdStyle="width:80px;"   label="计划验收日期：" format="yyyy-MM-dd"  name="plan_acceptance_report_date"  />
                	</TK:Group>
                   	<TK:Group>
                        <TK:Textbox label="产品部反馈项目进度情况：" 	  labelStyle="width:165px;text-align:right;" tdStyle="width:80px;"  name="product_project_progress"  emptyText="" />
                      	<TK:Datepicker labelField="true"  	  labelStyle="width:150px;text-align:right;" tdStyle="width:80px;"   label="计划上线报告回笼日期：" format="yyyy-MM-dd"  name="plan_report_date"  />
                    	<TK:Datepicker labelField="true"  	  labelStyle="width:150px;text-align:right;" tdStyle="width:80px;"   label="计划验收报告回笼日期：" format="yyyy-MM-dd"  name="plan_acceptance_date"  />
					</TK:Group>
                 </TK:Table>
          </TK:Fieldset>
	<br/>
          <TK:Fieldset displayName="销售部反馈信息">
            	  <TK:Table>
                    	<TK:Group>
                            <TK:Textbox label="商务部反馈进度情况："	  labelStyle="width:150px;text-align:right;" tdStyle="width:80px;"   name="commerce_project_progress"  emptyText="" />
						</TK:Group>
                  </TK:Table>
          </TK:Fieldset>
         <TK:Table>
		 	<TK:Group>
		 		<td colspan="2" align="center">
		 			<TK:Button displayName="确定" style="width:60px;margin-right:20px;" iconCls="icon-ok">
		 				<TK:Property function="submit" eventNo="e_add_project" isAlert="true" filterFunc="paramVerify"  inputs="" alertMsg="是否提交？" isValid="true" isClose="true"/>
		 			</TK:Button> 
				   <TK:Button displayName="取消" iconCls="icon-cancel">
					   <TK:Property isClose="true"/>
					</TK:Button>
		 		</td>
		 	</TK:Group>
		</TK:Table>
		</TK:Form>
   </div>
    <TK:Script type="text/javascript">
<![CDATA[
	//保存时校验参数
	function paramVerify(){
		var project_code = mini.getbyName("project_code").getFormValue();	
		var project_code =  mini.getbyName("project_code").getFormValue();
		var predict_money = mini.getbyName("predict_money").getFormValue();	
		var reality_money =  mini.getbyName("reality_money").getFormValue();
		if(!$.string.isNumberFloat(predict_money)){
			mini.alert("合同预计金额,请输入数字"); 
			return false;
		}
		if(!$.string.isNumberFloat(reality_money)){
			mini.alert("合同金额,请输入数字"); 
			return false;
		}
		return true;
	}

	function addDept(action,iframe)
    {
    	var btnEdit = mini.get("product_affiliation_id");
        if (action == "ok") 
        {
        	var data = iframe.contentWindow.getData(); 
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
            	btnEdit.setValue(pid);
             	btnEdit.setText(name); 
          	}
   		}
     }
//页面初始化后加载
 $.tkReady=function(){ 
    
   }
]]>
</TK:Script>
</TK:Page>