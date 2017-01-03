<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Category_input.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  <form action="admin/category_update" method="post">
  	id:<input name="category.id" value="<s:property value="category.id"/>" readonly="readonly" /><br>
  	name:<input name="category.name" value="<s:property value="category.name"/>"/><br>
  	description:<textarea name="category.description"><s:property value="category.description" /></textarea><br>
  	<input type="submit" value="update" /> 
  </form>
  </body>
</html>
