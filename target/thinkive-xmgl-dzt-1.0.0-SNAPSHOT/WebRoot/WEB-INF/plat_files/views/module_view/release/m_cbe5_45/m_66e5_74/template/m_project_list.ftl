<TK:Page>
        <TK:DataGrid id="datagrid1"  eventNo="e_query_project" inputs="" isPage="true" pageSize="20" loadDataCallBackFunc="loadDataCallBackFunc">
              <TK:Toolbar> 
                  <TK:Form>
                    	 <TK:Group>
            			<TK:TextBox labelField="true" label="项目名称："  name="project_name"  id="project_name" labelWidth="100" style="width:155;display:inline-block"/>   
         			 </TK:Group>
                   	 <TK:Group>
            			<TK:ComboBox labelField="true"  labelWidth="120" label="管理归属产品部："  showNullItem="true" nullItemText="——全部——"  emptyText="——全部——" id="department" name="department" style="width:155;display:inline-block;">
							<TK:Property dataType="select"  format="xmgl_department"/>
				 		</TK:ComboBox>  
         			 </TK:Group>
                  	 <TK:Group >
            			<TK:TextBox labelField="true" label="项目经理："  name="manager"  id="manager" labelWidth="100" style="width:155;display:inline-block"/>   
         			 </TK:Group>
                     <TK:Group >
            			<TK:TextBox labelField="true" label="商务："  name="commerce"  id="commerce" labelWidth="100" style="width:155;display:inline-block"/>   
         			 </TK:Group>
                     <TK:Group >
            			<TK:TextBox labelField="true" label="客户："  name="client_name"  id="client_name" labelWidth="100" style="width:155;display:inline-block"/>   
         			 </TK:Group>
                    <div></div>
                     <TK:Group >
            			<TK:TextBox labelField="true" label="进度负责人："  name="schedule_person"  id="schedule_person" labelWidth="100" style="width:155;display:inline-block"/>   
         			 </TK:Group>
                     <TK:Group >
            			<TK:ComboBox labelField="true"  labelWidth="120" label="是否跟进："  showNullItem="true" nullItemText="——全部——"  emptyText="——全部——" id="is_follow" name="is_follow" style="width:155;display:inline-block;">
							<TK:Property dataType="select"  format="xmgl_is_follow"/>
				 		</TK:ComboBox>     
         			 </TK:Group>
                     <TK:Group >
            			<TK:TextBox labelField="true" label="项目风险："  name="project_rike_label"  id="project_rike_label" labelWidth="100" style="width:155;display:inline-block"/>   
         			 </TK:Group>
               		 <TK:Group>
            			<TK:ComboBox labelField="true"  labelWidth="120" label="产品归属："  showNullItem="true" nullItemText="——全部——"  emptyText="——全部——" id="product_affiliation_name" name="product_affiliation_name" style="width:155;display:inline-block;">
							<TK:Property dataType="select"  format="xmgl_department"/>
				 		</TK:ComboBox>  
         			 </TK:Group>
                    <TK:Group >
            			<TK:TextBox labelField="true" label="项目编号："  name="project_code"  id="project_code" labelWidth="100" style="width:155;display:inline-block"/>   
         			 </TK:Group>
                  	<TK:Group>
                           <TK:Button displayName="查询" iconCls="icon-redo">
                       	       <TK:Property function="query" isSelect="false" isMulSelect="false" inputs="" />
                            </TK:Button>
               		</TK:Group>
                	 <div></div>
                    <TK:Group style="width:100%;"> 
                        <TK:Button displayName="新增" iconCls="icon-add" plain="true" id="xmgl_add_project" name="xmgl_add_project">
                          <TK:Property function="popWindow" templateNo="m_add_project" title="添加项目"  width="1000" height="600" refreshMode="0"/>
                        </TK:Button>
                      
                         <TK:Button displayName="修改" iconCls="icon-edit" plain="true">
                                  <TK:Property type="right" function="popWindow"  isSelect="true"  templateNo="m_edite_project" title="修改项目" width="1000" height="600" inputs="id:'$id$'" refreshMode="0"/>
                         </TK:Button>

                        <TK:Button displayName="删除" iconCls="icon-remove" plain="true"  id="xmgl_delete_project" >
                        	<TK:Property function="submit" isMulSelect="true" eventNo="e_delete_project" inputs="id:'$id$'" isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
                        </TK:Button>
                      
                       <TK:Button displayName="Excel导入" iconCls="icon-upload" plain="true" id="xmgl_upload_excel">
                       	 <TK:Property function="uploadExcel" templateNo="m_upload_excel" title="新增项目-Excel导入" inputs=""  width="550" height="240" isReLoad="true"/>
                       </TK:Button>
                       
                        <TK:Button displayName="导出" iconCls="icon-download"> 
                       			<TK:Property function="export" paramFunc="getParamsDownload" /> 
                        </TK:Button> 
                        <TK:Button displayName="刷新" iconCls="icon-reload" plain="true"> 
                            <TK:Property function="refresh"/>
                        </TK:Button>
                     </TK:Group>
               </TK:Form>
              </TK:Toolbar>
              <TK:Fields>
                 <TK:Field type="checkcolumn" allowSort="false"></TK:Field>
                 <TK:Field field="id" displayName="ID" width="110"  visible="false" align="center" allowSort="true" />
                 <TK:Field field="product_affiliation_id" displayName="product_affiliation_id" width="110"  visible="false" align="center" allowSort="true" />
                
                 <TK:Field field="project_describe" displayName="年度(在建项目)" width="80" allowSort="true"/>
                 <TK:Field field="project_code" displayName="项目编号" width="120" allowSort="true"/>
                 <TK:Field field="project_name" displayName="项目名称" width="120" allowSort="true"/>
                 <TK:Field field="predict_money" displayName="合同预计金额" width="100" allowSort="true"/>
                 <TK:Field field="reality_money" displayName="合同金额" width="100" allowSort="true"/>
                 <TK:Field field="department" displayName="管理归属产品部" width="100" dataType="select" format="xmgl_department" allowSort="true"/>
                 <TK:Field field="manager" displayName="项目经理" width="100"  allowSort="true"/>
                 <TK:Field field="commerce" displayName="商务" width="100" allowSort="true"/>
                 <TK:Field field="client_name" displayName="客户" width="100" allowSort="true"/>
                 <TK:Field field="contract" displayName="合同文本是否已回" width="120" dataType="select" format="xmgl_contract" allowSort="true"/>
                 <TK:Field field="project_progress" displayName="项目进度" width="100" allowSort="true"/>
                 <TK:Field field="online_date" displayName="上线日期" width="100" allowSort="true"/>
                 <TK:Field field="acceptance_date" displayName="验收日期" width="100"/>
                 <TK:Field field="plan_online_date" displayName="计划上线日期" width="120"/>
                 <TK:Field field="plan_report_date" displayName="计划上线报告回笼日期" width="120"/>
                 <TK:Field field="plan_acceptance_date" displayName="计划验收日期" width="120"/>
                 <TK:Field field="plan_acceptance_report_date" displayName="计划验收报告回笼日期" width="120"/>
                 <TK:Field field="project_state" displayName="项目状态" width="100" dataType="select" format="xmgl_project_state"/>
                 <TK:Field field="product_project_progress" displayName="产品部反馈项目进度情况" width="120"/>
                 <TK:Field field="commerce_project_progress" displayName="商务部反馈进度情况" width="120"/>
                
                 <TK:Field field="project_day" displayName="项目实施天数" width="120"/>
                 <TK:Field field="project_rike_label" displayName="项目风险" width="120"/>
                 <TK:Field field="project_progress_update" displayName="项目进度更新时间" width="120"/>
                 <TK:Field field="product_project_progress_update" displayName="产品部项目反馈情况更新时间" width="120"/>
                 <TK:Field field="commerce_project_progress_update" displayName="商务部项目反馈情况更新时间" width="120"/>
                
                 <TK:Field field="reference_data" displayName="产品归属模块" width="120"/>
                 <TK:Field field="project_start_date" displayName="项目启动时间" width="120"/>
                 <TK:Field field="contract_sign_date" displayName="合同签订时间" width="120"/>
                 <TK:Field field="payment_way" displayName="付款方式" width="120"/>
                 <TK:Field field="gathering_money_ok" displayName="已收款金额" width="120"/>
                 <TK:Field field="gathering_money_not" displayName="未收款金额" width="120"/>
                 <TK:Field field="top_thread_report_date" displayName="上线报告实际回笼时间" width="120"/>
                 <TK:Field field="acceptance_report_date" displayName="验收报告实际回笼时间" width="120"/>
                 <TK:Field field="is_follow" displayName="是否跟进" width="100" dataType="select" format="xmgl_is_follow"/>
                 <TK:Field field="schedule_person" displayName="进度负责人" width="120"/>
                 <TK:Field field="is_special_project" displayName="是否特殊立项" width="120" dataType="select" format="xmgl_is_special_project"/>
                 <TK:Field field="email_date" displayName="邮件写的合同回笼日期" width="100" />
                 <TK:Field field="product_type" displayName="产品类别" width="120"/>
                
                 <TK:Field field="update_date" displayName="更新日期" width="180"/>
                <TK:Field displayName="产品归属">
		   			<TK:Property function="popWindow"  templateNo=""  paramFunc='getShenHeParams'  title="查看" displayName="查看" width="800" height="250" />
		   		</TK:Field>
               </TK:Fields>
          </TK:DataGrid >  
  <TK:Script> 
  <![CDATA[
		function uploadExcel(param){
			mini.parse();
            var grid = mini.get("datagrid1");
			var frameService = FrameService.getInstance();
			function ondestroyCallBack(){
				grid.load();
			}
			frameService.popWindow("新增项目-Excel导入", "m_upload_excel",param,550,240,false, null,ondestroyCallBack);
		}

        $(function(){ 
			debugger;
			//获取当前登录id
            var login_id="${Session["@session_base_login_id"]}";
            if( login_id == "admin"){
               $("#xmgl_add_project").show();
               $("#xmgl_upload_excel").show();
               $("#xmgl_delete_project").show();
            }else{
			   $("#xmgl_add_project").hide();
               $("#xmgl_upload_excel").hide();
               $("#xmgl_delete_project").hide();
            }
        });
		
		function loadDataCallBackFunc(e){
            if(e.login_id == "admin"){ 
				
            }else{
               
            }
            mini.parse();
  		}		

		function getParamsDownload(){
	          	    mini.parse();
	          	    var param = new Object()
	          	    
	          	    param.department = mini.getbyName("department").value;
 					param.manager = mini.getbyName("manager").value;
					param.commerce = mini.getbyName("commerce").value;	
	          	    param.client_name = encodeURI(encodeURI(mini.getbyName("client_name").value));
					param.commerce = encodeURI(encodeURI(mini.getbyName("commerce").value));
					param.project_name = encodeURI(encodeURI(mini.getbyName("project_name").value));
	          	    return param;
	        }
			function getShenHeParams(){
					debugger;
					mini.parse();
					var grid=mini.get("datagrid1");
					var data=grid.getSelected();
 					var param = new Object();   
//                  param.product_affiliation_id=encodeURIComponent(encodeURIComponent(data.product_affiliation_id)); 
					param.product_affiliation_id=data.product_affiliation_id; 

                    param["template_no"]='m_show_product_affiliation';
	          	    return param;
	        }
     ]]>
</TK:Script> 
</TK:Page>