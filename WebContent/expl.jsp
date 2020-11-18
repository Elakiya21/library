<%@page import="java.sql.*"%>
<%@page import="oracle.jdbc.driver.*" %>
<%@page import="oracle.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("search");
Connection con1=null;
int i=0;
String s="";
int c=0;
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	con1=DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:xe","system","Elakiya21");  
	Statement stm = con1.createStatement();
    String sql="select * from tablename where columnname='" + id + "'";          
    ResultSet rs = stm.executeQuery(sql);
    while(rs.next()){
  	  s=rs.getString("columnname");
  	  c++;
    }
    if(c>0)
    {
    	out.println("BOOK FOUND IN SHELF NUMBER:" + s);
    }
}
catch(Exception e){ 
	System.out.println(e);
	}  
%>
</body>
</html>