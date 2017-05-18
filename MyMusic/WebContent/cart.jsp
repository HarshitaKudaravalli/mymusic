<html>
<head>
<link href="style.css" rel="stylesheet" />
<style>
table{
width:100%;
}
.ta1{
padding:15px;
border:1px solid black;
border-collapse:collapse;
text-align:center;
height:50px;
color:#f2f2f2;
}

.ta3{
width:100%;
padding:15px;
border:1px solid pink;
border-collapse:collapse;
text-align:center;
height:50px;
font-weight:bold;
}

.s2 {
height:50px;
width:150px;
font-size:15;
margin-top:70px;
margin-left:50px;
}
.s3{
height:50px;
width:150px;
font-size:15;
margin-top:70px;
margin-right:50px;
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
h1  {  
 margin-top:80px;   
 text-align:center;
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
<h1>Your Shopping Cart</h1>
<table align="center"><tr class="ta3"><td class="ta1">Item Description </td><td class="ta1"> Price</td><td class="ta1">Quantity </td>
<td class="ta1">Delete</td><td class="ta1">Total</td></tr>

<%@page import="java.sql.*" %>

<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String n = request.getParameter("uid");
	String del= request.getParameter("del");
	
      
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
		
		stmt = conn.createStatement();
		if(del!=null)
		{ 
		   stmt.executeUpdate("delete from new where uid ='"+n+"' and name='"+del+"'");	
		}
		
                   rs = stmt.executeQuery("select * from new where uid ='"+n+"'");
                   while(rs.next())
                   {
                	   out.println("<tr class='ta1'><td class='ta1'>");
           			out.println(rs.getString(3));
           			out.println("</td><td class='ta1'>");
                       out.println(rs.getString(5));
                       out.println("</td><td class='ta1'>");
                       out.println(rs.getString(4));
                       out.println("</td><td class='ta1'>");
                       String ra=rs.getString(3);
                       out.println("<form action='cart.jsp'>");
                       out.println("<input type='hidden' name='uid' value='"+n+"'>");
                       out.println("<input type='hidden' name='del' value='"+ra+"'>");
                       out.println("<input type='submit' value='delete'>");
                      
                       out.println("</td><td class='ta1'>");
                       out.println(rs.getString(2));
                       out.println("</td></tr>");
                   }
                   double sum=0;
                   rs.beforeFirst();
                   while(rs.next())
                   {
                	   double sum1= Double.parseDouble(rs.getString(2));
                	   sum =sum+sum1;
                   }
		    out.println("<tr><td colspan='4' class='ta1' align='right'>Sub Total</td><td class='ta1'>'"+sum+"'</td></tr></table>");
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
</table>
    <a href="User.html"><button class="s2">Continue Shopping</button></a>   <a href="1.html"><button class="s3">check out</button></a>              
                   
                   
                   
                   
                   
                   
                   
                   