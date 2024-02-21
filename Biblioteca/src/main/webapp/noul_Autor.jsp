<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Autor</title>
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
        </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: rgb(58, 40, 12)">
        <%
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String nrcarti1 = request.getParameter("nrcarti");
            String nationalitate = request.getParameter("nationalitate");
            String idautor1 = request.getParameter("idautor");
            
            long idautor = 0;
            if (idautor1 != null) {
            	idautor = Long.valueOf(idautor1);
        	}
            
            long nrcarti = 0;
            if (nrcarti1 != null) {
            	nrcarti = Long.valueOf(nrcarti1);
        	}
            
            if (nume != null) {
                jb.connect();
                jb.adaugaAutor(idautor, nume, prenume, nrcarti, nationalitate);
                jb.disconnect();
        %>
        <h1>The author was added successfully!</h1>
        <p align="center">
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p><%
        } else {
        %>
         <h1>Type the details of the new author...</h1>
        <form action="noul_Autor.jsp" method="post">
            <table align="center">
                <tr>
                    
                    <td> <input type="text" name="nume" size="30" placeholder="Last Name"/></td>
                </tr>
                <tr>
                    
                    <td> <input type="text" name="prenume" size="30" placeholder="First Name"/></td>
                </tr>
                <tr>
                    
                    <td> <input type="text" name="nrcarti" size="30" placeholder="Books Written"/></td>
                </tr>
                <tr>
                    
                    <td> <input type="text" name="nationalitate" size="30" placeholder="Nationality"/></td>
                </tr>
            </table>
            
            <p align="center">
				<button class="button button1"><b>Add author</b></button>
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p>
           
        </form>
        <%
            }
        %>
        
    </body>
</html>