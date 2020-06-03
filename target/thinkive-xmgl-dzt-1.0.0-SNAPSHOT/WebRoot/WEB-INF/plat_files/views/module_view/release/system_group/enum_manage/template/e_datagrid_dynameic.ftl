<TK:Page>
	<TK:Splitter allowResize="false">
		<TK:group showCollapseButton="false" size="0" visible="false">
		</TK:group> 
		<TK:group showCollapseButton="true" >
		  <TK:DataGrid id="datagrid1" style="width:100%;height:100%;" pageSize="20" inputs="dictId:'$dictId$'" eventNo="e_query_enumdynameic" showPager="false" isPage="false">
		    <TK:Toolbar id="toolbutton">
		    
		    </TK:Toolbar>
		    <TK:Fields >
		      <TK:Field type="checkcolumn" allowSort="false" width="20"/>
		      <TK:Field field="item_name" displayName="名称" allowSort="false" width="110"/>
		      <TK:Field field="item_value" displayName="枚举值" allowSort="false" width="110"/>
		    </TK:Fields>
		  </TK:DataGrid>
		</TK:group>
	</TK:Splitter>
</TK:Page>
