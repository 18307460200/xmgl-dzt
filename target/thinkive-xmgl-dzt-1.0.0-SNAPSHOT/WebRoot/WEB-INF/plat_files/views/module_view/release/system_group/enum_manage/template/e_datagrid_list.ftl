 <TK:Page>
 <TK:Splitter allowResize="false">
<TK:group showCollapseButton="false" size="0" visible="false">
</TK:group> 
<TK:group showCollapseButton="true" >
<TK:DataGrid id="datagrid1" inputs="id:'$id$'" pageSize="20" eventNo="e_query_enumvalue" isPage="true">
  <TK:Toolbar id="toolbutton">
    <TK:Group style="width:100%;">
      <TK:Button displayName="增加" iconCls="icon-add" plain="true">
        <TK:Property function="popWindow" templateNo="add_value" title="添加数据字典值"  paramFunc="getParam" width="350" height="250" />
      </TK:Button>
      <TK:Button displayName="编辑" iconCls="icon-edit" plain="true">
        <TK:Property function="popWindow" isSelect="true" templateNo="edit_value" title="修改数据字典枚举值"  inputs="item_id:''" width="350" height="300" />
      </TK:Button>
      <TK:Button displayName="删除" iconCls="icon-remove" plain="true">
        <TK:Property function="submit" isMulSelect="true"  eventNo="e_delete_enumvalue" inputs="item_id:''"  isAlert="true" alertMsg="是否确认删除?" isReLoad="true"/>
      </TK:Button>
    </TK:Group>
    <TK:Group style="white-space:nowrap;">
      <TK:TextBox id="key" emptyText="请输入名称" style="width:150px;"/>   
      <TK:Button displayName="查询" iconCls="icon-redo">
        <TK:Property function="query"  paramFunc="getSearchParam"/>
      </TK:Button>
    </TK:Group>
  </TK:Toolbar>
  <TK:Fields >
    <TK:Field type="checkcolumn" allowSort="false" width="20"/>
    <TK:Field field="item_name" displayName="名称"  width="110"/>
    <TK:Field field="item_value" displayName="枚举值" width="110"/>
    <TK:Field field="orderline" displayName="排序值" width="110"/>
    <TK:Field id="status" field="status" displayName="是否有效" width="60" dataType="select" format="state"/>
    <TK:Field id="pop_window" displayName="查看转换值" align="center" width="110">
      <TK:Property function="popWindow" templateNo="change_value" title="数据字典转换值" displayName="查看" inputs="item_id:''" width="900" height="500" />
    </TK:Field>
  </TK:Fields>
</TK:DataGrid>
</TK:group>
</TK:Splitter>
<TK:Script>
  <![CDATA[
  		function getParam()
		{
			return window.Owner.getParam();
		}
		function getSearchParam()
		{
			var param = window.Owner.getSearchParam();
			var key = mini.get("key").getValue();
			param.key=key;
			return param;
		}
   ]]>
</TK:Script>
</TK:Page>
