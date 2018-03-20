<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Counter Page</h1>
        
         

        <%
            Integer req = (Integer)request.getAttribute("request_counter");
            out.println(String.format("<p>This is the request counter: %s</p>", req));
            
            Integer sess = (Integer)session.getAttribute("session_counter");
            out.println(String.format("<p>This is the session counter: %s</p>", sess));
            
            Integer app = (Integer)request.getServletContext().getAttribute("application_counter");
            out.println(String.format("<p>This is the application counter: %s</p>", app));
            %>
        

    </body>
</html>
