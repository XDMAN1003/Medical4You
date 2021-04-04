<%-- 
    Document   : calc1
    Created on : Dec 3, 2020, 2:25:40 PM
    Author     : GATES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calc</h1>
        
        <%
            int operand1 = Integer.parseInt(request.getParameter("operand1"));
            int operand2 = Integer.parseInt(request.getParameter("operand2"));
            String operator = request.getParameter("operator");
        %> 
        
        <%
            if (operator.equals("plus")) {
                int total = operand1 + operand2;
                out.println("<p>" + operand1 + " + " + operand2 + " = " + total + "</p>");
            }
        %>    
    </body>
</html>
