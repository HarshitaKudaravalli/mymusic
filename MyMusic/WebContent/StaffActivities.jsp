<html>
<head>
<title></title>
<script type="text/javascript">
function validate(){  
 if( document.myForm.user2.value == "" )
   {
     alert( "Please provide customer name!" );
     document.myForm.user2.focus() ;
     return false;
   }

return (ture);
}</script>
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
#s3{
height:30px;
width:150px;
font-size:15;
margin:2px;
}
td {
padding:7px;
}
#user2{
width:470px;
height:30px;
}
</style>
<link href="style.css" rel="stylesheet" />
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

</body>
</html>
<%@page import="java.sql.*"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
       
	try {
		Class.forName("com.mysql.jdbc.Driver");		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
		stmt = conn.createStatement();
		
                String sql = "select FirstName from customer";
             	rs = stmt.executeQuery(sql);
		
		out.println("<form action='staffsearch.jsp' name='myForm'  onsubmit='return (validate());'>");
        out.println("  <table align='center'>");
          out.println("<tr style='color:#f2f2f2'><td id='data'>Enter Customer Name:</td><td id='data'>");
		
		out.println(" <select id='user2' name='uname'>");
        while(rs.next()){ 
       	 out.println(" <option value='"+rs.getString(1)+"'> "+rs.getString(1)+"</option>");
        } 
        out.println("</select></td></tr><tr><td colspan='2' align='center'><input type='submit' value='Search' id='s1'></td></tr>");
        out.println("</table></form>");
        %>
         <h3 align="center" style='color:#f2f2f2' >If Customer not found</h3>
		      	
               <table align="center">
<tr><td><a href="addcust.html"> <input type="submit" name="nam" id="s3" value="Create Customer"> </a></td></tr>
</table>
        
         <%
        
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
