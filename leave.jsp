<%-- 
    Document   : leave
    Created on : Oct 9, 2018, 1:02:29 PM
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
        <form name="Registration1" method="post" action="leaveentry.jsp"> 
            Emp Code<select  name="code">
                 <%for(int i=0;i<allIds.size();i++){%>
                <option value =<%=allIds.get(i)%>><%=allIds.get(i)%></option>
               <%}%>
                 </select><br>
                 
            Emp Name<input type="text" name="name"><br>
            
            Leave Type<select  name="leave">
                <option value ="leave1">Sick</option>
                <option value="leave2">Work</option>
                 </select><br>
                 
            Units<select  name="units">
                <option value ="unit1">Sunday</option>
                <option value="unit2">Monday</option>
                <option value ="unit3">Tuesday</option>
                <option value="unit4">Wednesday</option>
                <option value ="unit5">Thursday</option>
                <option value="unit6">Friday</option>
                <option value ="unit7">Saturday</option>
               
                 </select><br> 
                 
            Entitlement Units<select  name="entitlement">
                <option value ="1">1 day</option>
                <option value="2">2 days</option>
                <option value ="3">3 days</option>
                <option value="4">4 days</option>
                <option value ="5">5 days</option>
                <option value="6">6 days</option>
                 </select><br>      
            
             
          From<select  name="from">
                <option value ="from1">Sunday</option>
                <option value="from2">Monday</option>
                <option value ="from3">Tuesday</option>
                <option value="from4">Wednesday</option>
                <option value ="fromt5">Thursday</option>
                <option value="from6">Friday</option>
                <option value ="from7">Saturday</option>
               
                 </select><br> 
                 
                 
              To<select  name="to">
                <option value ="to1">Sunday</option>
                <option value="to2">Monday</option>
                <option value ="to3">Tuesday</option>
                <option value="to4">Wednesday</option>
                <option value ="to5">Thursday</option>
                <option value="to6">Friday</option>
                <option value ="to7">Saturday</option>
               
                 </select><br>   
                 
                  <input type="submit" name="insert">
                 
               
            
            
            
        </form>
    </center>
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 - 2109 swetha</div>        
    </div>
    </body>
</html>
