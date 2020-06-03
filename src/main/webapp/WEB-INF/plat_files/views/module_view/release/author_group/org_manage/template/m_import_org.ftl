<TK:Page>
	<TK:Form id="form1" style="width:80%;height:100%;margin-left:4%">
    	<TK:Table>
    		<TK:Group style="height:10px"></TK:Group>
             <tr><td><span style="margin-left:40px">导入模板：</span><a href="${ctxPath}/upload/tempFile/importOrg.xlsx">点击下载导入模板</a></td></tr>
         	<TK:Group style="height:10px"></TK:Group>
            <TK:Group>
            	<TK:Upload label="导入组织机构信息："  name="file_data"  required="true" allowInput="false">
               		<TK:Property bcode="import_upload" width="500" height="300"/>
            	</TK:Upload >
			</TK:Group>
            <TK:Group>
            	<td style="height:60px;padding-left:35%;">
            	<TK:Button displayName="确认导入" style="width:80px">
                	<TK:Property function="submit" eventNo="e_import_org"  isValid="true" isClose="true" />
                </TK:Button>
                <TK:Button displayName="关闭" style="margin-left:20px;width:60px;">
                	<TK:Property isClose="true" />
                </TK:Button>
                </td>
            </TK:Group>
        </TK:Table>
    </TK:Form>
</TK:Page>  
