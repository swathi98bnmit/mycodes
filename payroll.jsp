<%-- 
    Document   : payroll
    Created on : Oct 9, 2018, 1:02:57 PM
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

<script>
  function myFunction(x) {
    
    var pbstr = document.forms["Registration1"]["basic"].value;
    var hrstr = document.forms["Registration1"]["hra"].value;
    var tastr = document.forms["Registration1"]["ta"].value;
    var dastr = document.forms["Registration1"]["da"].value;
    var itstr = document.forms["Registration1"]["it"].value;
    var pfstr = document.forms["Registration1"]["pf"].value;
    
    var a = parseInt(pbstr)
    var b = parseInt(hrstr)
    var c = parseInt(tastr)
    var d = parseInt(dastr)
    var e = parseInt(itstr)
    var f = parseInt(pfstr)
    
    var g = a+b+c+d+e+f
    var h = g.toString()
     document.forms["Registration1"]["total"].value = h
     
     var i = g * 12
     var j = a *12
     var k = i.toString()
     var l = j.toString()
     document.forms["Registration1"]["gross"].value = k
     document.forms["Registration1"]["net"].value = l
}  
</script>


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
        <form name="Registration1" method="post" action="payrollentry.jsp"> 
            Emp Code<select  name="code">
                 <%for(int i=0;i<allIds.size();i++){%>
                <option value =<%=allIds.get(i)%>><%=allIds.get(i)%></option>
               <%}%>
                 </select><br>
                 
            Emp Name<input type="text" name="name"><br>               
            Basic Pay <input type="text" name="basic"><br>            
            HRA <input type="text" name="hra"><br>             
            TA <input type="text" name="ta"><br>              
            DA <input type="text" name="da"><br>            
            IT <input type="text" name="it"><br>                
            PF <input type="text" name="pf"><br>            
            Total <input type="text" name="total"   onfocus="myFunction(this)" ><br>
            
            Gross Salary <input type="text" name="gross"><br>
                
            Net Salary <input type="text" name="net"><br>
            
             <input type="submit" name="insert">
            
            
        </form>
    </center>
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 - 2109 swetha</div>        
    </div>
    </body>
</html>
