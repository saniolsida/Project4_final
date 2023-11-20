<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.project4_final.BoardDAO, com.example.project4_final.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
    <link rel="stylesheet" href="BoardStyle.css"/>
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id=request.getParameter("id");
    BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
%>
<board class="view-post">
    <h2 class="display-5 link-body-emphasis mb-1"><%= u.getTitle()%></h2>
    <p><%= u.getRegdate()%>
    <a href="#"><%= u.getWriter()%></a>
    </p>
    <p>
        <%= u.getContent()%>
    </p>
</board>
<nav class="blog-pagination" aria-label="Pagination">
    <a href="posts.jsp" class="btn btn-outline-secondary rounded-pill disabled" aria-disabled="true">Exit</a>
</nav>
</body>
</html>