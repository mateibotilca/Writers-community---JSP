<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga scriere</title>
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

h3 {
  color: rgb(215, 191, 156);
  text-align: center;
  font-family: "Lucida Console", "Courier New", monospace;
}

input::placeholder {
        color: black; 
        font-weight: bold;
    }

select {
width: 100%;
height: 50px;
  padding: 12px 20px;
  margin: 10px 0;
  box-sizing: border-box;
        background-color: rgb(215, 191, 156); /* Schimbă culoarea fundalului */
        color: black; /* Schimbă culoarea textului */
        border: 5px solid rgb(55, 77, 43); /* Schimbă culoarea și grosimea marginii */
        border-radius: 5px; /* Rotunjirea colțurilor */
  		font-family: "Lucida Console", "Courier New", monospace;
  		font-size: 16px;
  		font-weight: bold;
  		 -webkit-transition: 0.5s;
  		transition: 0.5s;
    }
    
select:focus {
  border: 5px solid white;
}

select::placeholder {
        color: black; 
        font-weight: bold;
    }
        </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: rgb(77, 47, 12)">
        <%
            long idcarte, idautor, an, nrpagini, nrcarti;
            String id1, id2, titlu, gen, editura, nume, prenume, nationalitate, durata1;
            id1 = request.getParameter("idautor");
            id2 = request.getParameter("idcarte");
            durata1 = request.getParameter("durata");
            
            long durata = 0;
            if (durata1 != null) {
            	durata = Long.valueOf(durata1);
        	}
            
            if (id1 != null) {
                jb.connect();
                jb.adaugaScriere(java.lang.Long.parseLong(id1), java.lang.Long.parseLong(id2), durata);
                jb.disconnect();
        %>
        <h1>The contribution was added successfully!</h1>
        <p align="center">
				
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("carti");
        ResultSet rs2 = jb.vedeTabela("autori");
        %>
        <h1>Give the details of the new contribution...</h1>
        <form action="nou_Scriere.jsp" method="post">
            <table align="center">
                <tr>
                    <td> 
                        

			<SELECT NAME="idcarte">
			<option value="" disabled selected>Select a book</option>
                                <%
                                    while(rs1.next()){
                                        idcarte = rs1.getLong("idcarte");
                                        titlu = rs1.getString("titlu");
                                        an = rs1.getLong("an");
                                        gen = rs1.getString("gen");
                                        nrpagini = rs1.getLong("nrpagini");
                                        editura = rs1.getString("editura");
                                %>
                                    <OPTION VALUE="<%= idcarte%>"><%= idcarte%>: <%= titlu%> (<%= an%>)</OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    
                    <td> 
                        
			<SELECT NAME="idautor">
			<option value="" disabled selected>Select an author</option>	
                                <%
                                    while(rs2.next()){
                                        idautor = rs2.getLong("idautor");
                                        nume = rs2.getString("nume");
                                        prenume = rs2.getString("prenume");
                                        nrcarti= rs2.getLong("nrcarti");
                                        nationalitate = rs2.getString("nationalitate");
                                %>
                                    <OPTION VALUE="<%= idautor%>"><%= idautor%>: <%= nume%> <%= prenume%> (<%= nationalitate%>)</OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td> <input type="text" name="durata" size="30" placeholder="Months of contribution"/></td>
                </tr>
            </table>
            <p align="center">
				<button class="button button1"><b>Add contribution</b></button>
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p>
            
        </form>
        <%
            }
        %>
        <br/>
        <br/>
    </body>
</html>