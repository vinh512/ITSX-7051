<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Create Student!</h1>
        <form action='StudentGrade' method='POST'>
            <table>
                <tr>
                    <td>Student Name </td>
                    <td><input type='text' name='studentname' placeholder='Name'></td>
                </tr>
                <tr>
                    <td>GPA </td>
                    <td><input type='text' name='gpa' placeholder='Grade'></td>
                </tr>
                <tr>
                    <td></td>
                    <td style='text-align: right'><input type='submit' value='Submit'></td>
                </tr>
            </table>
        </form>
    </body>
</html>