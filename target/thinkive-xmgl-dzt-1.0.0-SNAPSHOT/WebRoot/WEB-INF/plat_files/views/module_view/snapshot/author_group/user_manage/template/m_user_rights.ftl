<TK:Page>
	<TK:Tabs id="Tabs"  bodyStyle="padding:0;border:0;" tabAlign="fit">		
		<TK:Group title="功能权限" name="funcRight" showCloseButton="false">
				<TK:Tree id="catalogRightsTree"  resultAsTree="true" style="height:92%;width:100%;" ondrawnode="onDrawNode" autoCheckParent="true" eventNo="e_catalogrights_tree" inputs="user_id:'$user_id$'" expandOnLoad="0"  showCheckBox = "true" />
		</TK:Group>
		<TK:Group title="数据权限" name="dataRight" showCloseButton="false">
				<TK:Tree id="dataRightsTree" resultAsTree="true" ondrawnode="onDrawNode" style="height:92%;width:100%;" autoCheckParent="true" eventNo="e_dataright_tree"   expandOnLoad="0" inputs="user_id:'$user_id$'" paramFunc="getParam"  showCheckBox = "true" >
					<TK:Toolbar>
								<TK:Group>
                                	<TK:Form>
										<TK:ComboBox name="right_type" required="true" isAddTd="false" emptyText="请选择权限要素" value="branch_data" onvaluechanged="dataTypeChanged" style="width:30%;float:right;" >
											 <TK:Property dataType="select" format="data_type" />
										</TK:ComboBox>
                                    </TK:Form>
								</TK:Group>
					</TK:Toolbar>
          	</TK:Tree>
      </TK:Group>
	</TK:Tabs>
  	<TK:Script>
  	<![CDATA[
  	 function onDrawNode(e) {
            var tree = e.sender;
            var node = e.node;
            var isLeaf = tree.isLeaf(node);
            //所有子节点加上超链接
            if (isLeaf == true) {
                e.nodeHtml = '<a class="showTip" id =" '+node.title + '">' + node.name + '</a>';
            }
      }
      
      var tip = new mini.ToolTip();
	    tip.set({
	        target: document,
	        selector: '.showTip',
      		placement:'',
	        onbeforeopen: function (e) {            
	            e.cancel = false;
	        },
	        onopen: function (e) {
	            var el = e.element;
      			var title = el.id;
	            if ($.string.isNotEmpty(title) && title.indexOf("undefined")<0) {
					tip.setContent('<div style="text-align:left;margin-top:2px;margin-bottom:3px;"><div align="center">权限归属</div><hr>'+title.replace(/\,/g,'')+'</div>');
	            }
				else
					tip.setContent('');
	        }
	    });
      function getParam()
      {
      		return {'data_type':mini.getbyName('right_type').value};
      }
      function dataTypeChanged()
      {
      		$.tkui['dataRightsTree'].loadData();
      }
	]]>
    </TK:Script>
</TK:Page>