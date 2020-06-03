<TK:Page>
<div id="layout1" class="mini-layout" style="width:100%;height:100%;margin:2px;">
	<div title="center" region="center" bodyStyle="overflow:hidden;">
	<TK:DataGrid id="datagrid1" isCellCopy="true" eventNo="e_query_sqllist" isPage="false" inputs="module_id:'$module_id$',event_id:'$event_id$'" style="height:100%;width:100%;" >
            <TK:Toolbar>   
                               <TK:Group style="width:100%;">      
              <TK:Button displayName="新增SQL" iconCls="icon-add" plain="true">
              	<TK:Property function="popWindow"  templateNo="m_add_sql" title="新增SQL" inputs="module_id:'$module_id$',event_id:'$event_id$'" width="800" height="630"/>
        	  </TK:Button>     
         <TK:Button displayName="编辑SQL" iconCls="icon-edit" plain="true">
               <TK:Property function="popWindow"  templateNo="m_edit_sql" title="修改SQL" isSelect="true" inputs="module_id:'$module_id$',sql_id:'$sql_id$'" width="800" height="630"/>
          </TK:Button>  
            <TK:Button displayName="删除SQL" iconCls="icon-remove" plain="true" >
                   <TK:Property function="submit" isMulSelect="true" eventNo="e_delete_sql" inputs="sql_id:'$sql_id$'" isAlert="true" alertMsg="是否确认操作?" isReLoad="true"/>
			</TK:Button>  
           <TK:Button displayName="刷新" iconCls="icon-reload" plain="true" >
                 <TK:Property function="refresh" />
        </TK:Button>   
        </TK:Group>
            </TK:Toolbar>
            <TK:Fields>
                <TK:Field type="checkcolumn" />
              <TK:Field field="sql_no" displayName="SQL编号" width="120"/>
              <TK:Field field="orderline" displayName="排序值" width="120"/>
               <TK:Field field="state" displayName="是否有效" width="60" dataType="select" format="state"/>
            </TK:Fields>
      </TK:DataGrid> 	
  </div>
  <div region="west" title="SQL流程脚本" showheader="true"  expanded="false" bodystyle="padding-right:1px;overflow-y:hidden;" showspliticon="false"  width="350" >
    <TK:Form id="form1">
      <TK:Hidden name="module_id">
                    	<TK:Property dataType="url" format="module_id"/> 
                    </TK:Hidden>
                     <TK:Hidden name="event_id">
                    	<TK:Property dataType="url" format="event_id"/> 
                    </TK:Hidden>
                    <TK:Hidden name="script_type" value="0" />
					<TK:Table>
            <TK:Group>
              <TK:CEditor label="" labelStyle="width:1px;" name="script_value" style="width:100%;height:480px;" id="content" />
            </TK:Group>
          </TK:Table>
        <TK:Table>
       <TK:Group>
         	<TK:RadioButtonList label="状态：" value="1" name="status" style="width:250px;" labelStyle="width:50px;">
		 			<TK:Property dataType="select" format="state"/>
		 		</TK:RadioButtonList> 
         <td align="right" style="padding-top:10px;">
           <TK:Button displayName="保存"  iconCls="icon-save"  >
             <TK:Property function="submit" isAlert="true" alertMsg="是否提交？" isValid="true"   eventNo="e_add_js" />
           </TK:Button>      
          </td>
          </TK:Group>
    </TK:Table>
        </TK:Form>       
  </div>
</div>
<script type="text/javascript">
<![CDATA[
 mini.parse();
 var grid = mini.get("datagrid1");
function GetData()
{
    var data = grid.getData();
    var sql_ids="";
    for(var i=0;i<data.length;i++){
        if(i==0){
    		sql_ids= sql_ids+data[i].sql_id;
    	}else{
    		sql_ids= sql_ids+","+data[i].sql_id;
    	}
    }
	return sql_ids;
}
]]>
</script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
