<%@page import="java.sql.*" %>

<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String name = request.getParameter("cid");
	String gender = request.getParameter("fname");
	String email = request.getParameter("lname");
  
        String pass = request.getParameter("addr");
	
	
        
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.println("MySQL JDBC Driver Registered!");
		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
		
		stmt = conn.createStatement();
		
                stmt.executeUpdate("insert into Artist values('"+email+"','"+pass+"')");
                stmt.executeUpdate("insert into Album values('"+name+"','"+gender+"','"+email+"')");
                rs = stmt.executeQuery("select * from Album where AlbumId='"+name+"'");

               
		
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
