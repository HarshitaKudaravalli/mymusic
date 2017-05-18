<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="style.css" rel="stylesheet" />
<title>Insert title here</title>
<style >
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
     <script>
function validate(){  
	
	if( document.myForm.uid.value == "" )
	   {
	     alert( "Please provide User ID" );
	     document.myForm.cid.focus() ;
	     return false;
	   }
	return (ture);
}
</script>
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
<form  name="myForm"  action="cart.jsp" onsubmit="return (validate());">
<table align="center">
//<tr><td style="color:#f2f2f2"> enter user ID: </td><td> <input type=text name="uid"></td>

<tr><td colspan="2" align="center"><input type="submit" id="add"></td></tr>
</table>
</form>
</body>
</html>

