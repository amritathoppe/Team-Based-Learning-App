 Team Based Learning Web Application
 =================================
 
 This web application demonstrates using Xamp webserver to run the server side of team based learning system.This application is best when run in  Chrome or eclipse-in-built browser.The application builds in Eclipse.Follow the instruction below.
 
 Instruction for setup:
 
 1) Download Eclipse for Java EE and Java SE if you haven't installed any.
 2) Install the XAMP and create an environment to run PhpMyAdmin where the database for this application would reside.Open the Xamp localhost,Start Apache and MySQL        and navigate to php my Admin application.Create a new database named tblearning_db and import the tblearning.sql file from the zip folder. 
 3) Install a Tomcat runtime environment for Eclipse.The simplest way is to choose Window > Preferences > Server > Runtime Environments.  Then add a new Apache Tomcat      8.0 runtime environment, and use the "Download and Install" button to download and install a new version of Apache Tomcat.
 4) Import the projects contained in this application into your eclipse workspace.  Chose File > Import > Existing projects into workspace.  Navigate to the directory      containing this file and select this project's directory.
 5) You should now see the Tblearning project in your workspace.  If the code isn't compiling, make sure you've installed a Tomcat 8.0 runtime as described in step 3.      If the code still doesn't compile, you can try cleaning the project with Project > Clean.


 Deploying/Running the Web application:

 The application is now ready to deploy to a local tomcat server.
 1). To deploy the web application to tomcat server, right-click on this project in the package explorer, then select Run As... > Run on server. In the deployment      wizard,   you may select the tomcat environment to deploy the application into if you haven't created one yet. 
 2). Besure to start the Apache and MySQL Components of Xamp Web Server before running the application.  
 

