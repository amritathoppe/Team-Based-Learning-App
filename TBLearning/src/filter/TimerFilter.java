package filter;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Pattern;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.umsl.java.beans.LoginBean;


public class TimerFilter implements javax.servlet.Filter { 
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws java.io.IOException, javax.servlet.ServletException {
	    HttpServletRequest req = (HttpServletRequest)request;
	    HttpServletResponse res = (HttpServletResponse)response;
	    HttpSession session = req.getSession(false);
	    String url = null;
//	    String queryString = null;
	    if (request instanceof HttpServletRequest) {
	    	 url = ((HttpServletRequest)request).getRequestURL().toString();
//	    	 queryString = ((HttpServletRequest)request).getQueryString();
	    	 System.out.println(url);
	    	}
	    
	    if (session == null) {
	    		System.out.println("Session is null");
	    		HttpServletResponse httpResponse = (HttpServletResponse) response;
	    		httpResponse.sendRedirect("login.jsp");
	    } else {   	    	 	
	   	    	String user = (String) session.getAttribute("userName");
	   	    	System.out.println("username:" + user);
	   	    	System.out.println("Session refreshed.");
	   	    	System.out.println("Timer Filter reporting: " + session.getId());
	   	    	session.setMaxInactiveInterval(60);
	   	    	 	
	   	    	LoginBean loginBean = new LoginBean();
	   	    	String query = "SELECT * FROM tblusers WHERE TblUsers_SSO = '"+user+"';";
	   	    	ResultSet rs2 = loginBean.getAllData(query);
				try {
					rs2.next();
					if (Pattern.matches("(.*)/admin.jsp", url)) {
							if (!rs2.getString("TblUsers_UsertypeID").equals("ADM")) {
								res.sendError(403, "User is not an admin.");
								System.out.println("User is not an admin.");
							}
							else // User is an admin
								chain.doFilter(request, response);
		   	    	}
		   	    	else if (Pattern.matches("(.*)/instructor.jsp", url)) {
							if (!rs2.getString("TblUsers_UsertypeID").equals("INS")) {
								res.sendError(403, "User is not an instructor.");
								System.out.println("User is not an instructor.");
							}
							else // User is an admin
								chain.doFilter(request, response);
		   	    	}
		   	  	else if (Pattern.matches("(.*)/change_password.jsp", url)) {
					if (!rs2.getString("TblUsers_UsertypeID").equals("INS")) {
						res.sendError(403, "User is not an instructor.");
						System.out.println("User is not an instructor.");
					}
					else // User is an admin
						chain.doFilter(request, response);
		   	  	}
		   	 	else if (Pattern.matches("(.*)/instructor.jsp", url)) {
					if (!rs2.getString("TblUsers_UsertypeID").equals("INS")) {
						res.sendError(403, "User is not an instructor.");
						System.out.println("User is not an instructor.");
					}
					else // User is an admin
						chain.doFilter(request, response);
		   	 	}
		   	    	else // User is not accessing admin page
		   	    		chain.doFilter(request, response); // Logged-in user found, so just continue request.
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
	    }
    }
}