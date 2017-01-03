<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Java论坛</title>
    <link rel="shortcut icon" href="res/favicon.ico" type="image/x-icon" />
    <link href="res/forum.css" rel="stylesheet" type="text/css" />
    
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
    <meta name="keywords" content="论坛，java，javase，javaee" />
	<meta http-equiv="description" content="论坛">
  </head>
    
  <body>
    <div id="page">
      <div id="header">
	        <div class="clearfix">
		        <div id="user_nav">
			      <a href="/login" class="welcome" title="登录">您还未登录 !</a>
				  <a href="http://www.javaeye.com/all" style="color:red">我的应用</a>
				  <a href="/login">登录</a>
				  <a href="/signup" class="nobg">注册</a>
		   	     </div>
	   	    </div>
       </div>

      <div id="content" class="clearfix">
        <div id="main">
          <s:bean name="com.ace.bbs.service.CategoryService" var="categoryService" />
          <table id="forum_main" cellspacing="1">
            <thead>
           	
	             <tr>
	               <td colspan="2" class="first_col" style="width: 620px;">论坛</td>
	               <td class="first_col" style="width: 60px;">主题</td>
	               <td class="first_col" style="width: 60px;">文章</td>
	               <td class="first_col" style="width: 180px;">最新文章</td>
	             </tr>
              
            </thead>
            
            <tbody>
              <tr>
                <td class="read_forum"></td>
                <td class="forum_description"><a href="/forums/board/Java" class="forumtitle">啊啊啊啊</a><br/>fdagfdasfsa<br/></td>
                <td class="forum_index">12986</td>
                <td class="forum_index">113949</td>
                <td class="forum_index">
                  11 分钟前<br/>
                  <a href='http://iaimstar.javaeye.com' target='_blank'>iaimstar</a>
                  <a href="/post/1176522" class="last_post" title="浏览最新的文章">&nbsp;</a>
                </td>
              </tr>
            </tbody>
          </table>

  <br/>
  <div id="forum_action" class="clearfix">
    <ul>
      <li><a href="/forums/mark_read_all">标记所有文章已读</a></li>
      <li><a href="/rss/forum" class="rss">订阅全部论坛新贴</a></li>
      <li><a href="/rss/topic" class="rss">订阅全部论坛热点</a></li>
    </ul>
  </div>

  <div id="online_status">
    <h3>当前在线状态</h3>
         目前共有 <strong>2936</strong> 人在线，其中注册会员 <strong>365</strong> 人
    <a href="#" id="show_list" onclick="$('show_list').hide();$('hide_list').show();$('online_users').update('读取中...'); new Ajax.Updater('online_users', '/users/online', {asynchronous:true, evalScripts:true, method:'get'}); return false;">显示列表</a><a href="#" id="hide_list" onclick="$('online_users').update(' ');$('show_list').show();$('hide_list').hide();return false;" style="display:none;">隐藏列表</a>
    <a href="#" id="all_list">查看详细状态</a>
  </div>

  <script type="text/javascript">
    var current_index = 0;
    var s_adverts = ["\u003Cembed play=\"true\" src=\"http://ftp.javaeye.com/public/ibm/ibm_x.swf\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" height=\"180\" loop=\"true\" menu=\"true\" width=\"370\"\u003E\u003C/embed\u003E\r\n\r\n\r\n"];

    Event.observe(window,'load',function() {
      show_slide(0);
      new PeriodicalExecuter(show_slide, 30);
    });

    function show_slide(s_index) {
      if(typeof(s_index) != 'number') s_index = current_index + 1;
      if(s_index >= s_adverts.length) s_index = 0;
      
      $("slides").innerHTML = s_adverts[s_index];
      var s_pagination = s_adverts.inject("<span class='pagination'>", function(memo, value, i) {
        return memo + (s_index == i ? "<span class='current'>" + (i + 1) + "</span>" : "<a href='#' onclick='show_slide(" + i + ");return false;'>" + (i + 1) + "</a>");
      }) + "</span>";


      $("slides").insert(s_pagination);

      current_index = s_index;
    }
  </script>
        </div>
      </div>
      
	<div id="footer">
	  <div id="site_nav">
	    <ul>
	      <li>关于我们</li>
	      <li>联系我们</li>
	      <li class="last">友情链接</li>
	    </ul>
	  </div>
	  <div id="copyright">
	    &copy; 2003-2009 xxx.com.   All rights reserved.  
	  </div>
	</div>

</div>
    
  </body>
</html>