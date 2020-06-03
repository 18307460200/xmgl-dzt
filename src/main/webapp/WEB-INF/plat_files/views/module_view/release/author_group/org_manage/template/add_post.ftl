<TK:Page> 
<TK:DataGrid id="datagrid1" eventNo="e_query_all_post" inputs="dept_id:'$id$'" pageSize="20"  isLoad="true" isPage="true" >
              <TK:Toolbar> 
                    <TK:Group style="width:100%;"> 
                      	<TK:Hidden name="dept_id">
                          	<TK:Property dataType="url" format="id"/> 
                        </TK:Hidden>
                        <TK:Button displayName="新增" iconCls="icon-add" plain="true" >
                          	 <TK:Property function="submit" eventNo="e_add_post" isMulSelect="true"  inputs="post_id:''" paramFunc="getParam" isClose="true"/>
                        </TK:Button>
                        <TK:Button displayName="刷新" iconCls="icon-reload" plain="true"> 
                            <TK:Property function="refresh"/>
                        </TK:Button>
                     </TK:Group>
              </TK:Toolbar>
              <TK:Fields>
                  <TK:Field type="checkcolumn" allowSort="false"></TK:Field>
                  <TK:Field field="post_name" displayName="岗位名称" width="120"/>
                  <TK:Field field="post_type" displayName="岗位类型" width="120" dataType="select" format="post_type"/>
                  <TK:Field field="create_by" displayName="创建人" width="120"/>
                	<TK:Field field="create_date" displayName="创建时间" width="120"/>
                  <TK:Field field="modified_by" displayName="最后修改人" width="120"/>
                 <TK:Field field="modified_date" displayName="最后修改时间" width="120"/>
               </TK:Fields>
            </TK:DataGrid >
  <TK:Script>
    	function getParam()
    	{
    		return {'dept_id':mini.getParams().id};
    	}
   </TK:Script>
 </TK:Page> 
