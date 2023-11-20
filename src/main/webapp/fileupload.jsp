<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: songsan
  Date: 11/17/23
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String filename = "";
    int sizeLimit = 15 * 1024 * 1024;
    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    filename = multipartRequest.getFilesystemName("image");
%>
<html>
<head>
    <title>File Upload</title>
</head>
<body>
    파일명: <%=filename%> <br/>
    <img src="${pageContext.request.contextPath}/upload/<%=filename%>">
</body>
</html>
