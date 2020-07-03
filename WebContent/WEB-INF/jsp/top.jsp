<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>診断システム</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<h1>たむら理解度診断</h1>
	<p>ようこそ！たむらへの理解度を診断するよ！興味ない人はさよなら！</p>
	<h2>診断スタート</h2>

	<%
		if(message != null) {
	%>
		<div id="error"><%= message %></div>
	<%
		}
	%>

	<form method="post" action="${pageContext.request.contextPath}/result">
		<h3>あなたの名前を入れてね！</h3>
		<input type="text" name="name">

		<h3>1.好きな色は？</h3>
		<div class="container">
			<div><input type="radio" name="q1" value="1" checked>白</div>
			<div><input type="radio" name="q1" value="0">黄色</div>
			<div><input type="radio" name="q1" value="2">黒</div>
			<div><input type="radio" name="q1" value="3">ピンク</div>
		</div>

		<h3>2.友人と彼氏、遊ぶ予定が被った！どうする？</h3>
		<div class="container">
			<div><input type="radio" name="q2" value="2" checked>彼氏優先</div>
			<div><input type="radio" name="q2" value="1">友人優先</div>
			<div><input type="radio" name="q2" value="0">約束順</div>
			<div><input type="radio" name="q2" value="3">どっちもキャンセル</div>
		</div>

		<h3>3.好きな家事は？</h3>
		<div class="container">
			<div><input type="radio" name="q3" value="0" checked>料理</div>
			<div><input type="radio" name="q3" value="3">洗濯</div>
			<div><input type="radio" name="q3" value="2">買い物</div>
			<div><input type="radio" name="q3" value="1">掃除</div>
		</div>

		<h3>4.好きな味は？</h3>
		<div class="container">
			<div><input type="radio" name="q4" value="3" checked>甘い</div>
			<div><input type="radio" name="q4" value="2">辛い</div>
			<div><input type="radio" name="q4" value="0">しょっぱい</div>
			<div><input type="radio" name="q4" value="1">すっぱい</div>
		</div>

		<h3>5.ふとした時よく思ってしまうことは？</h3>
		<div class="container">
			<div><input type="radio" name="q5" value="2" checked>若者についてけない…</div>
			<div><input type="radio" name="q5" value="3">自分頭良いわ～</div>
			<div><input type="radio" name="q5" value="1">頭一瞬空っぽになんないかな？</div>
			<div><input type="radio" name="q5" value="0">生まれてくる年間違えた…？</div>
		</div>

		<input type="submit" value="診断する">
	</form>

</body>
</html>