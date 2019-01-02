package edu.umsl.java.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Random;

public class LoginBean {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/tblearning_db";
    static final String USER = "root";
    static final String PASS = "";

public void createDepartments(String Department_Code, String Department_Desc, String Department_UserID, Integer Department_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "INSERT INTO departments (Department_Code, Department_Desc, Department_UserID, Department_Deleted) VALUES ('"+Department_Code+"','"+Department_Desc+"','"+Department_UserID+"',"+Department_Deleted+");";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void CreateUserType(String UsertypeID,String UserTypeDesc,String UserType_UserID,Integer UserType_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into TblUserType values('"+UsertypeID+"','"+UserTypeDesc+"','"+UserType_UserID+"',"+UserType_Deleted+");";
    stmt.execute(this_query); 
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void CreateUser(String SSO,String FirstName,String LastName,String userType,String Department_ID,Integer User_Number,Integer User_Deleted,String UserEmail)
{
try {
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
	Statement stmt = conn.createStatement();
	System.out.println("INSERT INTO tblusers (TblUsers_SSO, TblUsers_UserPass, TblUsers_FirstName, TblUsers_LastName, TblUsers_UsertypeID, TblUsers_Department_ID, TblUsers_User_Number, TblUsers_Deleted, TblUsers_Email) VALUES ('"+SSO+"','"+getSaltString()+"','"+FirstName+"','"+LastName+"','"+userType+"','"+Department_ID+"',"+User_Number+",'"+User_Deleted+"','"+UserEmail+"');");

	String this_query = "INSERT INTO tblusers (TblUsers_SSO, TblUsers_UserPass, TblUsers_FirstName, TblUsers_LastName, TblUsers_UsertypeID, TblUsers_Department_ID, TblUsers_User_Number, TblUsers_Deleted, TblUsers_Email) VALUES ('"+SSO+"','"+getSaltString()+"','"+FirstName+"','"+LastName+"','"+userType+"','"+Department_ID+"',"+User_Number+",'"+User_Deleted+"','"+UserEmail+"');";
	stmt.execute(this_query);
	stmt.close(); 
	conn.close();
  	} catch (ClassNotFoundException | SQLException e) {
}
return ;
}

public String getSaltString() {
    String SALTCHARS = "abcdefghiklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#";
    Random rnd = new Random();
    char[] pass = new char[17];
    for (int i = 0; i < 17; i++) {
    		int index = (int) (rnd.nextFloat() * SALTCHARS.length());
    		pass[i] = SALTCHARS.charAt(index);
    }
    
    String saltStr = new String(pass);
    return saltStr;
}

public void InsertGroups(String Group_Desc,String Group_UserId,Integer Group_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into Groups  values('"+Group_Desc+"','"+Group_UserId+"',"+Group_Deleted+");";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertPasswordTrack(String SSO )
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "INSERT INTO passwordtracking (PasswordTracking_SSO, PasswordTracking_TryNO) VALUES ('"+SSO+"', 0)";
    System.out.println(this_query);
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void UpdatePasswordTrack(String SSO,Integer TryNo )
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "Update PasswordTracking  set TryNO = "+TryNo+" where SSO = '"+SSO+"';";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
 }
return ;
}

public void InsertCourse(String Course_code,String Course_Desc,Integer Course_year,String Course_Semster,String Course_Time, Integer Course_Department_ID, String Course_UserID, Integer Course_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    System.out.println("insert into course (Course_code, Course_Desc, Course_year, Course_Semester, Course_Time, Course_Department_ID, Course_UserID, Course_Deleted) values('"+Course_code+"','"+Course_Desc+"',"+Course_year+",'"+Course_Semster+"','"+Course_Time+"','"+Course_Department_ID+"','"+Course_UserID+"', "+Course_Deleted+");");
    String this_query = "insert into course (Course_code, Course_Desc, Course_year, Course_Semester, Course_Time, Course_Department_ID, Course_UserID, Course_Deleted) values('"+Course_code+"','"+Course_Desc+"',"+Course_year+",'"+Course_Semster+"','"+Course_Time+"','"+Course_Department_ID+"','"+Course_UserID+"', "+Course_Deleted+");";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertTobics(String Tobics_Desc, Integer Tobics_Course_ID,String Tobics_UserID, Integer Department_ID, Integer Topics_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into Tobics  values('"+Tobics_Desc+"','"+Tobics_Course_ID+"','"+Tobics_UserID+"',"+Department_ID+","+Topics_Deleted+");";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertQuestions(String Question_Desc,String Question_Type, Integer Question_Course_ID,Integer Question_Tobics_ID,Integer Question_Correct_Answer, String Question_UserID, Integer Question_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into Questions  values('"+Question_Desc+"','"+Question_Type+"',"+Question_Course_ID+","+Question_Tobics_ID+","+Question_Correct_Answer+",'"+Question_UserID+"',"+Question_Deleted+";)";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertAnswers(String Answer_Desc,Integer Answer_Question_ID,String Answer_UserId, Integer Answer_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into Answers  values('"+Answer_Desc+"',"+Answer_Question_ID+",'"+Answer_UserId+"',"+Answer_Deleted+");";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertQuizzes(String Quiz_Desc,Integer Quiz_Course_ID, String Quiz_User_ID, Integer Quiz_Deleted, Time Quiz_Time_Limit, Timestamp Quiz_Start_Time, Timestamp Quiz_EndTime)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into Quizzes  values('"+Quiz_Desc+"',"+Quiz_Course_ID+",'"+Quiz_User_ID+"',"+Quiz_Deleted+");";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertCustomQuiz(Integer CustomQuiz_Status,Integer CustomQuiz_QuisID,Integer CustomQuiz_QustionID,String CustomQuiz_UserID, Integer CustomQuiz_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into CustomQuiz  values("+CustomQuiz_Status+","+CustomQuiz_QuisID+","+CustomQuiz_QustionID+",'"+CustomQuiz_UserID+"',"+CustomQuiz_Deleted+");";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertTables_Description(String Table_Name,  String Table_UserID, Integer Table_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into Tables_Description  values('"+Table_Name+"','"+Table_UserID+"', '"+Table_Deleted+"');";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertLinkedTables(Integer LinkedTables_Master,Integer LinkedTables_Details,String LinkedTables_UserID, Integer LinkedTables_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into LinkedTables  values("+LinkedTables_Master+","+LinkedTables_Details+",'"+LinkedTables_UserID+"', "+LinkedTables_Deleted+");";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertActions_Links(String Actions_Links_Instructor_ID,Integer Actions_Links_Master ,Integer Actions_Links_Details ,Integer Actions_Links_LinkedTables_ID,Integer Actions_Links_Deleted)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "insert into Actions_Links  values("+Actions_Links_Instructor_ID+","+Actions_Links_Master+","+Actions_Links_Details+","+Actions_Links_LinkedTables_ID +","+Actions_Links_Deleted+");";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public void InsertNewSession(String ssoId, String sessionId)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = "INSERT INTO session_id (sso_id, active_session_id, time_session_is_activated, time_session_is_deactivated) VALUES ('"+ssoId+"', '"+sessionId+"', CURRENT_TIMESTAMP, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL '02:30' HOUR_MINUTE));";
    stmt.execute(this_query);
    stmt.close(); 
    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}

public ResultSet getAllData(String sqlStm){
    try {
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
        Statement stmt = conn.createStatement();     
        System.out.println(sqlStm);
        ResultSet rs = stmt.executeQuery(sqlStm);
//           stmt.close();
//           conn.close();
     	return rs;
    } catch (Exception e) {
    }
    return null;
}

public void Update_Func(String UpdateStmt)
{
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement stmt = conn.createStatement();
    String this_query = UpdateStmt;
    stmt.execute(this_query);
//    stmt.close(); 
//    conn.close();
      } catch (ClassNotFoundException | SQLException e) {
  }
return ;
}
}