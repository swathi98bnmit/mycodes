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
         ArrayList<String> allUsers = new ArrayList<String>();
         

         ArrayList<String> first = new ArrayList<String>();
         ArrayList<String> second = new ArrayList<String>();
         ArrayList<String> third = new ArrayList<String>();
         ArrayList<String> fourth = new ArrayList<String>();
         ArrayList<String> fifth = new ArrayList<String>();
         ArrayList<String> sixth = new ArrayList<String>();
         ArrayList<String> seventh = new ArrayList<String>();
         ArrayList<String> eigth = new ArrayList<String>();
         ArrayList<String> ninth = new ArrayList<String>();
         ArrayList<String> tenth = new ArrayList<String>();
         ArrayList<String> eleventh = new ArrayList<String>();
         ArrayList<String> twelth = new ArrayList<String>();
         

         ArrayList<String> one = new ArrayList<String>();
         ArrayList<String> two = new ArrayList<String>();
         ArrayList<String> three = new ArrayList<String>();
         ArrayList<String> four = new ArrayList<String>();
         ArrayList<String> five = new ArrayList<String>();
         ArrayList<String> six = new ArrayList<String>();
         
         
 
       %>
       
       <%
       allHistory.clear();
       allUsers.clear();
       
         first.clear();
         second.clear();
         third.clear();
         fourth.clear();
         fifth.clear();
         sixth.clear();
         seventh.clear();
         eigth.clear();
         ninth.clear();
         tenth.clear();
         eleventh.clear();
         twelth.clear();
         
         one.clear();
         two.clear();
         three.clear();
         four.clear();
         five.clear();
         six.clear();
       
       String uFromForms[] = request.getParameterValues("eid");
       for(int i=0;i<uFromForms.length;i++){
           allUsers.add(uFromForms[i]);
       }
       //out.println(allUsers);
       
       String eid = request.getParameter("eid");
       //int eidInt = Integer.parseInt(eid);
       try{           
      
        Class.forName("oracle.jdbc.driver.OracleDriver");        
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tiger");      
        
        Statement stmtZero = con.createStatement();
        ResultSet rsZero= stmtZero.executeQuery("select * from EMPINFO");   
        while(rsZero.next()){
            String eidf = rsZero.getString(1);
         for(int i=0;i<allUsers.size();i++){
             String eids =allUsers.get(i);
             if(eidf.equals(eids)){
                 first.add(rsZero.getString(2));
                 second.add(rsZero.getString(7));
             }
         }
        }
        rsZero.close();
        
        
        
        
        Statement stmtOne = con.createStatement();
        ResultSet rsOne= stmtOne.executeQuery("select * from EMPEXPERIENCE");  
        while(rsOne.next()){
           String eidf = rsOne.getString(1);
         for(int i=0;i<allUsers.size();i++){
             String eids =allUsers.get(i);
             if(eidf.equals(eids)){
                 third.add(rsOne.getString(5));
                 fourth.add(rsOne.getString(6));
             }
         }
        } 
        
        rsOne.close();
        
        
        
        Statement stmtSecond = con.createStatement();
        ResultSet rsSecond= stmtSecond.executeQuery("select * from EMPSHIFT_SCHEDULE");        
       
        while(rsSecond.next()){
              String eidf = rsSecond.getString(1);
         for(int i=0;i<allUsers.size();i++){
             String eids =allUsers.get(i);
             if(eidf.equals(eids)){
                 fifth.add(rsSecond.getString(4));
                 
             }
         } 
        }     
     stmtSecond.close();
     
     Statement stmtThird = con.createStatement();
        ResultSet rsThird= stmtThird.executeQuery("select * from EMP_ATTENDANCE");        
       
        while(rsThird.next()){
            String eidf = rsThird.getString(1);
         for(int i=0;i<allUsers.size();i++){
             String eids =allUsers.get(i);
             if(eidf.equals(eids)){
                 sixth.add(rsThird.getString(4));
                 
             }
         }
        }
        stmtThird.close();
        
        
        
        
        Statement stmtFourth = con.createStatement();
        ResultSet rsFourth= stmtFourth.executeQuery("select * from LEAVE_TYPE");        
       
        while(rsFourth.next()){
             String eidf = rsFourth.getString(1);
         for(int i=0;i<allUsers.size();i++){
             String eids =allUsers.get(i);
             if(eidf.equals(eids)){
                 seventh.add(rsFourth.getString(3));
                 eigth.add(rsFourth.getString(4));
                 
             }
         }
        }
        stmtFourth.close();
        
        
        
        
        Statement stmtFifth = con.createStatement();
        ResultSet rsFifth= stmtFifth.executeQuery("select * from PAYROLL_CALCULATION");        
        
        while(rsFifth.next()){
          String eidf = rsFifth.getString(1);
         for(int i=0;i<allUsers.size();i++){
             String eids =allUsers.get(i);
             if(eidf.equals(eids)){
                 ninth.add(rsFifth.getString(3));
                 tenth.add(rsFifth.getString(9));
                 eleventh.add(rsFifth.getString(10));
                 twelth.add(rsFifth.getString(11));
                 
             }
         }  
        }
        stmtFifth.close();
        con.close();
        
        int actSize = first.size();
        for(int i=second.size();i<actSize;i++){
            second.add("none");
        }
        for(int i=third.size();i<actSize;i++){
            third.add("none");
        }
        for(int i=fourth.size();i<actSize;i++){
            fourth.add("none");
        }
        for(int i=fifth.size();i<actSize;i++){
            fifth.add("none");
        }
        for(int i=sixth.size();i<actSize;i++){
            sixth.add("none");
        }
        for(int i=seventh.size();i<actSize;i++){
            seventh.add("none");
        }
        for(int i=eigth.size();i<actSize;i++){
            eigth.add("none");
        }
        for(int i=ninth.size();i<actSize;i++){
            ninth.add("none");
        }
        for(int i=tenth.size();i<actSize;i++){
            tenth.add("none");
        }
        for(int i=eleventh.size();i<actSize;i++){
            eleventh.add("none");
        }
        for(int i=twelth.size();i<actSize;i++){
            twelth.add("none");
        }
        
//        out.println(first.size());
//        out.println(second.size());
//        out.println(third.size());
//        out.println(fourth.size());
//        out.println(fifth.size());
//        out.println(sixth.size());
//        out.println(seventh.size());
//        out.println(eigth.size());
//        out.println(ninth.size());
//        out.println(tenth.size());
//        out.println(eleventh.size());
//        out.println(twelth.size());
        
        
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
          <%for(int i=0;i<first.size();i++){%>
         <tr>
            
             
             
            <td><%=first.get(i)%></td>
            <td><%=second.get(i)%></td>
            <td><%=third.get(i)%></td>
            <td><%=fourth.get(i)%></td>
            <td><%=fifth.get(i)%></td>
            <td><%=sixth.get(i)%></td>
            <td><%=seventh.get(i)%></td>
            <td><%=eigth.get(i)%></td>
            <td><%=ninth.get(i)%></td>
            <td><%=tenth.get(i)%></td>
            <td><%=eleventh.get(i)%></td>
            <td><%=twelth.get(i)%></td>
            
           
         </tr>
          <%}%>
          </table>
    </center>
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 - 2109 swetha</div>        
    </div>
    </body>
</html>
