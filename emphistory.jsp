<%-- 
    Document   : emphistory
    Created on : Oct 9, 2018, 3:48:06 PM
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
       <%!
  
         ArrayList<String> allHistory = new ArrayList<String>();

 
       %>
       
       <%
       allHistory.clear();
       
       String eid = request.getParameter("eid");
       int eidInt = Integer.parseInt(eid);
       try{           
      
        Class.forName("oracle.jdbc.driver.OracleDriver");        
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tiger");       
        
        Statement stmtZero = con.createStatement();
        ResultSet rsZero= stmtZero.executeQuery("select * from EMPINFO where empid="+eidInt);   
        if(rsZero.next()){
            //out.println(rsFirst.getString(2));
            allHistory.add(rsZero.getString(2));
            allHistory.add(rsZero.getString(7));
        }
        else{
            allHistory.add("none");
            allHistory.add("none");
        }
        rsZero.close();
        
        
        
        
        Statement stmtOne = con.createStatement();
        ResultSet rsOne= stmtOne.executeQuery("select * from EMPEXPERIENCE where empid="+eidInt);  
        if(rsOne.next()){
            //out.println(rsFirst.getString(2));
            allHistory.add(rsOne.getString(5));
            allHistory.add(rsOne.getString(6));
        }
        else{
            allHistory.add("none");
            allHistory.add("none");
        }
        stmtOne.close();
        
        
        
        Statement stmtSecond = con.createStatement();
        ResultSet rsSecond= stmtSecond.executeQuery("select * from EMPSHIFT_SCHEDULE where empid="+eidInt);        
       
        if(rsSecond.next()){
            //out.println(rsFirst.getString(2));
            allHistory.add(rsSecond.getString(4));
           
        }
        else{
            allHistory.add("none");
            
        }     
     stmtSecond.close();
        
        
       
     
     Statement stmtThird = con.createStatement();
        ResultSet rsThird= stmtThird.executeQuery("select * from EMP_ATTENDANCE where empid="+eidInt);        
       
        if(rsThird.next()){
            //out.println(rsFirst.getString(2));
            allHistory.add(rsThird.getString(4));
            
        }
        else{
            allHistory.add("none");
           
        }
        stmtThird.close();
        
        
        
        
        Statement stmtFourth = con.createStatement();
        ResultSet rsFourth= stmtFourth.executeQuery("select * from LEAVE_TYPE where empid="+eidInt);        
       
        if(rsFourth.next()){
            //out.println(rsFirst.getString(2));
            allHistory.add(rsFourth.getString(3));
            allHistory.add(rsFourth.getString(4));
        }
        else{
            allHistory.add("none");
            allHistory.add("none");
        }
        stmtFourth.close();
        
        
        
        
        Statement stmtFifth = con.createStatement();
        ResultSet rsFifth= stmtFifth.executeQuery("select * from PAYROLL_CALCULATION where empid="+eidInt);        
        
        if(rsFifth.next()){
            //out.println(rsFirst.getString(2));
            allHistory.add(rsFifth.getString(3));
            allHistory.add(rsFifth.getString(9));
            allHistory.add(rsFifth.getString(10));
            allHistory.add(rsFifth.getString(11));
        }
        else{
            allHistory.add("none");
            allHistory.add("none");
            allHistory.add("none");
            allHistory.add("none");
        }
        stmtFifth.close();
        
        
        
        
        
        con.close();
       }catch(Exception e){
           out.println(e);
       }
       
       %>
    <center>
<table border = "1">
         <tr>
            <th>Name</th>
            <th>Department</th>
            <th>Duration</th>
            <th>Position</th>
            <th>ScheduleType</th>
            <th>NumberOfAbsents</th>
            <th>LeaveType</th>
            <th>Entitlement</th>
            <th>BasicPay</th>
            <th>TotalAmount</th>
            <th>GrossAmount</th>
            <th>NetAmount</th>
            
         </tr>
         
         <tr>
            <td><%=allHistory.get(0)%></td>
            <td><%=allHistory.get(1)%></td>
            <td><%=allHistory.get(2)%></td>
            <td><%=allHistory.get(3)%></td>
            <td><%=allHistory.get(4)%></td>
            <td><%=allHistory.get(5)%></td>
            <td><%=allHistory.get(6)%></td>
            <td><%=allHistory.get(7)%></td>
            <td><%=allHistory.get(8)%></td>
            <td><%=allHistory.get(9)%></td>
            <td><%=allHistory.get(10)%></td>
            <td><%=allHistory.get(11)%></td>
         </tr>
         
        
         
        
      </table>
    </center>
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 - 2109 swetha</div>        
    </div>
    </body>
</html>
