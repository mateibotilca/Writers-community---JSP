<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Scriere</title>
        
<style>

#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 75%;
  margin-left: auto;
  margin-right: auto;
  background-color: rgb(215, 191, 156);
  font-family: "Lucida Console", "Courier New", monospace;
  font-weight: bold;
}

#customers td, #customers th {
  border: 1px solid black;
  padding: 8px;  
}

#customers tr:nth-child{background-color: rgb(186, 145, 114);}

#customers tr:hover {background-color: rgb(186, 145, 114);}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: rgb(55, 77, 43);
  color: white;
  font-family: "Lucida Console", "Courier New", monospace;
  font-weight: bold;
}
 
.button {
  background-color: rgb(55, 77, 43); /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 5px;
  font-family: "Lucida Console", "Courier New", monospace;
}

.button1 {
  background-color: rgb(215, 191, 156); 
  color: black; 
  border: 2px solid rgb(55, 77, 43);
}

.button:hover {
  background-color: rgb(55, 77, 43);
  color: white;
}

h1 {
  color: rgb(215, 191, 156);
  text-align: center;
  font-family: "Lucida Console", "Courier New", monospace;
}

body {
  font-family: "Lucida Console", "Courier New", monospace;
}

</style>
</head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: rgb(77, 47, 12)">
        <h1 align="center"> Contributions' Table:</h1>
        <form action="sterge_Scriere.jsp" method="post">
            <table id="customers">
                <tr>
                    <th>Mark</th>
                    <th>Contribution ID</th>
                    <th>Title</th>
                    <th>Year</th>
                    <th>Type</th>
                    <th>Pages</th>
                    <th>First Name</th>
                    <th>First Name</th>
                    <th>Nationality</th>
                    <th>Months of Contribution</th>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeScriere();
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idscriere");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getString("titlu")%></td>
                    <td><%= rs.getLong("an")%></td>
                    <td><%= rs.getString("gen")%></td>
                    <td><%= rs.getLong("nrpagini")%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("prenume")%></td>
                    <td><%= rs.getString("nationalitate")%></td>
                    <td><%= rs.getLong("durata")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
				<a href="nou_Scriere.jsp" class="button button1"><b>Add a new contribution</b></a>
				<button class="button button1"><b>Delete selcted lines</b></button>
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
    </body>
</html>