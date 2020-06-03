<TK:Page>
  <div showCollapseButton="true" style="width:100%;height:92%;">
    <TK:DataGrid id="datagrid1" paramFunc="getParam"  eventNo="e_query_enumvalue" isPage="true">
      <TK:Toolbar>
        <TK:Group style="width:100%;">
          <TK:Button displayName="增加" iconCls="icon-add" plain="true">
            <TK:Property function="popWindow" templateNo="add_value" title="添加数据字典值"  paramFunc="getParam" width="350" height="250" />
          </TK:Button>
          <TK:Button displayName="编辑" iconCls="icon-edit" plain="true">
            <TK:Property function="popWindow" isSelect="true" templateNo="edit_value" title="修改数据字典枚举值"  inputs="id:''" width="350" height="300" />
          </TK:Button>
          <TK:Button displayName="删除" iconCls="icon-remove" plain="true">
            <TK:Property function="submit" isSelect="true"  eventNo="e_delete_enumvalue" inputs="id:''"  isAlert="true" alertMsg="是否确认删除?" isReLoad="true"/>
          </TK:Button>
        </TK:Group>
        <TK:Group style="white-space:nowrap;">
          <TK:TextBox id="key" emptyText="请输入名称" style="width:150px;" onenter="onKeyEnter"/>   
          <TK:Button displayName="查询" onclick="search()" iconCls="icon-redo">
          <TK:Property function="query"  paramFunc="getSearchParam"/>
          </TK:Button>
        </TK:Group>
      </TK:Toolbar>
      <TK:Fields >
        <TK:Field type="checkcolumn" allowSort="false" width="20"/>
        <TK:Field field="enum_no" displayName="类型英文名" width="110"/>
        <TK:Field field="item_name" displayName="名称" width="110"/>
        <TK:Field field="item_value" displayName="枚举值" width="110"/>
        <TK:Field field="state" displayName="是否有效" width="60" dictNo="state"/>
        <TK:Field  displayName="查看转换值" align="center" width="110">
          <TK:Property function="popWindow" templateNo="change_value" title="数据字典转换值" displayName="查看" inputs="enum_no:'',item_value:''" width="900" height="500" />
        </TK:Field>
      </TK:Fields>
    </TK:DataGrid>
  </div>
  <TK:Script>
  <![CDATA[
        mini.parse();
        var grid = mini.get("datagrid1");
         var param = mini.getParams();
        function getParam()
        {
      var paraMap = {};
      paraMap["enum_no"] = param.enum_no;
      return paraMap;
    }
    
    function getSearchParam()
        {
      var key = mini.get("key").getValue();
      var paraMap = {};
      paraMap["key"] = key;
      paraMap["enum_no"] = param.enum_no;
      return paraMap;
    }
    ]]>
</TK:Script>
</TK:Page>                                                                                                                                                                                             
