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


h1 {
  color: rgb(215, 191, 156);
  text-align: center;
  font-family: "Lucida Console", "Courier New", monospace;
}


        </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: rgb(45, 27, 3)">
        <h1 align="center">The changes were made successfully!</h1>
        <br/>
        
        <%
            jb.connect();
            long aux = java.lang.Long.parseLong(request.getParameter("idcarte"));
            String titlu = request.getParameter("titlu");
            String an = request.getParameter("an");
            String gen = request.getParameter("gen");
            String nrpagini = request.getParameter("nrpagini");
            String editura = request.getParameter("editura");

            String[] valori = {titlu, an, gen, nrpagini, editura};
            String[] campuri = {"titlu", "an", "gen", "nrpagini", "editura"};
            jb.modificaTabela("carti", "idcarte", aux, campuri, valori);
            jb.disconnect();
        %>
        
        <p align="center">
				<a href="modifica_Carte.jsp" class="button button1"><b>Modify another book</b></a>
				<a href="noua_Carte.jsp" class="button button1"><b>Add a new book</b></a>
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p>
            <br/>
    </body>
</html>