<select tables="t_xmglxt_project_management">select id,project_name,project_code,project_describe,predict_money,reality_money,department,manager,commerce,client_name,contract,project_progress,online_date,acceptance_date,plan_online_date,plan_report_date,plan_acceptance_date,plan_acceptance_report_date,project_state,product_project_progress,commerce_project_progress,risk_label,create_date,update_date from t_xmglxt_project_management t 
  <if test="sortField!= null and sortField!='' and sortOrder !=null and sortOrder !=''">  	    <bind name="orderby" value="@com.thinkive.base.mybatis.sql.MyBatisSQLHelper@orderByFilter(sortField,sortOrder)"/>    </if>
  <where> 
    <if test="id!= null and id!=''">and t.id= #{id}</if>  
    <if test="project_name!= null and project_name!=''">and t.project_name = #{project_name} </if>  
    <if test="project_code!= null and project_code!=''">and t.project_code= #{project_code}</if>  
    <if test="project_describe!= null and project_describe!=''">and t.project_describe= #{project_describe}</if>  
    <if test="predict_money!= null and predict_money!=''">and t.predict_money= #{predict_money}</if>  
    <if test="reality_money!= null and reality_money!=''">and t.reality_money= #{reality_money}</if>  
    <if test="department!= null and department!=''">and t.department= #{department}</if>  
    <if test="manager!= null and manager!=''">and t.manager= #{manager} </if>  
    <if test="commerce!= null and commerce!=''">and t.commerce = #{commerce} </if>  
    <if test="client_name!= null and client_name!=''">and t.client_name = #{client_name}' </if>  
    <if test="contract!= null and contract!=''">and t.contract= #{contract}</if>  
    <if test="project_progress!= null and project_progress!=''">and t.project_progress= #{project_progress}</if>  
    <if test="online_date!= null and online_date!=''">and t.online_date= #{online_date}</if>  
    <if test="acceptance_date!= null and acceptance_date!=''">and t.acceptance_date= #{acceptance_date}</if>  
    <if test="plan_online_date!= null and plan_online_date!=''">and t.plan_online_date= #{plan_online_date}</if>  
    <if test="plan_report_date!= null and plan_report_date!=''">and t.plan_report_date= #{plan_report_date}</if>  
    <if test="plan_acceptance_date!= null and plan_acceptance_date!=''">and t.plan_acceptance_date= #{plan_acceptance_date}</if>  
    <if test="plan_acceptance_report_date!= null and plan_acceptance_report_date!=''">and t.plan_acceptance_report_date= #{plan_acceptance_report_date}</if>  
    <if test="project_state!= null and project_state!=''">and t.project_state= #{project_state}</if>  
    <if test="product_project_progress!= null and product_project_progress!=''">and t.product_project_progress= #{product_project_progress}</if>  
    <if test="commerce_project_progress!= null and commerce_project_progress!=''">and t.commerce_project_progress= #{commerce_project_progress}</if>  
    <if test="risk_label!= null and risk_label!=''">and t.risk_label= #{risk_label}</if>  
    <if test="create_date!= null and create_date!=''">and t.create_date= #{create_date}</if>  
    <if test="update_date!= null and update_date!=''">and t.update_date= #{update_date}</if>
  </where>
  		<if test="sortField!= null and sortField!='' and sortOrder !=null and sortOrder !=''"> order by ${orderby} </if> 
  		<if test="sortField== null or sortField=='' or sortOrder ==null or sortOrder ==''"> order by t.update_date desc </if>
</select>