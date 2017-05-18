
<%@page import="java.sql.*"%>
    <html>
    <head>
        <link href="style.css" rel="stylesheet" />
        <style>
  
td{
padding:0px 5px 0px 0px;
}
h3{
margin-top:50px;
}
#tab{
margin-top:150px;
}
#im{
height:50px;
margin-left:940px;	
margin-top:70px;
width:50px;
position:absolute;
}
#s2 {
height:50px;
width:100px;
font-size:15;
margin-left:1000px;	
margin-top:70px;
position:absolute;
}
#user2{
width:470px;
height:30px;
margin-top:35px;
margin-right:10px;
}
.logo{
float: left;
margin-top: 15px;
position:absolute;
margin-left:30px;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color:black;
    font-size:30px;
    font-style:italic;   
  }
li {
    float: right;
 }
a:hover{
color:#ffccff;
font-size: 120%;
}
li a {
    display: block;
    padding: 27px;
    text-decoration: none;
    hover:line;
    color:#f2f2f2;
}
    </style>
    </head>
    <body>
    <div class="logo">
<img src="logo.png"/>
</div>
<ul>
<li><a href="#contact"></a></li>
 <li><a href="#about"></a></li>
 <li><a href="#contact"></a></li>
  <li><a href="about.html">About</a></li>
 <li><a href="contact.html">Contact</a></li>
<li><a href="Index.html">Music</a></li>
  <li><a href="1.html">Home</a></li>
</ul>
    <a href="User.html"> <input type="submit" id="s2" value="Back" ></a>
  
   <%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	  String uname = request.getParameter("r");
	  String my = request.getParameter("my"); 
	  %>
	    <form action="cart.jsp" >
<input type="hidden" name="uid" value="<%=my%>">
<input type="image" src="cart.pn
g" id="im" >
</form>
    <%			
	try {
		Class.forName("com.mysql.jdbc.Driver");
		//out.println("MySQL JDBC Driver Registered!");
		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
		
		stmt = conn.createStatement();
		
		if(uname.equalsIgnoreCase("artist"))
		rs = stmt.executeQuery("select * from artist");
		else if(uname.equalsIgnoreCase("song"))
			rs = stmt.executeQuery("select * from track");
		else if(uname.equalsIgnoreCase("Album"))
			rs = stmt.executeQuery("select * from album");
		
		else 
			rs = stmt.executeQuery("select * from genre");
    
   
		out.println("<form action='user2.jsp'>");
		out.println(" <input type='hidden' value="+uname+" name='r'>");
		out.println(" <input type='hidden' value="+my+" name='my'>");
		out.println(" <table align='center' id='tab'>");
		out.println("<tr><td>");
		out.println("<h3 style='color:#f2f2f2'>Enter the "+ uname+" name:</h3>");
		out.println("</td> <td>");
		out.println(" <select id='user2' name='v'>");
         while(rs.next()){ 
        	 out.println(" <option value='"+rs.getString(2)+"'> "+rs.getString(2)+"</option>");
         } 
         out.println("</select></td></tr><tr><td></td>");
         out.println("<td><input type='submit' id='s1'></td>");
         out.println("</tr> </table></form></body>");
			
	
 
	} catch (ClassNotFoundException e) {
		out.println("Where is your MySQL JDBC Driver?");
		e.printStackTrace();
		
	} catch (SQLException e) {
		out.println("Connection Failed! Check output console");
		e.printStackTrace();
		
	} finally{
		try{
			if (rs != null) {
					rs.close();
			}
			if (stmt != null) {
					stmt.close();
			}
			if (conn != null) {
					conn.close();
			} 
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
    		
%>
