<html>
<head>
<link href="style.css" rel="stylesheet" />
<style>
h1  {  
 margin-top:80px;   
 text-align:center;
 color:#f2f2f2;
     }
.s2 {
height:50px;
width:150px;
font-size:15;
margin-top:70px;
margin-left:400px;
float:left;
}
.s3{
height:50px;
width:150px;
font-size:15;
margin-top:70px;
margin-right:400px;
float:right;
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


<%@page import="java.sql.*" %>

<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String n=request.getParameter("my");
	String uid= request.getParameter("uid");
	int i=1;
	int j=((n == null) ? 0 :Integer.parseInt(n));
	
	try 
	{
		
		Class.forName("com.mysql.jdbc.Driver");		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
 		stmt = conn.createStatement();
 	
 		
	for(i=1;i<=j;i++)
	{ 	String nameval = "name"+i;
	
		if(request.getParameter(nameval) != null)
		{
			String name = request.getParameter("myvalue"+i);
			String gender = request.getParameter("name"+i);
			String email = request.getParameter("quant"+i);
			String price = request.getParameter("myval"+i);
		
				
				stmt.executeUpdate("insert into new values('"+uid+"','"+name+"','"+gender+"','"+email+"','"+price+"')");
			
		}
	}
	rs=stmt.executeQuery("select * from new where uid='"+uid+"'");
	
	if(rs.next())
	{
		out.println("<h1>Successfully added to Cart..</h1>"); 
		out.println("<a href='User.html'><button class='s2'> Continue Shopping</button></a>");
		out.println("<form action='cart.jsp'>");
		out.println("<input type='hidden' name='uid' value='"+uid+"'>");
		out.println("<input type='submit' class='s3' value='View Cart'>"); 
	}
	else
		out.println("error");
	} catch (ClassNotFoundException e) {
		out.println("Where is your MySQL JDBC Driver?");
		e.printStackTrace();
		
	} 

	
	finally{
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
