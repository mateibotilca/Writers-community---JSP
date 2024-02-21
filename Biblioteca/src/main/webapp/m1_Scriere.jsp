<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Scriere</title>
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
    <body style="background-color: rgb(77, 47, 12)">
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
        	long an, nrpagini, nrcarti, durata;
            String titlu, gen, editura, nume, prenume, nationalitate;

            long aux = java.lang.Long.parseLong(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceScriereId(aux);
            rs.first();
            long id1 = rs.getLong("idcarte_scriere");
            long id2 = rs.getLong("idautor_scriere");

            titlu = rs.getString("titlu");
            an = rs.getLong("an");
            gen = rs.getString("gen");
            nrpagini = rs.getLong("nrpagini");
            editura = rs.getString("editura");
            nume = rs.getString("nume");
            prenume = rs.getString("prenume");
            nrcarti = rs.getLong("nrcarti");
            nationalitate = rs.getString("nationalitate");
            durata = rs.getLong("durata");

            ResultSet rs1 = jb.vedeTabela("carti");
            ResultSet rs2 = jb.vedeTabela("autori");
            long idcarte, idautor;


        %>
        <form action="m2_Scriere.jsp" method="post">
            <table align="center">
            	<tr>
                    <td align="center" class="custom-td">ID:</td>
                    
                </tr>
                <tr>
                    
                    <td> <input type="text" name="idscriere" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="center" class="custom-td">Book:</td>
                    
                </tr>
                <tr>
                    <td> 
                        <SELECT NAME="idcarte">
                            <%
                                while (rs1.next()) {
                                    idcarte = rs1.getLong("idcarte");
                                    titlu = rs1.getString("titlu");
                                    an = rs1.getLong("an");
                                    gen = rs1.getString("gen");
                                    nrpagini = rs1.getLong("nrpagini");
                                    editura = rs1.getString("editura");
                                    if (idcarte != id1) {
                            %>
                            <OPTION VALUE="<%= idcarte%>"><%= idcarte%>, <%= titlu%>, <%= an%>, <%= gen%>, <%= nrpagini%>, <%= editura%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcarte%>"><%= idcarte%>, <%= titlu%>, <%= an%>, <%= gen%>, <%= nrpagini%>, <%= editura%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="center" class="custom-td">Author:</td>
                    
                </tr>
                <tr>
                    
                    <td> 
                        <SELECT NAME="idautor">
                            <%
                                while (rs2.next()) {
                                	idautor = rs2.getLong("idautor");
                                    nume = rs2.getString("nume");
                                    prenume = rs2.getString("prenume");
                                    nrcarti = rs2.getLong("nrcarti");
                                    nationalitate = rs2.getString("nationalitate");
                            if (idautor != id2) {
                            %>
                            <OPTION VALUE="<%= idautor%>"><%= idautor%>, <%= nume%>, <%= prenume%>, <%= nrcarti%>, <%= nationalitate%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idautor%>"><%= idautor%>, <%= nume%>, <%= prenume%>, <%= nrcarti%>, <%= nationalitate%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="center" class="custom-td">Months of contribution:</td>
                    
                </tr>
                <tr>
                    <td> <input type="text" name="durata" size="30" value="<%= durata%>"/></td>
                </tr>
            </table>
            <p align="center">
				<button class="button button1"><b>Modify contribution</b></button>
				<a href="nou_Scriere.jsp" class="button button1"><b>Add a new contribution</b></a>
				<a href="index.html" class="button button1"><b>Home</b></a>
			</p>
        </form>
        
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    }
    %>
</html>