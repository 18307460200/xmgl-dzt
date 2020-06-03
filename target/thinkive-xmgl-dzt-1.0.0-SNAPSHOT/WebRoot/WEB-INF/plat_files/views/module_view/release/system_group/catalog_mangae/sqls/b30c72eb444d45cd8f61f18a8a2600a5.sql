 <insert>
   <bind name="info_id" value='@java.util.UUID@randomUUID().toString().replace("-", "")' />
  insert into T_PLAT_USER_INFO (info_id,user_id,email,age,info1,address)
  values ('${info_id}',#{tk_public_id},#{password},#{state},#{login_id},#{create_by})
</insert>