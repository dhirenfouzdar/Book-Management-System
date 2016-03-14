<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib uri="/struts-tags" prefix="s"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<s:form action="updateuserpassword">
<s:password name="currentPassword" id="currentPassword" label="Current Password" placeholder="Current Password" required="true" maxlength="50"/>
				<s:password name="newPassword" id="newPassword" label="New Password" class="newPassword" placeholder="New Password" required="true" maxlength="25" onKeyUp="checkPasswordStrength();"/>
				<s:div> <s:div id="cond"></s:div><s:div id="password-strength-status"></s:div></s:div>
				<span class="testresult shortPass"><span style="display:none;">Too short</span></span>
				<s:password name="confirmPassword" id="confirmPassword" label="Confirm Password" placeholder="Confirm Password" required="true" maxlength="25"/>  
				<s:submit value="ResetPassword" name="Update" />
</s:form>	
</body>
</html> --%>

<%-- <s:form action="updateadminpassword">
<s:password name="currentPassword" id="currentPassword" label="Current Password" placeholder="Current Password" required="true" maxlength="50"/>
				<s:password name="newPassword" id="newPassword" label="New Password" class="newPassword" placeholder="New Password" required="true" maxlength="25" onKeyUp="checkPasswordStrength();"/>
				<s:div> <s:div id="cond"></s:div><s:div id="password-strength-status"></s:div></s:div>
				<span class="testresult shortPass"><span style="display:none;">Too short</span></span>
				<s:password name="confirmPassword" id="confirmPassword" label="Confirm Password" placeholder="Confirm Password" required="true" maxlength="25"/>  
				<s:submit value="ResetPassword" name="Update" />
</s:form>	 --%>		





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE>
<html>
<%@taglib uri="/struts-tags" prefix="s"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Books Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <!-- Bootstrap -->
    <link href="pages/css/bootstrap.min.css" rel="stylesheet">
    <link href="pages/font-awesome/css/font-awesome.min.css" rel="stylesheet">
   <link href="pages/css/style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>


 <nav role="navigation" class="navbar navbar-default">
  <div class="container">
   <div class="row">
     <div class="col-sm-3"> </div>
   <div class="col-sm-6">

   <div class="center"> <h3>Book Management System  </h3>

   </div>
     <div class="col-sm-3"> </div>
   </div>
   </div>
   
  </nav>       
  
  <nav class="navbar navbar-default">
  <div class="container">
    
   
      <ul class="nav navbar-nav pull-right">
              	<li >
				    <s:url action="Producthome" var="product"/>
			        <s:a href="%{product}"><i class="fa fa-shopping-cart"></i>Products</s:a>
					</li>
						<li >
				    <s:url action="purchasedData" var="pur"/>
			        <s:a href="%{pur}"><i class="fa fa-pencil-square-o"></i>Purchased List</s:a>
					</li>	
					<li class ="">
				    <s:url action="changeUserPassword" var="up"/>
			        <s:a href="%{up}"><i class="glyphicon glyphicon-book"></i>Update Password</s:a>
					</li>
					<li>
				    <s:url action="adminLogout" var="adlogout"/>
			        <s:a href="%{adlogout}"><i class="fa fa-sign-out"></i>Logout</s:a>
					</li>	
					
					<li>
					<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						Welcome &nbsp;&nbsp;<s:property value="#session.username"/>
					</div>
					
				</div>
					
					</li>	
        
      </ul>
    
  </div>
</nav>
	
  
  
      
  
  <div class="container">
    <div class="row ">

	    <div class="col-md-3">
           
		</div>
		
		<div class="col-md-6">
          <div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12">							
							<span>Update Password</span>
							</div>
							
							
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							
							<s:if test="hasActionMessages()">
                           <div class="welcome">
                           <s:actionmessage/>
                           </div>
                           </s:if>
							
								<form  action="updateuserpassword" method="post" role="form" >
									
									<div class="form-group">
										<input type="password" name="currentPassword"  id="password" tabindex="2" class="form-control" placeholder="Current Password" minlength="6" maxlength="20" required>
									</div>
									<div class="form-group">
										<input type="password" name="newPassword"  id="password1" tabindex="2" class="form-control" placeholder="New Password" minlength="6" maxlength="20" required>
									</div>
									<div class="form-group"> 
										<input type="password" name="confirmPassword"  id="password2" tabindex="2" class="form-control" placeholder="Confirm Password" minlength="6" maxlength="20" required>
									</div>
									<div class="form-group text-center">
										</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit"  tabindex="4" class="form-control btn btn-login" value="Update">
											</div>
										</div>
									</div>
									
								</form>							
                              </div>
						</div>
					</div>
				</div>
		</div>
		<div class="col-md-3">
           
		</div>
	</div>
</div>
  

    <script src="pages/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
    <script src="pages/js/script.js"></script>
    <script type="text/javascript">
window.onload = function () {
	document.getElementById("password1").onchange = validatePassword;
	document.getElementById("password2").onchange = validatePassword;
}
function validatePassword(){
var pass2=document.getElementById("password2").value;
var pass1=document.getElementById("password1").value;
if(pass1!=pass2)
	document.getElementById("password2").setCustomValidity("Passwords Don't Match");
else
	document.getElementById("password2").setCustomValidity('');	 
//empty string means no validation error
}
</script>
  </body>
</body>
</html>