<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login:</h1>
        
        <form method="POST" action="/writedb/HomeSerlet">
            <table>
                <tr>
                    <td>Name</td>
                    <td>Password</td>
                </tr>
                <tr>
                    <td><input type="text" name="name"></td>
                    <td><input type="text" name="password"></td>
                    <td><input type="button" value="Submit"></td> 
                </tr>
            </table>
        </form>

        <br>
        <hr>

        <h1>Register:</h1>

        <form method="POST" action="/writedb/HomeServlet">
            <table>
                <tr>
                    <td><input type="text" name="first_name" placeholder="First name"></td>
                    <td><input type="text" name="last_name" placeholder="Last name"></td>
                </tr>
                <tr>
                    <td><input type="text" name="email" placeholder="Email"></td>                    
                    <td><input type="text" name="password" placeholder="Password"></td>
                    <td><input type="button" value="Submit"></td> 
                </tr>
            </table>
        </form>
        
    </body>
</html>
