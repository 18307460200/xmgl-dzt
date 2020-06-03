<%@ page contentType="text/html;charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="com.thinkive.base.util.ScriptHelper" %>
<%@ page import="com.thinkive.workplat.system.SysLibrary" %>
<jsp:useBean id="eWebEditor" class="ewebeditor.server.upload_jsp" scope="page"/>

<%
//先判断是否已经登录
if (!SysLibrary.isLogin(session))
{
  ScriptHelper.alert(response, "您还没有登录，上传失败", "close");
  return;
}
eWebEditor.Load(pageContext);
%>