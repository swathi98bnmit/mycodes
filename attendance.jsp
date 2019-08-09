<%-- 
    Document   : attendance
    Created on : Oct 9, 2018, 1:01:54 PM
    Author     : LogicMind-1
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
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
        <br><br><br><br><br><br>
        
        
         <%!
           ArrayList<String> allIds = new ArrayList<String>();
       %>
       <%
       try{           
       allIds.clear();
       Class.forName("oracle.jdbc.driver.OracleDriver");        
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tiger");       
        Statement stmt = con.createStatement();
        ResultSet rs= stmt.executeQuery("select * from EMPINFO");
        while(rs.next()){
            allIds.add(rs.getString(1));
        }
        stmt.close();
        con.close();
       }catch(Exception e){
           out.println(e);
       }
       
       %>
        
        
        
        
        
        
        
        <center>
        <form name="Registration1" method="post" action="attendanceentry.jsp"> 
            Emp Code<select  name="code">
                <%for(int i=0;i<allIds.size();i++){%>
                <option value =<%=allIds.get(i)%>><%=allIds.get(i)%></option>
               <%}%>
                 </select><br>
                 
            Emp Name<input type="text" name="name"><br>
               
            Date Time <input type="text" name="date"><br>
            
            Absent Days<input type="text" name="absent"><br>
             
            Intime <input type="text" name="intime"><br>
              
            Outtime <input type="text" name="outtime"><br>
            
            Shift Code <input type="text" name="shiftcode"><br>
                
            Emp Dept <select name="empdept">
                <option value ="Sales">Sales</option>
                <option value="Marketing">Marketing</option>
                <option value="Telecall">Telecall</option>
                <option value="Financial">Financial</option>
            </select><br>
            
             <input type="submit" name="insert">
            
        </form>
    </center>
        
        
        
     <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 - 2109 swetha</div>        
    </div>   
    </body>
</html>
