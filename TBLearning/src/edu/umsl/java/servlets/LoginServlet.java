package edu.umsl.java.servlets;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import edu.umsl.java.beans.LoginBean;
import edu.umsl.java.beans.SendEmail;

@WebServlet("/Servlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    // A GET request results from a normal request for a URL or from an HTML form that has no METHOD specified 
    // and it should be handled by doGet() method.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String parts = request.getParameter("task");
		System.out.println("task is: " + parts);
		String[] task = parts.split("&");

		HttpSession ssession = request.getSession(false);
		
		if((!task[0].equals("login") || !task[0].equals("logout") || !task[0].equals("changePassword") || !task[0].equals("forgotPassword") || !task[0].equals("changePasswordLink")) && ssession == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
			if(ssession != null) {
		
			System.out.println(ssession.getAttribute("userName"));
		

		System.out.println("task is: " + task[0]);
		
		if (task[0].equals("login")) { // Login
			String ssoId = request.getParameter("ssoId");
			String password = request.getParameter("password");		
			
			/* Check user name against the database */
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM tblusers WHERE TblUsers_SSO = '"+ssoId+"';";
			ResultSet rs = loginBean.getAllData(query);
			try {
				if (rs.next()) {
					System.out.println("User verified.");

					String passQuery = "SELECT PasswordTracking_SSO, PasswordTracking_TryNO FROM passwordtracking WHERE PasswordTracking_SSO = '"+ssoId+"';";
					ResultSet rs2 = loginBean.getAllData(passQuery);
					rs2.next();
							
					if(rs2.getInt("PasswordTracking_TryNO") < 3) {
						
						
						if(rs.getString("TblUsers_UserPass").equals(password)) {
							System.out.println("Login successful.");
							loginBean.UpdatePasswordTrack(ssoId, 0);
							
							rs2.close();
							// Start session
							HttpSession session = createSession(request, response, ssoId);
							request.setAttribute("session", session);

							if (rs.getString("TblUsers_UsertypeID").equals("ADM")) {
								System.out.println("User is admin.");
								String query2 = "SELECT * FROM tblusertype";
								ResultSet rs3 = loginBean.getAllData(query2);
								request.setAttribute("resultSet", rs3);						
								request.getRequestDispatcher("/admin.jsp").forward(request, response);
							}
							else if(rs.getString("TblUsers_UsertypeID").equals("INS")) {
								response.sendRedirect(request.getContextPath() + "/instructor.jsp");
							}
							else if (rs.getString("TblUsers_UsertypeID").equals("STD")) {
								response.sendRedirect(request.getContextPath() + "/student.jsp");
							}
						}
						else {
							System.out.println("Failed login attempt.");
							Integer tryNO = rs2.getInt("PasswordTracking_TryNO");
							tryNO += 1;
							loginBean.UpdatePasswordTrack(ssoId, tryNO);
							rs.close();
							rs2.close();
							response.sendRedirect(request.getContextPath() + "/login.jsp");
						}
					}
					else {
						System.out.println("User reached max login attempts.");
						request.setAttribute("reachedFailedLoginAttempts", true);
						rs2.close();					
						response.sendRedirect(request.getContextPath() + "/login.jsp");
					}
				}
				else {
					System.out.println("User unknown.");
					rs.close();
					response.sendRedirect(request.getContextPath() + "/login.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if (task[0].equals("logout")) { // Logout
			HttpSession session = request.getSession(false);
			if(session.getAttribute("userName") != null)
				session.invalidate();
			
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
		else if (task[0].equals("forgotPassword")) {
			// Create session in db
			String ssoId = request.getParameter("ssoId");
			LoginBean loginBean = new LoginBean();
		    HttpSession session = request.getSession(true);
			System.out.println(ssoId + " " + session.getId());
		    loginBean.InsertNewSession(ssoId, session.getId());
		    session.invalidate();
		    
		    // Send email
			String query = "SELECT TblUsers_Email FROM tblusers WHERE TblUsers_SSO = '"+ssoId+"';";
			loginBean.Update_Func(query);
			ResultSet rs = loginBean.getAllData(query);
			try {
				if (rs.next()) {
					SendEmail newEmail = new SendEmail();
					try {
						System.out.println(rs.getString("TblUsers_Email"));
						String subject = "Please create your new password!";
						String body = "Click the link to reset your password.\nhttp://localhost:8090/TBLearning/LoginServlet?task=changePasswordLink&session_id=" + session.getId();
						newEmail.email(subject, body, rs.getString("TblUsers_Email"));
						request.setAttribute("userExists", true);
						request.getRequestDispatcher("/login.jsp").forward(request, response);
//						response.sendRedirect(request.getContextPath() + "/login.jsp");
					} catch (MessagingException e) {
						e.printStackTrace();
					}
				}
				else {
					request.setAttribute("userExists", false);
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (task[0].equals("changePasswordLink")) {
			String sessionId = request.getParameter("session_id");
			System.out.println(sessionId);
			
			String query = "SELECT * FROM session_id WHERE active_session_id = '"+sessionId+"';";
			LoginBean loginBean = new LoginBean();
			ResultSet rs = loginBean.getAllData(query);
			
			try {
				if (rs.next()) {
					String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
					System.out.println("Current Time: " + timeStamp);
					System.out.println("Expiration Time: " + rs.getString("time_session_is_deactivated"));
					if(timeStamp.compareTo(rs.getString("time_session_is_deactivated")) < 0) {
						String query2 = "UPDATE session_id SET time_session_is_activated = CURRENT_TIMESTAMP, "
								+ "time_session_is_deactivated = DATE_ADD(CURRENT_TIMESTAMP, INTERVAL '02:30' HOUR_MINUTE) "
								+ "WHERE active_session_id = '"+sessionId+"';";
						loginBean.Update_Func(query2);
						request.setAttribute("userName", rs.getString("sso_id"));
						request.getRequestDispatcher("/change_password.jsp").forward(request, response);
					}
					else {
						request.setAttribute("alert", "Your active session has expired!");
						request.setAttribute("message", "Please click \"forgot password\" to send a password reset link sent to your email.");
						request.getRequestDispatcher("/login.jsp").forward(request, response);
					}
				}
				else {
					request.setAttribute("alert", "No session ID has been created!");
					request.setAttribute("message", "Please click \"forgot password\" to send a password reset sent to your email.");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if (task[0].equals("changePassword")) {
			HttpSession session = request.getSession(false);
			
			if (session.getAttribute("userName") != null)
			{
				System.out.println("User is logged in.");

				String password = request.getParameter("password");
				String TblUsers_SSO = (String) session.getAttribute("userName");
				
				System.out.println(TblUsers_SSO + " " + password);
				String query = "UPDATE tblusers SET TblUsers_UserPass = '"+password+"' WHERE TblUsers_SSO = '"+TblUsers_SSO+"';";
				LoginBean loginBean = new LoginBean();
				loginBean.Update_Func(query);
			}
			else {
				System.out.println("User is not logged in.");

//				String session_id = request.getParameter("session_id");
//				System.out.println("Session is null: " + session_id);

					String[] session_id = task[1].split("=");
					String query = "SELECT sso_id FROM session_id WHERE active_session_id = '"+session_id[1]+"';";
					LoginBean loginBean = new LoginBean();
					ResultSet rs = loginBean.getAllData(query);					
					String password = request.getParameter("password");
					System.out.println("Password is:" + password + " Session: "+ session_id[1]);
					try {
						if(rs.next()) {
							String TblUsers_SSO = rs.getString("sso_id");
							System.out.println(TblUsers_SSO + " " + password);

							System.out.println("UPDATE tblusers SET TblUsers_UserPass = '"+password+"' WHERE TblUsers_SSO = '"+TblUsers_SSO+"';");
							String query2 = "UPDATE tblusers SET TblUsers_UserPass = '"+password+"' WHERE TblUsers_SSO = '"+TblUsers_SSO+"';";
							loginBean.Update_Func(query2);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
			
			response.sendRedirect(request.getContextPath() + "/change_password.jsp?status=s");
		}
		else if (task[0].equals("userCreation")) { // User Creation
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String ssoId = request.getParameter("ssoId");
			String department = request.getParameter("department");
			String userType = request.getParameter("optradio");
			String email = request.getParameter("email");
			Integer userId = Integer.parseInt(request.getParameter("userId"));
			
			// Add user to database
			LoginBean loginBean = new LoginBean();
			loginBean.CreateUser(ssoId, firstName, lastName, userType, department, userId, 0, email);
			loginBean.InsertPasswordTrack(ssoId);		
			
			String query = "SELECT * FROM tblusers INNER JOIN departments ON tblusers.TblUsers_Department_ID = departments.Department_ID WHERE TblUsers_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/registrationform.jsp").forward(request, response); 
		}
		else if (task[0].equals("topicCreation")) { // Topic
				String Tobics_Desc = request.getParameter("Tobics_Desc");
				HttpSession session = request.getSession(false);
				String Tobics_UserID = (String) session.getAttribute("userName");
				Integer Tobics_Course_ID = Integer.parseInt(request.getParameter("Tobics_Course_ID"));
				Integer Department_ID = Integer.parseInt(request.getParameter("Department_ID"));
				LoginBean loginBean = new LoginBean();
				loginBean.InsertTobics(Tobics_Desc, Tobics_Course_ID, Tobics_UserID, Department_ID, 0);
				
				request.getRequestDispatcher("/instructor.jsp").forward(request, response);
		}
		else if (task[0].equals("quizCreation")) { // Quiz Creation
			try {
				String Quiz_Desc = request.getParameter("Quiz_Desc");
				Integer Quiz_Course_ID = Integer.parseInt(request.getParameter("Quiz_Course_ID"));
				HttpSession session = request.getSession(false);
				String Quiz_User_ID = (String) session.getAttribute("userName");
				String timeLimitString = request.getParameter("timeLimit");
				String startTimeString = request.getParameter("startTime");
				String endTimeString = request.getParameter("endTime");
				
				// Conversions
				DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss");
				DateFormat timestampFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
				Time timeLimit = (Time) timeFormat.parse(timeLimitString);
				Timestamp startTime = (Timestamp) timestampFormat.parse(startTimeString);
				Timestamp endTime = (Timestamp) timestampFormat.parse(endTimeString);
				
				LoginBean loginBean = new LoginBean();
				loginBean.InsertQuizzes(Quiz_Desc, Quiz_Course_ID, Quiz_User_ID, 0, timeLimit, startTime, endTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		else if (task[0].equals("questionCreation")) { // Question Creation
			String Question_Desc = request.getParameter("Question_Desc");
			String Question_Type = request.getParameter("Question_Type");
			Integer Question_Tobics_ID = Integer.parseInt(request.getParameter("Question_Tobics_ID"));
			Integer Question_Correct_Answer = Integer.parseInt(request.getParameter("Question_Correct_Answer"));
			Integer Question_Course_ID = Integer.parseInt(request.getParameter("Question_Course_ID"));
			HttpSession session = request.getSession(false);
			String Question_UserID = (String) session.getAttribute("userName");
			
			LoginBean loginBean = new LoginBean();
			loginBean.InsertQuestions(Question_Desc, Question_Type, Question_Course_ID, Question_Tobics_ID, Question_Correct_Answer, Question_UserID, 0);
		}
		else if (task[0].equals("toCreateUser")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM tblusers INNER JOIN departments ON tblusers.TblUsers_Department_ID = departments.Department_ID WHERE TblUsers_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/registrationform.jsp").forward(request, response);
		}
		else if (task[0].equals("toCreateCourse")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM course WHERE Course_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.setAttribute("displayCourses", rs);
			
			String query2 = "SELECT * FROM tblusers WHERE TblUsers_Deleted = 0 AND (TblUsers_UsertypeID = 'INS' OR TblUsers_UsertypeID = 'INAD');";
			ResultSet rs2 = loginBean.getAllData(query2);
			request.setAttribute("instructors", rs2);

			String query3 = "SELECT * FROM departments WHERE Department_Deleted = 0";
			ResultSet rs3 = loginBean.getAllData(query3);
			request.setAttribute("departments", rs3);
			
			request.getRequestDispatcher("/course.jsp").forward(request, response);
		}
		else if (task[0].equals("toStudent")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM tblusers WHERE TblUsers_UserTypeID = 'STD' AND TblUsers_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/student_creation.jsp").forward(request, response);
		}
		else if (task[0].equals("toCreateTopic")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM tobics INNER JOIN course ON tobics.Tobics_Course_ID = course.Course_ID WHERE Tobics_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/topics.jsp").forward(request, response);
		}
		else if (task[0].equals("selectTopicsFromCourse")) {
			Integer Course_ID = Integer.parseInt(request.getParameter("Course_ID"));
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM tobics WHERE Tobics_Course_ID	= "+Course_ID+";";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/topics/.jsp").forward(request, response);
		}
		else if (task[0].equals("toCreateQuiz")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM quizzes INNER JOIN course ON quizzes.Quiz_Course_ID = course.Course_ID WHERE Quiz_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/quiz_creation.jsp").forward(request, response);
		}
		else if (task[0].equals("toCreateQuestion")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM questions INNER JOIN answers ON answers.Answer_Question_ID = questions.Question_ID WHERE Question_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("questions", rs);
			
			request.getRequestDispatcher("/questions.jsp").forward(request, response);
		}
		else if (task[0].equals("departmentCreation")) {
			String Department_Code = request.getParameter("departmentCode");
			String Department_Desc = request.getParameter("departmentDesc");
			HttpSession session = request.getSession(false);
			String Department_UserID = (String) session.getAttribute("userName");
			LoginBean loginBean = new LoginBean();
			loginBean.createDepartments(Department_Code, Department_Desc, Department_UserID, 0);
			System.out.println(Department_Code+ " " + Department_Desc + " " + Department_UserID);
			
			String query = "SELECT * FROM departments WHERE Department_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/department.jsp").forward(request, response);
		}
		else if (task[0].equals("toDepartment")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM departments WHERE Department_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/department.jsp").forward(request, response);
		}
		else if (task[0].equals("userTypeCreation")) {
			String UsertypeID = request.getParameter("UsertypeID");
			String UserTypeDesc = request.getParameter("UserTypeDesc");
			HttpSession session = request.getSession(false);
			String UserType_UserID = (String) session.getAttribute("userName");
			LoginBean loginBean = new LoginBean();
			loginBean.CreateUserType(UsertypeID, UserTypeDesc, UserType_UserID, 0);
		}
		else if (task[0].equals("toAdmin")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM tblusertype";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/admin.jsp").forward(request, response);
		}
		else if (task[0].equals("groupCreation")) {
			String Group_Desc = request.getParameter("Group_Desc");
			HttpSession session = request.getSession(false);
			String Group_UserId = (String) session.getAttribute("userName");
			LoginBean loginBean = new LoginBean();
			loginBean.InsertGroups(Group_Desc, Group_UserId, 0);
		}
		else if (task[0].equals("toGroup")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM groups WHERE Group_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/instructor.jsp").forward(request, response);
		}
		else if (task[0].equals("toGroupQuiz")) {
            LoginBean loginBean = new LoginBean();
            String query = "Select tblusers.TblUsers_SSO as SSOID,tblusers.TblUsers_FirstName as Fname,tblusers.TblUsers_LastName as Lname,\n" + 
                    "tblusers.TblUsers_User_Number as UNO, course.Course_Desc as course from actions_links INNER JOIN (tblusers,course)on (tblusers.TblUsers_User_Number = actions_links.Actions_Links_Master and course.Course_ID = actions_links.Actions_Links_Details)";
            ResultSet rs = loginBean.getAllData(query);
            request.setAttribute("resultSet", rs);
            request.getRequestDispatcher("/GroupQuiz.jsp").forward(request, response);
        }
		else if (task[0].equals("toInstructorCourse")) {
			LoginBean loginBean = new LoginBean();
			String query = "SELECT * FROM course WHERE Course_Deleted = 0 LIMIT 5";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/instructor_course.jsp").forward(request, response);
		}
		else if (task[0].equals("courseCreation")) {
			String Course_code = request.getParameter("Course_code");
			String Course_Desc = request.getParameter("Course_Desc");
			Integer Course_year = Integer.parseInt(request.getParameter("Course_year"));
			String Course_Semester = request.getParameter("Course_Semester");
			String Course_Time = request.getParameter("Course_Time");
			HttpSession session = request.getSession(false);
			String Course_UserID = (String) session.getAttribute("userName");
			System.out.println(Course_code + " " + Course_Desc + " " + Course_year + " " + Course_Semester + " " + Course_Time + " " + request.getParameter("Course_Department_ID") + " " + Course_UserID);
			Integer Couse_Department_ID = Integer.parseInt(request.getParameter("Course_Department_ID"));
			
			System.out.println(Course_UserID);
			LoginBean loginBean = new LoginBean();
			loginBean.InsertCourse(Course_code, Course_Desc, Course_year, Course_Semester, Course_Time, Couse_Department_ID, Course_UserID, 0);
			
			System.out.println("Course Created.");
			
			String query = "SELECT * FROM course WHERE Course_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/course.jsp").forward(request, response);
		}
		else if (task[0].equals("insertCustomQuiz")) {
			Integer CustomQuiz_Status = Integer.parseInt(request.getParameter("CustomQuiz_Status"));
			Integer CustomQuiz_QuisID = Integer.parseInt(request.getParameter("CustomQuiz_QuisID"));
			Integer CustomQuiz_QustionID = Integer.parseInt(request.getParameter("CustomQuiz_QustionID"));
			HttpSession session = request.getSession(false);
			String CustomQuiz_UserID = (String) session.getAttribute("userName");

			LoginBean loginBean = new LoginBean();
			loginBean.InsertCustomQuiz(CustomQuiz_Status, CustomQuiz_QuisID, CustomQuiz_QustionID, CustomQuiz_UserID, 0);
		}
		else if (task[0].equals("InsertTables_Description")) {
			String Table_Name = request.getParameter("Table_Name");
			HttpSession session = request.getSession(false);
			String Table_UserID = (String) session.getAttribute("userName");

			LoginBean loginBean = new LoginBean();
			loginBean.InsertTables_Description(Table_Name, Table_UserID, 0);
		}
		else if (task[0].equals("InsertLinkedTables")) {
			Integer LinkedTables_Master = Integer.parseInt(request.getParameter("LinkedTables_Master"));
			Integer LinkedTables_Details = Integer.parseInt(request.getParameter("LinkedTables_Details"));
			HttpSession session = request.getSession(false);
			String LinkedTables_UserID = (String) session.getAttribute("userName");

			LoginBean loginBean = new LoginBean();
			loginBean.InsertLinkedTables(LinkedTables_Master, LinkedTables_Details, LinkedTables_UserID, 0);
		}
		else if (task[0].equals("InsertActionLinks")) {
			Integer Actions_Links_Master = Integer.parseInt(request.getParameter("Actions_Links_Master"));
			Integer Actions_Links_Details = Integer.parseInt(request.getParameter("Actions_Links_Details"));
			Integer Actions_Links_LinkedTables_ID = Integer.parseInt(request.getParameter("Actions_Links_LinkedTables_ID"));
			HttpSession session = request.getSession(false);
			String Actions_Links_Instructor_ID = (String) session.getAttribute("userName");

			LoginBean loginBean = new LoginBean();
			loginBean.InsertActions_Links(Actions_Links_Instructor_ID, Actions_Links_Master, Actions_Links_Details, Actions_Links_LinkedTables_ID, 0);
		}
		else if (task[0].equals("updateTopic")) {
			String updateDesc = request.getParameter("updateDesc");
			Integer Tobics_ID = Integer.parseInt(request.getParameter("Tobics_ID"));

			String query = "UPDATE tobics SET Tobics_Desc = " + updateDesc + " WHERE Tobics_ID = " + Tobics_ID;
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
		}
		else if (task[0].equals("deleteUser")) {
			String TblUsers_SSO = request.getParameter("TblUsers_SSO");
			String query = "UPDATE tblusers SET TblUsers_Deleted = 1 WHERE TblUsers_SSO = '"+TblUsers_SSO+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
			
			query = "SELECT * FROM tblusers INNER JOIN departments ON tblusers.TblUsers_Department_ID = departments.Department_ID WHERE TblUsers_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/registrationform.jsp").forward(request, response);
		}
		else if (task[0].equals("deleteUserType")) {
			String TblUserType_UsertypeID = request.getParameter("TblUserType_UsertypeID");
			String query = "UPDATE tblusertype SET TblUserType_Deleted = 1 WHERE TblUserType_UsertypeID = '"+TblUserType_UsertypeID+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
		}
		else if (task[0].equals("deleteDepartment")) {
			String Department_ID = request.getParameter("Department_ID");
			String query = "UPDATE departments SET Department_Deleted = 1 WHERE Department_ID = '"+Department_ID+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
			
			String query2 = "SELECT * FROM departments WHERE Department_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query2);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/department.jsp").forward(request, response);
		}
		else if (task[0].equals("deleteCourse")) {
			String Course_code = request.getParameter("Course_code");
			String query = "UPDATE course SET Course_Deleted = 1 WHERE Course_code = '"+Course_code+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
			
			request.setAttribute("status", "s");
			request.getRequestDispatcher("/course.jsp").forward(request, response);
		}
		else if (task[0].equals("deleteTobic")) {
			String Tobics_ID = request.getParameter("Tobics_ID");
			String query = "UPDATE tobics SET Tobics_Deleted = 1 WHERE Tobics_ID = '"+Tobics_ID+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
		}
		else if (task[0].equals("deleteQuiz")) {
			String Quiz_ID = request.getParameter("Quiz_ID");
			String query = "UPDATE quizzes SET Quiz_Deleted = 1 WHERE Quiz_ID = '"+Quiz_ID+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
		}
		else if (task[0].equals("deleteCustomQuiz")) {
			String CustomQuiz_ID = request.getParameter("CustomQuiz_ID");
			String query = "UPDATE customquiz SET CustomQuiz_Deleted = 1 WHERE CustomQuiz_ID = '"+CustomQuiz_ID+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
		}
		else if (task[0].equals("deleteQuestion")) {
			String Question_ID = request.getParameter("Question_ID");
			String query = "UPDATE questions SET Question_Deleted = 1 WHERE Question_ID = '"+Question_ID+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
		}
		else if (task[0].equals("deleteGroup")) {
			String Group_ID = request.getParameter("Group_ID");
			String query = "UPDATE groups SET Group_Deleted = 1 WHERE Group_ID = '"+Group_ID+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
		}
		else if (task[0].equals("deleteActionsLink")) {
			String Actions_Links_Instructor_ID = request.getParameter("Actions_Links_Instructor_ID");
			String query = "UPDATE actions_links SET Actions_Links_Deleted = 1 WHERE Actions_Links_Instructor_ID = '"+Actions_Links_Instructor_ID+"';";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
		}
		else if (task[0].equals("selectQuizQuestions")) {
			try {
				HttpSession session = request.getSession(false);
				LoginBean loginBean = new LoginBean();
				String ssoId = (String) session.getAttribute("userName");
                String token = (String) request.getParameter("token");
                String query2 = "SELECT * FROM tblusers WHERE TblUsers_SSO = '"+ssoId+"';";
				ResultSet rs2 = loginBean.getAllData(query2);
				if(rs2.next()) {
					int userNumber = rs2.getInt("TblUsers_User_Number");
					String query = "Select\n" + 
							"   quizzes.Quiz_ID,\n" + 
							"   quizzes.Quiz_Desc,\n" + 
							"   actions_links.Actions_Links_Instructor_ID,\n" + 
							"   quizzes.quiz_token,\n" + 
							"   questions.Question_ID,\n" + 
							"   questions.Question_Desc,\n" + 
							"   questions.Question_correct_answer,\n" + 
							"   questions.Question_ID,\n" + 
							"   questions.Question_Desc,\n" + 
							"   answers.Answer_ID,\n" + 
							"   answers.Answer_Desc\n" + 
							"   from actions_links INNER JOIN (quizzes,questions,answers)\n" + 
							"  \n" + 
							"   on (quizzes.Quiz_ID = actions_links.Actions_Links_Master and questions.Question_ID = actions_links.Actions_Links_Details  and answers.Answer_Question_ID=questions.Question_ID )\n" + 
							"   where actions_links.Actions_Links_LinkedTables_ID=100\n" + 
							"   and quizzes.Quiz_ID in (select actions_links.Actions_Links_Master from actions_links where actions_links.Actions_Links_LinkedTables_ID = 300 and actions_links.Actions_Links_Details="+userNumber+" \n" + 
							"                          and quizzes.quiz_token ='"+token+"'\n" + 
							"                           and (quizzes.Quiz_End_Time BETWEEN  quizzes.Quiz_Start_Time and CURRENT_TIMESTAMP))";
					ResultSet rs = loginBean.getAllData(query);
					
					request.setAttribute("resultSet", rs);
					request.getRequestDispatcher("/questions.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if (task[0].equals("updateDepartment")) {
			Integer Department_ID = Integer.parseInt(request.getParameter("Department_ID"));
			String Department_Code = request.getParameter("Department_Code");
			String Department_Desc = request.getParameter("Department_Desc");
			System.out.println(Department_ID + " " + Department_Code + " " + Department_Desc);
			String query = "UPDATE departments SET Department_Code = '"+Department_Code+"', Department_Desc = '"+Department_Desc+"' WHERE Department_ID = "+Department_ID+";";
			LoginBean loginBean = new LoginBean();
			loginBean.Update_Func(query);
			
			String query2 = "SELECT * FROM departments WHERE Department_Deleted = 0";
			ResultSet rs = loginBean.getAllData(query2);
			request.setAttribute("resultSet", rs);
			request.getRequestDispatcher("/department.jsp").forward(request, response);
		}
	}
		
		else {
			if (task[0].equals("login")) { // Login
				System.out.println("No session");
				String ssoId = request.getParameter("ssoId");
				String password = request.getParameter("password");		
				
				/* Check user name against the database */
				LoginBean loginBean = new LoginBean();
				String query = "SELECT * FROM tblusers WHERE TblUsers_SSO = '"+ssoId+"';";
				ResultSet rs = loginBean.getAllData(query);
				try {
					if (rs.next()) {
						System.out.println("User verified.");

						String passQuery = "SELECT PasswordTracking_SSO, PasswordTracking_TryNO FROM passwordtracking WHERE PasswordTracking_SSO = '"+ssoId+"';";
						ResultSet rs2 = loginBean.getAllData(passQuery);
						rs2.next();
								
						if(rs2.getInt("PasswordTracking_TryNO") < 3) {
							
							
							if(rs.getString("TblUsers_UserPass").equals(password)) {
								System.out.println("Login successful.");
								loginBean.UpdatePasswordTrack(ssoId, 0);
								
								rs2.close();
								// Start session
								HttpSession session = createSession(request, response, ssoId);
								request.setAttribute("session", session);

								if (rs.getString("TblUsers_UsertypeID").equals("ADM")) {
									System.out.println("User is admin.");
									String query2 = "SELECT * FROM tblusertype";
									ResultSet rs3 = loginBean.getAllData(query2);
									request.setAttribute("resultSet", rs3);						
									request.getRequestDispatcher("/admin.jsp").forward(request, response);
								}
								else if(rs.getString("TblUsers_UsertypeID").equals("INS")) {
									response.sendRedirect(request.getContextPath() + "/instructor.jsp");
								}
							}
							else {
								System.out.println("Failed login attempt.");
								Integer tryNO = rs2.getInt("PasswordTracking_TryNO");
								tryNO += 1;
								loginBean.UpdatePasswordTrack(ssoId, tryNO);
								rs.close();
								rs2.close();
								response.sendRedirect(request.getContextPath() + "/login.jsp");
							}
						}
						else {
							System.out.println("User reached max login attempts.");
							request.setAttribute("reachedFailedLoginAttempts", true);
							rs2.close();					
							response.sendRedirect(request.getContextPath() + "/login.jsp");
						}
					}
					else {
						System.out.println("User unknown.");
						rs.close();
						response.sendRedirect(request.getContextPath() + "/login.jsp");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if (task[0].equals("logout")) { // Logout
				HttpSession session = request.getSession(false);
				if(session.getAttribute("userName") != null)
					session.invalidate();
				
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
			else if (task[0].equals("forgotPassword")) {
				// Create session in db
				String ssoId = request.getParameter("ssoId");
				LoginBean loginBean = new LoginBean();
			    HttpSession session = request.getSession(true);
				System.out.println(ssoId + " " + session.getId());
			    loginBean.InsertNewSession(ssoId, session.getId());
			    session.invalidate();
			    
			    // Send email
				String query = "SELECT TblUsers_Email FROM tblusers WHERE TblUsers_SSO = '"+ssoId+"';";
				loginBean.Update_Func(query);
				ResultSet rs = loginBean.getAllData(query);
				try {
					if (rs.next()) {
						SendEmail newEmail = new SendEmail();
						try {
							System.out.println(rs.getString("TblUsers_Email"));
							String subject = "Please create your new password!";
							String body = "Click the link to reset your password.\nhttp://localhost:8090/TBLearning/LoginServlet?task[0]=changePasswordLink&session_id=" + session.getId();
							newEmail.email(subject, body, rs.getString("TblUsers_Email"));
							request.setAttribute("userExists", true);
							request.getRequestDispatcher("/login.jsp").forward(request, response);
//							response.sendRedirect(request.getContextPath() + "/login.jsp");
						} catch (MessagingException e) {
							e.printStackTrace();
						}
					}
					else {
						request.setAttribute("userExists", false);
						request.getRequestDispatcher("/login.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (task[0].equals("changePasswordLink")) {
				String sessionId = request.getParameter("session_id");
				System.out.println(sessionId);
				
				String query = "SELECT * FROM session_id WHERE active_session_id = '"+sessionId+"';";
				LoginBean loginBean = new LoginBean();
				ResultSet rs = loginBean.getAllData(query);
				
				try {
					if (rs.next()) {
						String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
						System.out.println("Current Time: " + timeStamp);
						System.out.println("Expiration Time: " + rs.getString("time_session_is_deactivated"));
						if(timeStamp.compareTo(rs.getString("time_session_is_deactivated")) < 0) {
							String query2 = "UPDATE session_id SET time_session_is_activated = CURRENT_TIMESTAMP, "
									+ "time_session_is_deactivated = DATE_ADD(CURRENT_TIMESTAMP, INTERVAL '02:30' HOUR_MINUTE) "
									+ "WHERE active_session_id = '"+sessionId+"';";
							loginBean.Update_Func(query2);
							request.setAttribute("userName", rs.getString("sso_id"));
							request.getRequestDispatcher("/change_password.jsp").forward(request, response);
						}
						else {
							request.setAttribute("alert", "Your active session has expired.");
							request.setAttribute("message", "Please click \"forgot password\" to receive a password reset sent so your email.");
						}
					}
					else {
						request.setAttribute("alert", "No session ID has been created.");
						request.setAttribute("message", "Please click \"forgot password\" to receive a password reset sent so your email.");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			else if (task[0].equals("changePassword")) {
				HttpSession session = request.getSession(false);
				
				if (session.getAttribute("userName") != null)
				{
					System.out.println("User is logged in.");

					String password = request.getParameter("password");
					String TblUsers_SSO = (String) session.getAttribute("userName");
					
					System.out.println(TblUsers_SSO + " " + password);
					String query = "UPDATE tblusers SET TblUsers_UserPass = '"+password+"' WHERE TblUsers_SSO = '"+TblUsers_SSO+"';";
					LoginBean loginBean = new LoginBean();
					loginBean.Update_Func(query);
				}
				else {
					System.out.println("User is not logged in.");

//					String session_id = request.getParameter("session_id");
//					System.out.println("Session is null: " + session_id);

						String[] session_id = task[1].split("=");
						String query = "SELECT sso_id FROM session_id WHERE active_session_id = '"+session_id[1]+"';";
						LoginBean loginBean = new LoginBean();
						ResultSet rs = loginBean.getAllData(query);					
						String password = request.getParameter("password");
						System.out.println("Password is:" + password + " Session: "+ session_id[1]);
						try {
							if(rs.next()) {
								String TblUsers_SSO = rs.getString("sso_id");
								System.out.println(TblUsers_SSO + " " + password);

								System.out.println("UPDATE tblusers SET TblUsers_UserPass = '"+password+"' WHERE TblUsers_SSO = '"+TblUsers_SSO+"';");
								String query2 = "UPDATE tblusers SET TblUsers_UserPass = '"+password+"' WHERE TblUsers_SSO = '"+TblUsers_SSO+"';";
								loginBean.Update_Func(query2);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
				}
				
				response.sendRedirect(request.getContextPath() + "/change_password.jsp?status=s");
			}
			
		}
		
		
	}
	
	private HttpSession createSession(HttpServletRequest request, HttpServletResponse response, String ssoId) throws IOException {
		// Create a session object if it is already not created.
	    HttpSession session = request.getSession(true);
	    
	    // This method specifies the time, in seconds, between client requests before the servlet container will invalidate this session.
	    // The default timeout is 30 minutes in Tomcat.
	    session.setMaxInactiveInterval(60);
	    
	    // This method binds an object to this session, using the name specified.
	    session.setAttribute("userName", ssoId);
	    
	    if(session != null) {
		    System.out.println("Login servlet: Session ID: " + session.getId());
	    }
	    
	    return session;
	}

	// A POST request results from an HTML form that specifically lists POST as the METHOD 
	// and it should be handled by doPost() method.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
