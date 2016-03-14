
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<%-- <body>

<center><h3>Books Management System</h3></center>
<s:if test="hasActionMessages()">
   <div class="welcome">
      <s:actionmessage/>
   </div>
</s:if>
 <s:form action="login" method="post">
 <s:textfield name="username" label="Username"></s:textfield>
 <s:password name="password" label="Password"></s:password>
 <s:submit value="Login"></s:submit>
 <s:submit value="First time User?" action="newuser"></s:submit>
 </s:form>
 <li><s:url action="newuser" var="registerPage"/>
			<s:a href="%{registerPage}"><span>First time User?</span></s:a></li>
			
			
			
			<body> --%>

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
  
  <div class="container">
   <div class="row">
    <div class="visible-sm-12" style="margin-top:45px;"> </div>

	<div class="col-md-4">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">							
							<s:url action="logintab" var="bmslogin"/>
			                 <s:a href="%{bmslogin}" css.Class="active"><span>Login</span></s:a>
							</div>
							<div class="col-xs-6">
							<s:url action="registertab" var="bmsSignup"/>
			                <s:a href="%{bmsSignup}"><span>SignUP</span></s:a>
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
							
								<form id="login-form" action="login" method="post" role="form" >
									<div class="form-group">
										<input type="text"  name="username" id="username" tabindex="1" class="form-control" placeholder="Username" required>
									</div>
									<div class="form-group">
										<input type="password" name="password"  id="password" tabindex="2" class="form-control" placeholder="Password" required>
									</div>
									<div class="form-group text-center">
										</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
												<s:url action="forgotpass" var="frgt"/>
			                                   <s:a href="%{frgt}" cssClass="forgot-password">Forgot Password?</s:a>
												</div>
											</div>
										</div>
									</div>
								</form>							
                              </div>
						</div>
					</div>
				</div>
			</div>
		<div class="col-sm-8">
			  <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/sports.png" alt="">
              <div class="caption">
                <h4>Sports</h4>
                <p>
                <s:url action="viewpage.action" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a>
               </p>
            </div>
          </div>
        </div>

        <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/travel.jpg" alt="">
              <div class="caption">
                <h4>Travel</h4>
                
                <p>
                <s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a>
			     </p>
            </div>
          </div>
        </div>

        <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/agriculture.jpg" alt="">
              <div class="caption">
                <h4>Agriculture</h4>
            
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a></p>
            </div>
          </div>
        </div>

        <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/buisness.jpg" alt="">
              <div class="caption">
                <h4>Business</h4>
                
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a> </p>
            </div>
          </div>
        </div>
         <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/cooking.jpg" alt="">
              <div class="caption">
                <h4>Cooking</h4>
                
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a> </p>
            </div>
          </div>
        </div>
        <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/drama.gif" alt="">
              <div class="caption">
                <h4>Drama</h4>
                
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a> </p>
            </div>
          </div>
        </div>
        <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/games.jpg" alt="">
              <div class="caption">
                <h4>Games</h4>
                
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a> </p>
            </div>
          </div>
        </div>
        <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/health.jpeg" alt="">
              <div class="caption">
                <h4>Health</h4>
                
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a> </p>
            </div>
          </div>
        </div>
        <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/lesfriction.jpg" alt="">
              <div class="caption">
                <h4>Friction</h4>
                
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a> </p>
            </div>
          </div>
        </div>
        <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/medical.jpg" alt="">
              <div class="caption">
                <h4>Medical</h4>
                
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a> </p>
            </div>
          </div>
        </div>
        <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/musics.jpg" alt="">
              <div class="caption">
                <h4>Musics</h4>
                
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a> </p>
            </div>
          </div>
        </div>
       
       <div class="col-xs-18 col-sm-6 col-md-3">
          <div class="thumbnail">
            <img src="pages/images/novels.jpg" alt="">
              <div class="caption">
                <h4>Novels</h4>
                
                <p><s:url action="viewpage" var="clickview"/>
			     <s:a href="%{clickview}" cssClass="btn btn-info btn-xs btn-block" role="button">View</s:a> </p>
            </div>
          </div>
        </div>
        
</div>
      
   </div>
  </div>
  

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="pages/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
    <script src="pages/js/script.js"></script>
  </body>
</body>
</html>
 