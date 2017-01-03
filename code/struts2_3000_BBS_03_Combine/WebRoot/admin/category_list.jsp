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
Category_list
<a href="admin/category_add.jsp">添加Category</a>

<hr>
<s:iterator value="categories" var="c">
	<s:property value="#c.name"/> | 
	<s:property value="#c.description"/>
	<a href="admin/category_delete?category.id=<s:property value="#c.id"/>">删除Category</a> | 
	<a href="admin/category_updateInput?category.id=<s:property value="#c.id"/>">更新Category</a>
	<br> 
</s:iterator>
<s:debug></s:debug>
  </body>
</html>
