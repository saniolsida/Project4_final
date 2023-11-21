<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.project4_final.BoardDAO, com.example.project4_final.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View</title>
    <link rel="stylesheet" href="BoardStyle.css"/>
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id=request.getParameter("id");
    BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
%>
<table id="board" width="90%">
    <tr><td><h2 class="display-5 link-body-emphasis mb-1"><%= u.getTitle()%></h2></td></tr>
    <tr>
        <td>Reg date: <%= u.getRegdate()%>
        <a>Writer: <%= u.getWriter()%></a></td>
    </tr>
    <tr>
        <td>
            <%= u.getContent()%>
        </td>
    </tr>
    <tr>
        <td><a href="posts.jsp" class="btn btn-outline-secondary rounded-pill disabled" aria-disabled="true">Exit</a></td>
    </tr>
</table>
</body>
</html>