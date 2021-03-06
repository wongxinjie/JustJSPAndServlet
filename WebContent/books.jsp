<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.bookstores.service.*" %>
<%@ page import="com.bookstores.domain.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="blogs"/>
<meta name="author" content="wongxinjie">

<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<title>首页</title>
</head>
<body>
<div id="wrap">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="container">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="<%=request.getContextPath()%>/">书店</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="easyreading_bar">
    <ul class="nav navbar-nav">
      <li><a  class="navbar-brand" href="/"></a></li>
      <li class="dropdown">
        <a href="/" class="dropdown-toggle" data-toggle="dropdown"><b class="caret"></b>分类</a>
        <ul class="dropdown-menu">
        <li>
        <% 
        List<Category> categoryList = (List<Category>)session.getAttribute("categoryList");
		for(Category category: categoryList){
        %>
          <li><a href="<%=request.getContextPath()%>/books?category=<%=category.getCategoryID()%>"><%=category.getName()%></a></li>
         <%
		}
         %>
        </ul>
      </li>
    </ul>
    <form class="navbar-form navbar-left" action="#" method="GET">
      <div class="form-group">
        <input type="text" class="form-control" name="title" placeholder="搜图书标题、ISBN">
      </div>
      <button type="submit" class="btn btn-default">搜索</button>
    </form>
    <%
    BookUser bookUser = (BookUser)session.getAttribute("loginUser");
    if( bookUser != null){
    %>
    <ul class="nav navbar-nav navbar-right">
    <li><a href="<%=request.getContextPath()%>/user/info.jsp">我的资料</a></li>
    <li><a href="<%=request.getContextPath()%>/user/logout">退出</a></li>
    </ul>
    <%
    }else{
    %>
    <ul class="nav navbar-nav navbar-right">
    <li><a href="<%=request.getContextPath()%>/login">登录</a></li>
    <li><a href="<%=request.getContextPath()%>/register">注册</a></li>	 
    </ul>
    <%}%>
   </div>
  </div>
</nav>

<div class="container">
	<div id="content" class="row row-offcanvas row-offcancas-right">
		<div class="col-xs-12 col-sm-9">
		<%
		List<Book> bookList =(List<Book>)request.getAttribute("books");
		for(Book book: bookList){
		%>
		<p><a href="<%=request.getContextPath()%>/book?bid=<%=book.getBookID()%>"><%=book.getTitle()%></a></p>
		<%
		}
		%>
		</div>
		
		<div id="sidebar" class="col-xs-6 col-sm-3 sidebar-offcanvas">
		<%if(session.getAttribute("loginUser") != null){ %>
		<a href="<%=request.getContextPath()%>/orders?status=unpay">未付款订单</a>
		<a href="<%=request.getContextPath()%>/orders?status=payed">已付款订单</a>
		<a href="<%=request.getContextPath()%>/orders">全部订单</a>
		<%}else{%>
		<p>登录或注册</p>
		<%}%>
		</div>
	</div>
</div>
</div>

<%
Integer paginator =(Integer)request.getAttribute("paginator");
if(paginator != 0){
%>

<ul class="pagination">
<%
for(int i=0; i < paginator; i++){
%>

<li><a href="<%=request.getContextPath()%>/books/?page=<%=i%>"><span class="sr-only"><%=i%></span></a><li>
</ul>
<%
}
%>
<%
}
%>

<div id="footer">
	<div class="container">
		<p class="text-muted credit"><a href="#">关于书店</a>&nbsp;&nbsp;&nbsp;<a href="#">联系我们</a></p>
	</div>
</div>
</body>
</html>



