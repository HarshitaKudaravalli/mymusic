
<%@page import="java.sql.*"%>
    <html>
    <head>
        <link href="style.css" rel="stylesheet" />
        <script src="myjs.js"></script>
        <style>
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
        table{
margin-top:150px;
cellpadding:20px ;

}
tr,td{
padding:7px;
}

#add{
width:100px;
height:30px;
margin-top:30px;
font-size:15px;
}
h3{
margin-top:70px;
}
#user2{
width:450px;
height:30px;
margin-top:70px;
margin-right:10px;
}
#s1{
margin-left:600px
width:150px;
height:50px;
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
.high{
font-size:20px;
font-color:red;
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
        String un = request.getParameter("v");
        String my = request.getParameter("my");
        %>
	    <form action="cart.jsp" >
<input type="hidden" name="uid" value="<%=my%>">
<input type="image" src="cart.png" id="im" >
</form>
<form action="input.jsp">
    <table align="center">
    <tr style="color:#f2f2f2" class="high" ><td>Select</td>
        <td>Album Name </td>
        <td>Artist Name</td>
        <td>Song Name</td>
        <td>Genre</td>
        <td>Unit Price</td>
        <td>Quantity</td>
        <td>Total</td></tr>
    <%
        out.println("<input type='hidden' value='"+my+"' name='uid'>");
    			
	try {
		Class.forName("com.mysql.jdbc.Driver");
		//out.println("MySQL JDBC Driver Registered!");
		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
		
		stmt = conn.createStatement();
		
			if(uname.equalsIgnoreCase("artist"))
				rs = stmt.executeQuery("select * from track,album,artist,genre where artist.name='"+un+"' and artist.artistid=album.artistid and album.albumid=track.albumid and genre.genreid=track.genreid");
			else if(uname.equalsIgnoreCase("song"))
				rs = stmt.executeQuery("select * from track,album,artist,genre where  track.name='"+un+"' and album.albumid=track.albumid and album.artistid=artist.artistid and genre.genreid=track.genreid");
			else if(uname.equalsIgnoreCase("Album"))
				rs = stmt.executeQuery("select * from track,album,artist,genre where album.albumid=track.albumid and album.title='"+un+"' and album.artistid=artist.artistid and track.genreid=genre.genreid");
		    else
				rs = stmt.executeQuery("select * from track,album,artist,genre where genre.genreid=track.genreid and genre.name='"+un+"' and album.albumid=track.albumid and album.artistid=artist.artistid");
										
				int i=0;
			if(!rs.next()) response.sendRedirect("outof.html");
			rs.beforeFirst();
	        while(rs.next()){
	        	i++;
	        out.println("<input type='hidden' value=0 name='myvalue"+i+"' id='myvalue"+i+"'>");
	        out.println("<input type='hidden' value=0 name='myval"+i+"' id='myval"+i+"'>");
	        out.println("<tr style='color:#f2f2f2'><td>");
			out.println("<input type='checkbox' name='name"+i+"' value='"+rs.getString(2)+"'>");
			out.println("</td><td>");
			out.println(rs.getString(11));
			out.println("</td><td>");
            out.println(rs.getString(14));
            out.println("</td><td>");
            out.println(rs.getString(2));
            out.println("</td><td>");
            out.println(rs.getString(16));
            out.println("</td><td>");
            out.println(rs.getString(9));
            out.println("</td><td>");
            out.println("<select name='quant"+i+"' id='mySelect"+i+"'  onclick='getOption("+rs.getString(9)+","+i+")' >");
            out.println("<option value=''></option>");
            out.println("<option value='1'>1</option>");
            out.println("<option value='2'>2</option>");
            out.println("<option value='3'>3</option>");
            out.println("<option value='4'>4</option>");
            out.println("<option value='5'>5</option>");
            out.println("<option value='6'>6</option>");
            out.println("<option value='7'>7</option>");
            out.println("<option value='8'>8</option>");
            out.println("<option value='9'>9</option>");
            out.println("<option value='10'>10</option>");
            out.println("</select> $");
             out.println("</td><td>");
              out.println("<p id='ret"+i+"'></p>");
               
            out.println("</td></tr>");
			}
	        out.println("</table>");
	        out.println("<input type='hidden' name='my' value='"+i+"'>");
		out.println("<input type='submit' id='s1' value='Add to cart'>");
		
	}
	
 
	catch (ClassNotFoundException e) {
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
