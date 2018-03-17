<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Student</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Hawking Academy - Create Entry</h1>
        <hr>
        <form action='StudentGrade' method='GET'>
            <table>
                <tr>
                    <td>Student Name</td>
                    <td><input type='text' name='studentname' placeholder=' Name' autofocus></td>
                </tr>
                <tr>
                    <td>Grade</td>
                    <td><input type='text' name='gpa' placeholder=' GPA (ex: 3.0)'></td>
                </tr>
                <tr>
                    <td></td>
                    <td style='text-align: right'><button type='submit' value='Submit'>Submit</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
