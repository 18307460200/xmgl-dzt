<update tables="t_xmglxt_project_management">
   <bind name="update_date" value="@com.thinkive.base.mybatis.sql.MyBatisSQLHelper@getCurrentDate()"/>
  update t_xmglxt_project_management t  
  <set> 
    <if test="id!= null and id!=''">t.id= #{id},</if>  
    <if test="project_name!= null and project_name!=''">t.project_name= #{project_name},</if>  
    <if test="project_code!= null and project_code!=''">t.project_code= #{project_code},</if>  
    <if test="project_describe!= null and project_describe!=''">t.project_describe= #{project_describe},</if>  
    <if test="predict_money!= null and predict_money!=''">t.predict_money= #{predict_money},</if>  
    <if test="reality_money!= null and reality_money!=''">t.reality_money= #{reality_money},</if>  
    <if test="department!= null and department!=''">t.department= #{department},</if>  
    <if test="manager!= null and manager!=''">t.manager= #{manager},</if>  
    <if test="commerce!= null and commerce!=''">t.commerce= #{commerce},</if>  
    <if test="client_name!= null and client_name!=''">t.client_name= #{client_name},</if>  
    <if test="contract!= null and contract!=''">t.contract= #{contract},</if>  
    <if test="project_progress!= null and project_progress!=''">t.project_progress= #{project_progress},</if>  
    <if test="online_date!= null and online_date!=''">t.online_date= #{online_date},</if>  
    <if test="acceptance_date!= null and acceptance_date!=''">t.acceptance_date= #{acceptance_date},</if>  
    <if test="plan_online_date!= null and plan_online_date!=''">t.plan_online_date= #{plan_online_date},</if>  
    <if test="plan_report_date!= null and plan_report_date!=''">t.plan_report_date= #{plan_report_date},</if>  
    <if test="plan_acceptance_date!= null and plan_acceptance_date!=''">t.plan_acceptance_date= #{plan_acceptance_date},</if>  
    <if test="plan_acceptance_report_date!= null and plan_acceptance_report_date!=''">t.plan_acceptance_report_date= #{plan_acceptance_report_date},</if>  
    <if test="project_state!= null and project_state!=''">t.project_state= #{project_state},</if>  
    <if test="product_project_progress!= null and product_project_progress!=''">t.product_project_progress= #{product_project_progress},</if>  
    <if test="commerce_project_progress!= null and commerce_project_progress!=''">t.commerce_project_progress= #{commerce_project_progress},</if>  
    <if test="risk_label!= null and risk_label!=''">t.risk_label= #{risk_label},</if>  
    <if test="create_date!= null and create_date!=''">t.create_date= #{create_date},</if>  
    <if test="update_date!= null and update_date!=''">t.update_date= #{update_date},</if>
  </set>where id= #{id}
</update>