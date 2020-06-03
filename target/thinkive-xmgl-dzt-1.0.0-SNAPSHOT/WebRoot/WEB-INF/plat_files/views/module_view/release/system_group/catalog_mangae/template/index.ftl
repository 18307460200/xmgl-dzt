<TK:Page> 
  <TK:Splitter>
      <TK:group size="220" showCollapseButton="true" style="border-width:1px;"> 
      <TK:Tree id="tree1"   eventNo="e_tree_catalog" style="height:95%" isOnlyLeaf="false" inputs="id:''">
      <TK:Property type="left" function="load"  loadId="mainTabs" templateNo="update_catalog" title="编辑栏目" inputs="id:''"/>
      
      <TK:TreeMenus>
        <TK:TreeMenu displayName="添加子栏目"  iconCls="icon-add">
          <TK:Property type="right" function="load" loadId="mainTabs" inputs="id:''" templateNo="add_catalog" title="添加栏目" />
        </TK:TreeMenu>
        <TK:TreeMenu displayName="修改本栏目"  iconCls="icon-edit">
          <TK:Property type="right" function="load" loadId="mainTabs" inputs="id:''" templateNo="update_catalog" title="修改$name$栏目" />
        </TK:TreeMenu>
        <TK:TreeMenu displayName="删除本栏目"  iconCls="icon-remove">
          <TK:Property type="right" function="delete" eventNo="e_delete_catalog"  inputs="id:''" title="删除模块" isAlert="true" alertMsg="是否删除？"/>
        </TK:TreeMenu>
        <TK:TreeMenu displayName="发布本栏目模板"  iconCls="icon-redo">
          <TK:Property type="right" function="submit" eventNo="e_publish_catalog"  inputs="id:''"/>
        </TK:TreeMenu>
        <TK:TreeMenu displayName="刷新"  iconCls="icon-reload">
          <TK:Property type="right" function="refresh"/>
        </TK:TreeMenu>
      </TK:TreeMenus>
    </TK:Tree>
      </TK:group>
      <TK:group showCollapseButton="false" style="border:0px;"> 
          <TK:Tabs id="mainTabs"  activeIndex="0" plain="false">        
             <TK:Group title="欢迎" id="tabtitle">
               <p style="text-align:center; padding-top:80px;">
                 <img src="${ctxPath}/framework/image/pic17.jpg"/>
               </p>
             </TK:Group>
          </TK:Tabs>
      </TK:group>        
  </TK:Splitter>
</TK:Page>                                                                                                                                                                                                                                                             
