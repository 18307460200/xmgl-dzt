<TK:Page> 
<TK:DataGrid id="datagrid1" eventNo="e_query_all_post" pageSize="20"  isLoad="true" isPage="true" >
              <TK:Toolbar> 
                    <TK:Group style="width:100%;">    
                        <TK:Button displayName="新增" iconCls="icon-add" plain="true" >
							<TK:Property function="popWindow"  templateNo="m_add_post" title="添加岗位"  width="400" height="220"/>
                        </TK:Button>
                        <TK:Button displayName="编辑" iconCls="icon-edit" plain="true">
                          <TK:Property function="popWindow"  isSelect="true" templateNo="m_edite_post" title="修改岗位" inputs="post_id:''"  width="400" height="240"/>
                        </TK:Button>
                        <TK:Button displayName="删除" iconCls="icon-remove" plain="true" >
                            <TK:Property function="submit" isMulSelect="true" eventNo="e_delete_post" inputs="post_id:'',post_name:''"  isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
                        </TK:Button>
                        <TK:Button displayName="刷新" iconCls="icon-reload" plain="true"> 
                            <TK:Property function="refresh"/>
                        </TK:Button>
                     </TK:Group>
              </TK:Toolbar>
              <TK:Fields>
                  <TK:Field type="checkcolumn" allowSort="false"></TK:Field>
                  <TK:Field field="post_name" displayName="岗位名称" width="120"/>
                  <TK:Field field="post_no" displayName="岗位英文名" width="120"/>
                  <TK:Field field="post_type" displayName="岗位类型" width="120" dataType="select" format="post_type"/>
                  <TK:Field field="create_by" displayName="创建人" width="120"/>
                	<TK:Field field="create_date" displayName="创建时间" width="120"/>
                  <TK:Field field="modified_by" displayName="最后修改人" width="120"/>
                 <TK:Field field="modified_date" displayName="最后修改时间" width="120"/>
               </TK:Fields>
            </TK:DataGrid >
 </TK:Page> 
