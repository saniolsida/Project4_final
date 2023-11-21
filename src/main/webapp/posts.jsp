<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.project4_final.BoardDAO, com.example.project4_final.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sub Hisnet</title>
<link rel="stylesheet" href="BoardStyle.css"/>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>자유게시판</h1>
<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
<tr>
	<th>No</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Content</th>
	<th>Regdate</th>
	<th>Updates</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<c:choose>
			<c:when test="${u.getCategory() eq '0'}">
				<td> ${u.getSeq()} </td>
			</c:when>
			<c:when test="${u.getCategory() eq '1'}">
				<td> 공지 </td>
			</c:when>
		</c:choose>
		<td><a href="view.jsp?id=${u.getSeq()}">${u.getTitle()}</a></td>
		<td>${u.getWriter()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getRegdate()}</td>

		<c:choose>
			<c:when test="${u.getUpdates() eq '0'}">
				<td> 원본 </td>
			</c:when>
			<c:when test="${u.getUpdates() eq '1'}">
				<td> ${u.getRegdate()} </td>
			</c:when>
		</c:choose>

		<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
	</tr>
</c:forEach>
</table>
<br/><a href="addpostform.jsp">Add New Post</a>
</body>
</html>