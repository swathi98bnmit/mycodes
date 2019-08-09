<%-- 
    Document   : empinforeg
    Created on : 8 Oct, 2018, 12:19:29 PM
    Author     : SWATHI
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<meta charset="utf-8">
<title>Swetha: Employee Management System</title>
<style type="text/css">
    /* Add some padding on document's body to prevent the content
    to go underneath the header and footer */
    body{        
        padding-top: 60px;
        padding-bottom: 40px;
    }
    .fixed-header, .fixed-footer{
        width: 100%;
        position: fixed;        
        background: #333;
        padding: 10px 0;
        color: #fff;
    }
    .fixed-header{
        top: 0;
    }
    .fixed-footer{
        bottom: 0;
    }
    .container{
        width: 80%;
        margin: 0 auto; /* Center the DIV horizontally */
    }
    nav a{
        color: #fff;
        text-decoration: none;
        padding: 7px 25px;
        display: inline-block;
    }
</style>


    <div class="fixed-header">
        <div class="container">
            <nav>
        <a href="registration.html">Register New User</a>
        <a href="empexpentry.jsp">Experience Entry</a>
        <a href="shift.jsp">Shift Entry</a>
        <a href="attendance.jsp">Attendance Entry</a>
        <a href="leave.jsp">Leave Entry</a>
        <a href="payroll.jsp">Payroll Entry</a> 
        <a href="historyfinal.jsp">History</a>
            </nav>
        </div>
    </div>
    <div class="container">
        <p>Employee Management System</p>
    </div> 
    <body>
        <%
            try{
       String id = request.getParameter("number");
       String name = request.getParameter("name");
       String password = request.getParameter("password");
       String reenter = request.getParameter("reenter");
       String dob = request.getParameter("dob");
       String gender = request.getParameter("gender");
       String doj = request.getParameter("doj");
       String dept = request.getParameter("dept");
       
       
        Class.forName("oracle.jdbc.driver.OracleDriver");        
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tiger");       
        Statement stmt = con.createStatement();
        int actId = Integer.parseInt(id);
        String query = "insert into EMPINFO values("+actId+",'"+name+"','"+password+"','"+reenter+"','"+dob+"','"+gender+"','"+doj+"','"+dept+"')";
        //out.println(query);
        int status = stmt.executeUpdate(query);
        stmt.close();
        con.close();
         out.println("successfully registered..!");      
            }catch(Exception e){
                out.println(e);
                
                out.println("registration not success..!");
            }      
        %>       
    </body>
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 - 2109 swetha</div>        
    </div>
</html>
