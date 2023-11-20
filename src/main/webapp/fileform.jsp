<%--
  Created by IntelliJ IDEA.
  User: songsan
  Date: 11/17/23
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>File form</title>
</head>
<body>
  <form action="fileupload.jsp" method="post" enctype="multipart/form-data">
      이미지를 선택하세요: <input type="file" name="image" />
    <input type="submit" value="upload" />
  </form>
</body>
</html>
