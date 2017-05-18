<%@page import="java.sql.*" %>

<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String name = request.getParameter("cid");
	String gender = request.getParameter("fname");
	String email = request.getParameter("lname");
        String uname = request.getParameter("company");
        String pass = request.getParameter("addr");
	String addr = request.getParameter("city");
	String pno = request.getParameter("state");
	String pno1 = request.getParameter("country");
	String pno2 = request.getParameter("pc");
	String pno3 = request.getParameter("phone");
	String pno4 = request.getParameter("fax");
	String pno5 = request.getParameter("email");
	String pno6 = request.getParameter("sid");
	
        
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.println("MySQL JDBC Driver Registered!");
		out.println("dngd"+uname);
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
		
		stmt = conn.createStatement();
		
                stmt.executeUpdate("insert into customer values('"+name+"','"+gender+"','"+email+"','"+uname+"','"+pass+"','"+addr+"','"+pno+"','"+pno1+"','"+pno2+"','"+pno3+"','"+pno4+"','"+pno5+"','"+pno6+"')");
               
                rs = stmt.executeQuery("select * from customer where CustomerId='"+name+"'");

               
		
		if(rs.next()){
			//alert( "Please provide customer mail id!" );     
			
			response.sendRedirect("addsuccess.html");
		} else {
                    
                        response.sendRedirect("error.html");
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
