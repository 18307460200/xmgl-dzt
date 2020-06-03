
<select tables="t_base_module_sql">select sql_id,module_id,datasource,sql_type,sql_value,orderline,create_by,create_date,modified_by,modified_date,result_type,result_number,event_id from t_base_module_sql t 
  <where> 
    <if test="sql_id!= null and sql_id!=''">and t.sql_id= #{sql_id}</if>  
    <if test="module_id!= null and module_id!=''">and t.module_id= #{module_id}</if>  
    <if test="datasource!= null and datasource!=''">and t.datasource= #{datasource}</if>  
    <if test="sql_type!= null and sql_type!=''">and t.sql_type= #{sql_type}</if>  
    <if test="sql_value!= null and sql_value!=''">and t.sql_value= #{sql_value}</if>  
    <if test="orderline!= null and orderline!=''">and t.orderline= #{orderline}</if>  
    <if test="create_by!= null and create_by!=''">and t.create_by= #{create_by}</if>  
    <if test="create_date!= null and create_date!=''">and t.create_date= #{create_date}</if>  
    <if test="modified_by!= null and modified_by!=''">and t.modified_by= #{modified_by}</if>  
    <if test="modified_date!= null and modified_date!=''">and t.modified_date= #{modified_date}</if>  
    <if test="result_type!= null and result_type!=''">and t.result_type= #{result_type}</if>  
    <if test="result_number!= null and result_number!=''">and t.result_number= #{result_number}</if>  
    <if test="event_id!= null and event_id!=''">and t.event_id= #{event_id}</if>
  </where>
</select>
