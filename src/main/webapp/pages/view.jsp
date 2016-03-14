
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
    
   
      <ul class="nav navbar-nav pull-left">
       <li class ="">
				    <s:url action="logintab" var="back"/>
			        <s:a href="%{back}"><i class="fa fa-arrow-left"></i> Back</s:a>
					</li>
       	
        
      </ul>
    
  </div>
</nav>
  <div class="container">
  
    <div class="row ">
        <div id="users">
	<div class="col-md-3"></div>
<div class="col-md-9">
<div class="col-md-3"></div>
<div class="col-md-6">
	<input class="search form-control"  placeholder="Search, what are you wishing to ..." />
</div>	
<div class="col-md-3"></div>	
</div>	

  <div class="col-md-3">
  <div class="col-md-12">
  <button class="sort btn btn-primary block" data-sort="producttitle">
    Sort by Name
  </button>
  </div>
  <div class="col-md-12">
  <button class="sort btn btn-primary block" data-sort="pricetext">
    Sort by Price
  </button>
  </div>
  <div class="col-md-12">  
  <button class="sort btn btn-primary block" data-sort="productcat">
    Sort by Category
  </button>
  </div>
  <div class="col-md-12">  
  <button class="sort btn btn-primary block" data-sort="productauthor">
    Sort by Author
  </button>
  </div>
  </div> 
  <ul class="col-md-9 list">
  <s:iterator value="bookDetailsList" >
    <li class="col-md-3 column productbox">
    <div class="productcat"><s:property value="category"/></div>
    <img src="http://placehold.it/460x250/e67e22/ffffff&text=HTML5" class="img-responsive">
    <div class="producttitle"><s:property value="bookname"/></div>
	<div class="productauthor"><span>By:</span> <s:property value="author"/></div>
    <div class="productprice">
    <div class="pull-right">
    <s:url action="logintab" var="back"/>
    <s:a href="%{back}" cssClass="btn btn-danger btn-sm" role="button">BUY</s:a>
  </div>
	<div class="pricetext"><i class="fa fa-inr"></i> <s:property value="price"/></div>
	</div>
    </li>
    </s:iterator>
	
  </ul>
</div>

	</div>
</div>
  

    <script src="pages/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
    <script src="pages/js/script.js"></script>
    <script src="pages/js/list.js"></script>
    <script>
var options = {
  valueNames: [ 'producttitle', 'pricetext', 'productcat', 'productauthor' ]
};
var userList = new List('users', options);
console.log(userList);
</script>
  </body>
</body>
</html>