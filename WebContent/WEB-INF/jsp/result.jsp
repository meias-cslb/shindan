<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = (String)request.getAttribute("name");
	String answer = (String)request.getAttribute("answer");
	String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>診断結果</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<h1>たむら理解度診断 診断結果</h1>
	<p><%= name %>さんの診断結果は</p>
	<p><span id="answer">「理解度<%= answer %>」</span>です。</p>
	<p><%= message %></p>
	<img src="${pageContext.request.contextPath}/image/erizabesu.jpg">
</body>
</html>