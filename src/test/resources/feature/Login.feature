
@login
Feature: Login

	Background: Admin/User/Staff opens the LMS website  

	@onLMS
  Scenario: Validates the login url
    Given Admin/User/Staff is on Browser
    When Admin/User/Staff opens the LMS website  
    Then Admin/user/Staff should be navigated to login page
    
  @VAlid-login
  Scenario: Login-Valid Credentials
    Given Admin/User/Staff is on Login Page
    When User clicks login button after entering Username as "User" and Password as "User"  
    Then User see header text as "Manage Program"
    When Admin clicks login button after entering Username as "Admin" and Password as "Admin" and code as "12345"  
    Then Admin see header text as "Manage Program"  
    When Staff clicks login button after entering Username as "Staff" and Password as "Staff" and code as "54321"  
    Then Staff see header text as "Manage Program" 
    
  @Invalid-user  
  Scenario Outline: Login -Invalid Credentials for user
    Given User is on Login Page
    When User clicks login button after entering "<Username>" and "<Password>"
    Then User should see a error message "<Errormessage>"
    
    Examples:
    |Username||Password||Errormessage|
    |User||Userr||Invalid password|
    |Userr||User||Invalid username|
    |Userr||Userr||Invalid Username and Password|
    |Username|| ||enter valid password|
    
  @invalid-admin 
  Scenario Outline: Login -Invalid Credentials for Admin
	  Given Admin is on Login Page
	  When Admin clicks login button after entering  "valid username" "invalid Password" and "code" 
    Then Admin should see a error message "<Errormessage>"
     
    Examples:
    |Username||Password||code||Errormessage|
    |Admin||Adminn||12345||Invalid password|
    |Adminn||Admin||12345||Invalid username|
    |Admin||Admin||12555||Invalid code|
   
  @invalid-staff 
  Scenario Outline: Login -Invalid Credentials for Staff
	  Given Staff is on Login Page
	  When Staff clicks login button after entering  "valid username" "invalid Password" and "code" 
    Then Staff should see a error message "<Errormessage>"
     
    Examples:
    |Username||Password||code||Errormessage|
    |Staff||Staffs||54321||Invalid password|
    |Staffa||Staff||54321||Invalid username|
    |Staff||Staff||54222||Invalid code|
  
      
    @forgot-password
    Scenario: Forgot Password
    Given Admin/User/Staff is on Login Page
	  When Admin/User/Staff clicks Forgot password link
	  Then It should redirected to forgot Password page
	  
	  Given Admin/User/Staff is on Forgot Password Page
	  When Admin/User/Staff clicks continue after entering valid email address 
	  Then It should be redirected to enter verification code page
	  
	  Given Admin/User/Staff is on Enter verification code Page 
	  When Admin/User/Staff clicks continue after entering verification code 
	  Then It should be redirected reset password page 
	  
	  Given Admin/User/Staff is on Enter verification code Page
	  When Admin/User/Staff should be redirected reset password page
	  Then The verification code should be resend to email  
	  
	  @validreset-password
	  Scenario:  Valid Reset Password
	  Given Admin/User/Staff is on Reset Password Page
	  When Admin/User/Staff clicks submit button after entering new password and retype password 
	  Then Admin/User/Staff  should be redirected to login page
	   
	  
	  @invalidreset-password
	  Scenario: Invalid reset Password
	  Given Admin/User/Staff is on Reset Password Page
	  When Admin/User/Staff clicks submit button after entering password  with less than 8 characters
	  Then It should display an error message "The password must contain 8 characters"
	  Given Admin/User/Staff clicks submit button after entering password without Capital letter 
	  Then It should display an error message "The password must contain one Capital letter"
	  When Admin/User/Staff clicks submit button after entering  password without Number
	  Then It should display an error message "The password must contain one Number"
	  When Admin/User/Staff clicks submit button after entering password without Special character
	  Then It should display an error message "The password must contain one Special character"
	  When Admin/User/Staff clicks cancel button after entering new password and retype password 
	  Then Admin/User/Staff  should see a refreshed reset password page with empty fields
	  
	  




	  
















    


    
    
    
    
           

    
    
    
    
    

