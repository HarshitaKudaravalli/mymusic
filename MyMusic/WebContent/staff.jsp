
<%@page import="java.sql.*"%>

<%
	out.println("-------- MySQL JDBC Connection Testing ------------");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");
        
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.println("MySQL JDBC Driver Registered!");
		
 		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymusic","root", "3488");
		
		stmt = conn.createStatement();
		
                String sql = "select * from employee where EmployeeId = '" + uname + "' and PostalCode='" + pass+"'";
                
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
                    
			response.sendRedirect("StaffActivities.jsp");
		} else {
                    
                        response.sendRedirect("Sloginerror.html");
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
