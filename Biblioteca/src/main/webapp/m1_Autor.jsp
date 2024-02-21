<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Autori</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <style>      
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

input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 10px 0;
  box-sizing: border-box;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
  font-family: "Lucida Console", "Courier New", monospace;
  font-size: 16px;
  font-weight: bold;
  background-color: rgb(215, 191, 156); 
  color: black; 
  border: 5px solid rgb(55, 77, 43);
  border-radius: 5px;
}

input[type=text]:focus {
  border: 5px solid white;
}

h1 {
  color: rgb(215, 191, 156);
  text-align: center;
  font-family: "Lucida Console", "Courier New", monospace;
}

input::placeholder {
        color: black; 
        font-weight: bold;
    }

.custom-td {
    	color: rgb(215, 191, 156);
        font-family: "Lucida Console", "Courier New", monospace;
 		font-size: 16px;
  		font-weight: bold;
    }
</style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: rgb(58, 40, 12)">
        
               
 <%
    String primarykey = request.getParameter("primarykey");
    if (primarykey == null || primarykey.isEmpty()) {
%>
    <h1 align="center">No line selected for modification!</h1>
    <p align="center">
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p>
<%
    } else {

        jb.connect();
        long aux = java.lang.Long.parseLong(request.getParameter("primarykey"));
        ResultSet rs = jb.intoarceLinieDupaId("autori", "idautor", aux);
        rs.first();
        long id1 = rs.getLong("idautor");
        long idautor;
        String nume = rs.getString("nume");
        String prenume = rs.getString("prenume");
        long nrcarti = rs.getLong("nrcarti");
        String nationalitate = rs.getString("nationalitate");
        rs.close();
        jb.disconnect();
    %>
%>		
<h1 align="center">Authors' table:</h1>
        <form action="m2_Autor.jsp" method="post">
            <table align="center">
            	<tr>
                    <td align="center" class="custom-td">ID:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="idautor" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="center" class="custom-td">Last Name:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="nume" size="30" value="<%= nume%>"/></td>
                </tr>
                <tr>
                    <td align="center" class="custom-td">First Name:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="prenume" size="30" value="<%= prenume%>"/></td>
                </tr>
                <tr>
                    <td align="center" class="custom-td">Books Written:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="nrcarti" size="30" value="<%= nrcarti%>"/></td>
                </tr>
                <tr>
                    <td align="center" class="custom-td">Nationality:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="nationalitate" size="30" value="<%= nationalitate%>"/></td>
                </tr>
            </table>
             <p align="center">
				<button class="button button1"><b>Modify author</b></button>
				<a href="noul_Autor.jsp" class="button button1"><b>Add a new author</b></a>
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p>
        </form>
        <%
    }
%>
    </body>
</html>