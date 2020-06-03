<TK:Page>
  <div showCollapseButton="true" style="width:100%;height:100%;">
    <TK:DataGrid id="datagrid1"  paramFunc="getParam" eventNo="e_query_enumchange" isPage="true">
      <TK:Toolbar>
        <TK:Group style="width:100%;">
          <TK:Button displayName="增加" iconCls="icon-add" plain="true">
            <TK:Property function="popWindow" templateNo="add_change" title="添加数据字典转换值"   paramFunc="getParam" width="350" height="250" />
          </TK:Button>
          <TK:Button displayName="编辑" iconCls="icon-edit" plain="true">
            <TK:Property function="popWindow" isSelect="true" templateNo="edit_change" title="修改数据字典转换值"  inputs="exchange_id:''" width="350" height="300" />
          </TK:Button>
          <TK:Button displayName="删除" iconCls="icon-remove" plain="true">
            <TK:Property function="submit" isMulSelect="true"  eventNo="e_delete_enumchange" inputs="exchange_id:''"  isAlert="true" alertMsg="是否确认删除?" isReLoad="true"/>
          </TK:Button>
        </TK:Group>
        <TK:Group style="white-space:nowrap;">
          <TK:TextBox id="key" emptyText="请输入字典转换值" style="width:150px;"/>   
          <TK:Button displayName="查询" iconCls="icon-redo">
            <TK:Property function="query"  paramFunc="getSearchParam"/>
          </TK:Button>
        </TK:Group>
      </TK:Toolbar>
      <TK:Fields >
        <TK:Field type="checkcolumn" allowSort="false" width="20" displayName="序号"/>
        <TK:Field field="exchange_id" displayName="数据字典编号" width="110"/>
        <TK:Field field="change_plat" displayName="第三方平台" width="110" dataType="select" format="third_platform"/>
        <TK:Field field="change_value" displayName="第三方平台值" width="110"/>
        <TK:Field field="state" displayName="是否有效" width="60" dataType="select" format="state"/>
      </TK:Fields>
    </TK:DataGrid>
  </div>
   <TK:Script>
  <![CDATA[
        mini.parse();
        var param = mini.getParams();
        function getParam() {
      var paraMap = {};
      paraMap["item_id"] = param.item_id;
      return paraMap;
        }
    //模糊查询
    function getSearchParam() {
            var key = mini.get("key").getValue();
      var paraMap = {};
      paraMap["key"] = key;
      paraMap["item_value"] = param.item_value;
      return paraMap;
        }
        
       ]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
