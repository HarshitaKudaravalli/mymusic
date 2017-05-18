
<%@page import="java.sql.*"%>

<%
	out.println("-------- MySQL JDBC Connection Testing ------------");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");
        out.println("Username is "+ uname);
        out.println("Password is " + pass);
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.println("MySQL JDBC Driver Registered!");
		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
		
		stmt = conn.createStatement();
		
                String sql = "select * from admin where admin_id = '" + uname + "' and password='" + pass+"'";
                out.println("Query is " + sql);
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
                    out.println("login is successful");
			response.sendRedirect("AdminActivities.html");
		} else {
                    out.println("login is failure");
                        response.sendRedirect("loginerror.html");
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
