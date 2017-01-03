<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>


<body>
	<ol>
		<li>property: <s:property value="username"/> </li>
		<li>property 取值为字符串: <s:property value="'username'"/> </li>
		<li>property 设定默认值: <s:property value="admin" default="管理员"/> </li>
		<li>property 设定HTML: <s:property value="'<hr/>'" /> </li>
		<hr />
		<li>set 设定adminName值（默认为request 和 ActionContext）: <s:set var="adminName" value="username" /></li>
		
		<li>set 从request取值: <s:property value="#request.adminName" /></li>
		<li>set 从ActionContext取值: <s:property value="#adminName" /></li>
		
		<%--
		<li>set 设定范围: <s:set name="adminPassword" value="password" scope="page"/></li>
		<li>set 从相应范围取值: <%=pageContext.getAttribute("adminPassword") %></li>
		--%>
		
		<li>set 设定var，范围为ActionContext: <s:set var="adminPassword" value="password" scope="session"/></li>
		<li>set 使用#取值: <s:property value="#adminPassword"/> </li>
		<li>set 从相应范围取值: <s:property value="#session.adminPassword"/> </li>
		
		<hr />
		
		<hr />

		<li>bean 查看debug情况:oudy必须用单引号引起来，否则会被解析成ognl
			<s:bean name="com.bjsxt.struts2.tags.Dog" var="myDog">
				<s:param name="name" value="'oudy'"></s:param>
			</s:bean>
			拿出值：
			<s:property value="#myDog.name"/>
			<s:debug></s:debug>
		</li>
		<hr />
		
		<li>include _include1.html 包含静态英文文件
		<s:include value="/_include1.html"></s:include>
		</li>
		
		<li>include _include2.html 包含静态中文文件
		<s:include value="/_include2.html"></s:include>
		</li>
		
		<li>include _include1.html 包含静态英文文件，说明%用法(将字符串强制转成ognl)
		<s:set var="incPage" value="%{'/_include1.html'}" />
		<s:include value="%{#incPage}"></s:include>
		</li>
		
		<hr />
		
		<li>if elseif else: 
		age = <s:property value="#parameters.age[0]" /> <br />
		<s:set var="age" value="#parameters.age[0]" />
		<s:if test="#age < 0">wrong age!</s:if>
		<s:elseif test="#parameters.age[0] < 20">too young!</s:elseif>
		<s:else>yeah!</s:else><br />
		
		<s:if test="#parameters.aaa == null">null</s:if>
		</li>
		
		<hr />
		
		<li>遍历集合：<br />
		<s:iterator value="{1, 2, 3}" >
			<s:property/> |
		</s:iterator>
		</li>
		<li>自定义变量：<br />
		<s:iterator value="{'aaa', 'bbb', 'ccc'}" var="x">
			<s:property value="#x.toUpperCase()"/> |
		</s:iterator>
		</li>
		<li>使用status:<br />
		<s:iterator value="{'aaa', 'bbb', 'ccc'}" status="status">
			<s:property/> | 
			遍历过的元素总数：<s:property value="#status.count"/> |
			遍历过的元素索引：<s:property value="#status.index"/> |
			当前是偶数？：<s:property value="#status.even"/> |
			当前是奇数？：<s:property value="#status.odd"/> |
			是第一个元素吗？：<s:property value="#status.first"/> |
			是最后一个元素吗？：<s:property value="#status.last"/>
			<br />
		</s:iterator>
		
		</li>
		
		<li>
		<s:iterator value="#{1:'a', 2:'b', 3:'c'}" >
			<s:property value="key"/> | <s:property value="value"/> <br />
		</s:iterator>
		</li>
		
		<li>
		<s:iterator value="#{1:'a', 2:'b', 3:'c'}" var="x">
			<s:property value="#x.key"/> | <s:property value="#x.value"/> <br />
		</s:iterator>
		</li>
		
		<li>
		
		<s:fielderror fieldName="fielderror.test" theme="simple"></s:fielderror>
		
		</li>
	</ol>
	
	
	
	
</body>
</html>