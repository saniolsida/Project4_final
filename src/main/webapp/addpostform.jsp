<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="BoardStyle.css"/>
</head>
<body>

<h1>Add New Post</h1>
<form action="addpost.jsp" method="post">
<table>
<tr><td>Title:</td><td><input type="text" name="title"/></td></tr>
<tr><td>Writer:</td><td><input type="text" name="writer"/></td></tr>
<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>
<tr><td>Category:</td><td>
    <select id="category" name="category">
        <option name="category" value="0">자유</option>
        <option name="category" value="1">공지</option>
    </select>
</td></tr>
<tr><td><a href="posts.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>

</table>
</form>

</body>
</html>