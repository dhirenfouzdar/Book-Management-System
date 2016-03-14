

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
       <li class ="">
				    <s:url action="Producthome" var="product"/>
			        <s:a href="%{product}"><i class="fa fa-shopping-cart"></i>Products</s:a>
					</li>
       	<li class ="">
				    <s:url action="changeUserPassword" var="up"/>
			        <s:a href="%{up}"><i class="glyphicon-asterisk"></i>Update Password</s:a>
					</li>
						
					<li>
				    <s:url action="adminLogout" var="adlogout"/>
			        <s:a href="%{adlogout}"><i class="glyphicon-log-out"></i>Logout</s:a>
					</li>	
					
					<li>
					<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						Welcome User
					</div>
					
				</div>
					
					</li>	
        
      </ul>
    
  </div>
</nav>
  <div class="container">
      <div class="row ">
    <div class="col-sm-2 col-md-2">   </div> 
  <div class="col-sm-8 col-md-8">
   <s:if test="hasActionMessages()">
  							   <div class="welcome">
  							   Failed.! Order Details
    						   <s:actionmessage/>
  							  </div>
							</s:if>
		<s:else>					
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                    ×</button>
                     <s:iterator value="bookDetailsList" >
    <li class="col-md-12 column productbox">
    <div class="productcat"><s:property value="category"/></div>
    <img src="pages/images/buisness.jpg" class="img-responsive">
    <div class="producttitle"><s:property value="bookname"/></div>
	<div class="productauthor"><span>By:</span> <s:property value="author"/></div>
    <div class="productprice">
    <div class="pull-right">
  
  </div>
	<div class="pricetext"><i class="fa fa-inr"></i> <s:property value="price"/></div>
	</div>
    </li>
    </s:iterator>
               <span class="glyphicon glyphicon-ok"></span> 
                <hr class="message-inner-separator">
                <p>
                    <center>Successfully Ordered.</center></p> 
            </div>
           </s:else>
        </div>
  <div class="col-sm-2 col-md-2">
  
   

	</div>
</div>
  </div>

    <script src="pages/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
    <script src="pages/js/script.js"></script>

  </body>
</body>
</html>