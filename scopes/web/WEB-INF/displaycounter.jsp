<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Counter Value</title>
    </head>
    <body>
        <h1>Scope Count:</h1>
        <hr>
        <%
            Integer req = (Integer) request.getAttribute("request_counter");
            out.println(String.format("<p>Request counter: %s</p>", req));

            Integer sess = (Integer) session.getAttribute("session_counter");
            out.println(String.format("<p>Session counter: %s</p>", sess));

            Integer app = (Integer) request.getServletContext().getAttribute("application_counter");
            out.println(String.format("<p>Application counter: %s</p>", app));
        %>
    </body>
</html>
