<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Blog Page</title>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class='top-header'>
            <h1>Create Blog</h1>
            
            <c:if test='${errorMsg}'>
                <h1 class='invalid-entry-msg'>&nbsp;- Invalid Input!</h1>
            </c:if>
        </div>
        
        <form action="${pageContext.request.contextPath}/CreateBlogServlet" method="POST">
            <input type="hidden" name="name" value="${sessionScope.user.name}">
            <table>
                <tbody>
                    <tr>
                        <td>Title:</td>
                        <td><input type="text" name="title"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><textarea rows="8" cols="50" name="blog" placeholder="Enter Blog..."></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class='form-submit-btn' type="submit"></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
