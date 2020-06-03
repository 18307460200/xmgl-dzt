 <insert>
   <bind name="tk_public_id" value='@java.util.UUID@randomUUID().toString().replace("-", "")' />
  insert into t_plat_user (user_id,login_id,password,name,state,create_by)
  values (#{tk_public_id},#{login_id},#{password},#{name},#{state},#{create_by})
</insert>