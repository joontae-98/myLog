<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<%
//  response.sendRedirect("/myLog/List.do?start=1&end=10");
  response.sendRedirect("/view/blog.jsp");
%>

</body>
</html>