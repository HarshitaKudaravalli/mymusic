
<%@page import="java.sql.*"%>
<html>
<head>
<link href="style.css" rel="stylesheet" />
<style>
#ta
{
margin-top:80px;

}
#s2 {
height:50px;
width:100px;
font-size:15;
margin-left:1000px;	
margin-top:70px;
}
button,input 
{
color:black;
background-color:#f2f2f2;
height:50px;
width:250px;
font-size:20;
margin:10px;

}
.ta1{
padding:10px;
border:1px solid black;
border-collapse:collapse;
text-align:center;
height:50px;
color:#f2f2f2
}
tr.ta1:nth-child(even){background-color: #f2f2f2}
tr.ta1:nth-child(even){color: black}
.ta2{
padding:10px;
border:1px solid pink;
border-collapse:collapse;
text-align:center;
height:50px;
color:#f2f2f2
}
tr.ta2:nth-child(even){background-color: #f2f2f2}
tr.ta2:nth-child(even){color: black}
.ta3{
padding:10px;
border:1px solid pink;
border-collapse:collapse;
text-align:center;
height:50px;
font-weight:bold;
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
<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
        String uname = request.getParameter("uname");
        String u1 = request.getParameter("some1");
        String u2 = request.getParameter("some2");
        String u3 = request.getParameter("some3");
      
	try {
		Class.forName("com.mysql.jdbc.Driver");
	
		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
		
		stmt = conn.createStatement();
		if(u1==null&&u2==null&&u3==null){
                String sql = "select * from customer where FirstName = '" + uname + "' ";
               
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){%>
		<a href='StaffActivities.jsp'><button id='s2'>back</button></a>
		<form >
               <table align="center" id="ta">
<tr><td> <button name="some1" value=<%=uname %>>View customer details </button> </td></tr>
<tr><td> <button name="some2" value=<%=uname %>>retrieve customer invoice </button></td></tr>
<tr><td><button name="some3" value=<%=uname %>>create a new Invoice </button> </td></tr>

</table>
</form>
</body>
</html>     
			
		<%} else {%>
		      <h3 align="center" margin-top:200px;> Customer not found</h3>
		      	
               <table align="center">
<tr><td><a href="addcustomer.html"> <input type="submit" name=<%=uname%> value="Create Customer"> </a></td></tr>
</table>

                  
                <%}
		}else if(u1!=null&&u2==null&&u3==null)
		{
			String sql = "select * from customer where FirstName = '" + u1 + "' ";
            rs = stmt.executeQuery(sql);
        	out.println("<a href='StaffActivities.jsp'><button id='s2'>back</button></a>");
            out.println("<table align='center' class='ta1'> ");
            out.println("<tr style='color:#f2f2f2' class='ta3'><td class='ta1'>Customer ID</td><td class='ta1'>First Name</td><td class='ta1'>Last Name</td><td class='ta1'>Company</td><td class='ta1'>Address</td><td class='ta1'>City</td><td class='ta1'>State</td>");
            out.println("<td class='ta1'>Country</td><td class='ta1'>Postal Code</td><td class='ta1'>Phone</td><td class='ta1'>Fax</td><td class='ta1'>Email</td><td class='ta1'>SupportRepId</td></tr>");
			while(rs.next()){
			
			out.println("<tr style='color:#f2f2f2'  class='ta1'><td class='ta1'>");
			out.println(rs.getInt(1));
			out.println("</td><td class='ta1'>");
            out.println(rs.getString(2));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(3));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(4));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(5));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(6));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(7));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(8));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(9));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(10));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(11));
            out.println("</td><td class='ta1'>");
            out.println(rs.getString(12));
            out.println("</td><td class='ta1'>");
            out.println(rs.getInt(13));
            out.println("</td></tr>");
			}
			out.println("</table>");
		
		}
		else if(u1==null&&u2!=null&&u3==null)
		{
			String sql = "select * from invoice,customer where FirstName = '" + u2 + "' and invoice.CustomerId=customer.CustomerId ";
            rs = stmt.executeQuery(sql);
            out.println("<a href='StaffActivities.jsp'><button id='s2'>back</button></a>");
            out.println("<table align='center' class='ta2'>");
            out.println("<tr style='color:#f2f2f2' class='ta3'><td class='ta2'>Invoice ID</td><td class='ta2'>Customer ID</td><td class='ta2'>Invoice Date</td><td class='ta2'>Billing-Address</td><td class='ta2'>Billing-City</td><td class='ta2'>Billing-State</td>");
            out.println("<td class='ta2'>Billing-Country</td><td class='ta2'>Postal Code</td><td class='ta2'>Total</td></tr>");
			while(rs.next()){
			out.println("<tr class='ta2'><td>");
			out.println(rs.getInt(1));
			out.println("</td><td>");
            out.println(rs.getInt(2));
            out.println("</td><td>");
            out.println(rs.getString(3));
            out.println("</td><td>");
            out.println(rs.getString(4));
            out.println("</td><td>");
            out.println(rs.getString(5));
            out.println("</td><td>");
            out.println(rs.getString(6));
            out.println("</td><td>");
            out.println(rs.getString(7));
            out.println("</td><td>");
            out.println(rs.getString(8));
            out.println("</td><td>");
            out.println(rs.getString(9));
            out.println("</td></tr>");
			}
			out.println("</table>");
		
		}
		else if(u1==null&&u2==null&&u3!=null){
			response.sendRedirect("createinvoice.jsp");
			
		}
 
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
