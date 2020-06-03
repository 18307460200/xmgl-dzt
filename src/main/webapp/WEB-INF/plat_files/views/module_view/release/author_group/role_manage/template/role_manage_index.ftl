<TK:Page>
    <!--Splitter-->
    <TK:Splitter>
        <TK:group size="180" showCollapseButton="true">
            <TK:Tree id="tree1" eventNo="e_query_sorttree" loadDataCallBackFunc="loadDataCallBackFunc" inputs="id:''"
                     style="width:100%;height:95%;">
                <TK:Property type="left" function="onLoad"/>
                <TK:Toolbar>
                    <TK:Group style="white-space:nowrap;">
                        <TK:Button displayName="新增角色分类" iconCls="icon-add">
                            <TK:Property function="popWindow" templateNo="m_add_role_sort" title="新增角色分类" width="300"
                                         height="200" inputs="" refreshMode="0"/>
                        </TK:Button>
                    </TK:Group>
                </TK:Toolbar>
                <TK:TreeMenus>
                    <TK:TreeMenu displayName="修改角色分类" name="edit" iconCls="icon-edit">
                        <TK:Property type="right" function="popWindow" refreshMode="0" templateNo="m_edit_role_sort"
                                     title="修改角色分类" inputs="sort_id:'$id$'" width="300" height="200"/>
                    </TK:TreeMenu>
                    <TK:TreeMenu displayName="删除角色分类" name="delete" iconCls="icon-remove">
                        <TK:Property type="right" function="delete" eventNo="e_delete_role_sort" title="删除角色分类"
                                     inputs="sort_id:'$id$'" isAlert="true" alertMsg="是否删除？"/>
                    </TK:TreeMenu>
                    <TK:TreeMenu displayName="刷新节点" name="addPost" iconCls="icon-add">
                        <TK:Property type="right" function="refresh"/>
                    </TK:TreeMenu>
                </TK:TreeMenus>
            </TK:Tree>
        </TK:group>
        <TK:group showCollapseButton="true" style="border:0;">
            <TK:DataGrid id="datagrid1" isLoad="false" eventNo="e_query_rolelist" isPage="true">
                <TK:Toolbar id="toolbutton">
                    <TK:Group style="width:100%;">
                        <TK:Button displayName="增加" iconCls="icon-add" plain="true">
                            <TK:Property function="add"/>
                        </TK:Button>
                        <TK:Button displayName="编辑" iconCls="icon-edit" plain="true">
                            <TK:Property function="popWindow" isSelect="true" templateNo="m_edit_role" title="修改角色信息"
                                         inputs="role_id:'$role_id$'" width="400" height="500"/>
                        </TK:Button>
                        <TK:Button displayName="删除" iconCls="icon-remove" plain="true">
                            <TK:Property function="submit" isMulSelect="true" eventNo="e_delete_role"
                                         inputs="role_id:'$role_id$'" isAlert="true" alertMsg="是否确认删除?"
                                         isReLoad="true"/>
                        </TK:Button>
                    </TK:Group>
                    <TK:Group style="white-space:nowrap;">
                        <TK:TextBox name="key" emptyText="请输入角色名称" style="width:150px;"/>
                        <TK:Button displayName="查询" iconCls="icon-redo">
                            <TK:Property function="query" isSelect="false" isMulSelect="false" inputs=""
                                         paramFunc="getSearchParam"/>
                        </TK:Button>
                    </TK:Group>
                </TK:Toolbar>
                <TK:Fields>
                    <TK:Field type="checkcolumn" allowSort="false" width="20"/>
                    <TK:Field field="name" displayName="角色名称" width="110"/>
                    <TK:Field field="role_no" displayName="角色英文名" width="110"/>
                    <TK:Field field="is_system" displayName="系统角色标志" width="110" dataType="select" format="is_system"/>
                    <TK:Field id="is_temp" field="is_temp" displayName="是否角色用户" width="60" dataType="select"
                              format="is_temp"/>
                    <TK:Field field="create_date" displayName="创建时间" width="110"/>
                    <TK:Field id="pop_window" displayName="用户管理" align="center" width="110">
                        <TK:Property function="popWindow" templateNo="m_query_user_role" title="用户管理" displayName="用户管理"
                                     inputs="role_id:'$role_id$'" width="900" height="500"/>
                    </TK:Field>
                </TK:Fields>
            </TK:DataGrid>
        </TK:group>
    </TK:Splitter>
    <TK:Script type="text/javascript">
        <![CDATA[
        mini.parse();
        var tree = mini.get("tree1");

        function getSearchParam() {
            var node = tree.getSelectedNode();
            if (node) {
                var param = new Object();
                param.sort_id = node.id;
                return param;
            } else {
                mini.alert("请选择角色分类");
            }
        }

        function onLoad() {
            var node = tree.getSelectedNode();
            $.tkui["datagrid1"].loadData({sort_id: node.id});
        }

        function add() {
            var node = tree.getSelectedNode();
            if (node) {
                var param = new Object();
                param.sort_id = node.id;
                var frameService = FrameService.getInstance();
                frameService.popWindow("添加角色信息", "m_add_role", param, 400, 500, null, function () {

                }, function (action) {
                    $.tkui["datagrid1"].loadData({sort_id: node.id});
                });
            } else {
                mini.alert("请选择角色分类");
            }
        }

        function loadDataCallBackFunc() {
            var firstNode = tree.getNode(0);
            if (firstNode) {
                tree.selectNode(firstNode);
                $.tkui["datagrid1"].loadData({sort_id: firstNode.id});
            }
        }

        ]]>
    </TK:Script>
</TK:Page>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
