<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String name = request.getParameter("lname");
	
	//response.setContentType("text/html");
	//PrintWriter out = response.getWriter();
	
        
	try {
		Class.forName("com.mysql.jdbc.Driver");
		//out.println("MySQL JDBC Driver Registered!");
		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
 		stmt = conn.createStatement();
		
		rs = stmt.executeQuery("select * from Album where ArtistId='"+name+"'");
		
		if(rs.next()){
			
	        stmt.executeUpdate("delete from Album where ArtistId='"+name+"'");
    	    stmt.executeUpdate("delete from Artist where ArtistId='"+name+"'");
        	response.sendRedirect("delsuccess.html");
			
		}else{
			//alert( "Please provide customer mail id!" ); 
			//response.sendRedirect("loginerror.html");
			response.sendRedirect("norecord.html");
			//response.sendRedirect("addsuccess.html");
		}

 
	} catch (SQLException e) {
		out.println("Where is your MySQL JDBC Driver?");
		e.printStackTrace();
		
	}  finally{
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
