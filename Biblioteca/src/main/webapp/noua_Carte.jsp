<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga carte</title>
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
    <body style="background-color: rgb(45, 27, 3)">
        <%	
            String titlu = request.getParameter("titlu");
            String an1 = request.getParameter("an");
            String gen = request.getParameter("gen");
            String nrpagini1 = request.getParameter("nrpagini");
            String editura = request.getParameter("editura");
            String idcarte1 = request.getParameter("idcarte");
            
            long idcarte = 0;
            if (idcarte1 != null) {
            	idcarte = Long.valueOf(idcarte1);
        	}
            
            long an = 0;
            if (an1 != null) {
            	an = Long.valueOf(an1);
        	}
            
            long nrpagini = 0;
            if (nrpagini1 != null) {
            	nrpagini = Long.valueOf(nrpagini1);
        	}
            
            if (titlu != null) {
                jb.connect();
                jb.adaugaCarte(idcarte, titlu, an, gen, nrpagini, editura);
                jb.disconnect();
        %>
        
        <h1>The book was added successfully!</h1>
        <p align="center">
        <a href="index.html" class="button button1"><b>Home</b></a>
        </p><%
        } else {
        %>
        
        <h1>Type the details of the new book...</h1>
        
        <form action="noua_Carte.jsp" method="post">
            <table align="center">
                <tr>
                    
                    <td> <input type="text" name="titlu" size="30" placeholder="Title"/></td>
                </tr>
                <tr>
                    
                    <td> <input type="text" name="an" size="30" placeholder="Year"/></td>
                </tr>
                <tr>
                    
                    <td> <input type="text" name="gen" size="30" placeholder="Type"/></td>
                </tr>
                <tr>
                    
                    <td> <input type="text" name="nrpagini" size="30" placeholder="Pages"/></td>
                </tr>
                <tr>
                    
                    <td> <input type="text" name="editura" size="30" placeholder="Publisher"/></td>
                </tr>
            </table>

            <p align="center">
				<button class="button button1"><b>Add book</b></button>
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p>
        </form>
        <%
            }
        %>

    </body>
</html>