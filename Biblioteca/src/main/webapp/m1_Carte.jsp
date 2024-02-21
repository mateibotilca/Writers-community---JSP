<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Carti</title>
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
    <body style="background-color: rgb(45, 27, 3)">
        
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
        ResultSet rs = jb.intoarceLinieDupaId("carti", "idcarte", aux);
        rs.first();
        long id2 = rs.getLong("idcarte");
        long idcarte;
        String titlu = rs.getString("titlu");
        long an1 = rs.getLong("an");
        String gen = rs.getString("gen");
        long nrpagini1 = rs.getLong("nrpagini");
        String editura = rs.getString("editura");
        rs.close();
        jb.disconnect();
%>		
	<h1 align="center">Books' table:</h1>
        <form action="m2_Carte.jsp" method="post">
            <table align="center">
            <tr>
					<td align="center" class="custom-td">Id:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="idcarte" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
					<td align="center" class="custom-td">Title:</td>
                </tr>
                <tr>
                    <td> <input type="text" name="titlu" size="30" value="<%= titlu%>"/></td>
                </tr>
                <tr>
					<td align="center" class="custom-td">Year:</td>
                </tr>
                <tr>
					
                    <td> <input type="text" name="an" size="30" value="<%= an1%>"/></td>
                </tr>
                <tr>
					<td align="center" class="custom-td">Type:</td>
                </tr>
                <tr>

                    <td> <input type="text" name="gen" size="30" value="<%= gen%>"/></td>
                </tr>
                <tr>
					<td align="center" class="custom-td">Pages:</td>
                </tr>
                <tr>

                    <td> <input type="text" name="nrpagini" size="30" value="<%= nrpagini1%>"/></td>
                </tr>
                <tr>
					<td align="center" class="custom-td">Publisher:</td>
                </tr>
                <tr>

                    <td> <input type="text" name="editura" size="30" value="<%= editura%>"/></td>
                </tr>
            </table>
            <p align="center">
				<button class="button button1"><b>Modify book</b></button>
				<a href="noua_Carte.jsp" class="button button1"><b>Add a new book</b></a>
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p>
        </form>
        <%
    }
%>
    </body>
</html>