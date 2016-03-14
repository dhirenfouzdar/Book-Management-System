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
       <li class ="active">
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
    <s:set name="cat" value="category"/>
 <s:if test="%{#cat=='Cooking'}">
 <div class="thumbnail">
   <img src="pages/images/cooking.jpg" class="img-responsive">
 </div>
</s:if> 
 <s:elseif test="%{#cat=='Novels'}">
  <div class="thumbnail">
   <img src="pages/images/novels.jpg" class="img-responsive">
   </div>
</s:elseif> 
<s:elseif test="%{#cat=='Agriculture'}">
  <div class="thumbnail">
   <img src="pages/images/agriculture.jpg" class="img-responsive">
   </div>
</s:elseif> 
<s:elseif test="%{#cat=='Business'}">
  <div class="thumbnail">
   <img src="pages/images/buisness.jpg" class="img-responsive">
   </div>
</s:elseif>
<s:elseif test="%{#cat=='Drama'}">
  <div class="thumbnail">
   <img src="pages/images/drama.gif" class="img-responsive">
   </div>
</s:elseif>
<s:elseif test="%{#cat=='Health'}">
  <div class="thumbnail">
   <img src="pages/images/health.jpeg" class="img-responsive">
   </div>
</s:elseif>
<s:elseif test="%{#cat=='Friction'}">
  <div class="thumbnail">
   <img src="pages/images/lesfriction.jpg" class="img-responsive">
   </div>
</s:elseif>
<s:elseif test="%{#cat=='Travel'}">
  <div class="thumbnail">
   <img src="pages/images/travel.jpg" class="img-responsive">
   </div>
</s:elseif>
<s:elseif test="%{#cat=='Musics'}">
  <div class="thumbnail">
   <img src="pages/images/musics.jpg" class="img-responsive">
   </div>
</s:elseif>
<s:elseif test="%{#cat=='Medical'}">
  <div class="thumbnail">
   <img src="pages/images/medical.jpg" class="img-responsive">
   </div>
</s:elseif>
<s:elseif test="%{#cat=='Games'}">
  <div class="thumbnail">
   <img src="pages/images/games.jpg" class="img-responsive">
   </div>
</s:elseif>
<s:elseif test="%{#cat=='Sports'}">
  <div class="thumbnail">
   <img src="pages/images/sports.png" class="img-responsive">
   </div>
</s:elseif>
<s:else>
 <div class="thumbnail">
 No image found
 </div>  
</s:else> 

    <div class="producttitle"><s:property value="bookname"/></div>
	<div class="productauthor"><span>By:</span> <s:property value="author"/></div>
    <div class="productprice">
    <div class="pull-right">
    <button class="btn btn-danger btn-sm bid" role="button" data-toggle="modal" data-target="#myModal" id="<s:property value="bookId"/>">BUY</button>
  </div>
	<div class="pricetext"><i class="fa fa-inr"></i> <s:property value="price"/></div>
	</div>
    </li>
    </s:iterator>
    
  </ul>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" style="text-align: center;">--Purchase Details--</h4>
      </div>
      <div class="modal-body">
                       <s:if test="hasActionMessages()">
  							   <div class="welcome">
    						   <s:actionmessage/>
  							  </div>
							</s:if>
							
            <s:form action="buybookData" method="post" role="form">
            <div class="form-group" style="display:none">
            <label for="recipient-name" class="control-label">Id:</label>
            <input type="text" name="id" class="form-control" id="id" readonly="true">
          </div>
           <div class="form-group" style="display:none">
            <label for="recipient-name" class="control-label">Book id:</label>
            <input type="text" name="bookId" class="form-control" id="name" readonly="true">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Book Name:</label>
            <input type="text" name="bookname" class="form-control" id="name1" readonly="true">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Price:</label>
            <input type="text" name="price" class="form-control" id="name2" readonly="true">
          </div>  
          <div class="form-group">
            <label for="recipient-name" class="control-label">Quantity:</label>
            <input type="text" name="quantity" class="form-control"  min="1" max="1000" id="name3" required>
            <span id="errmsg"></span>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Total amount:</label>
            <input type="text" name="totalAmount" class="form-control" id="name4" readonly="true">
          </div>  
          <div class="form-group">
            <label for="recipient-name" class="control-label">Billing Address:</label>
            <textarea class="form-control" name="address" rows="5" id="comment" required></textarea>
          </div>  
          <div class="form-group">          
         <label class="checkbox-inline"><input type="checkbox" name="paymentMode" value="Cash" required>Cash On Delivery</label>
           </div>      
         <button type="submit" class="btn btn-primary block">Order Item</button>                                
        </s:form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	</div>
</div>
  

    <script src="pages/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
    <script src="pages/js/script.js"></script>
    <script src="pages/js/list.js"></script>
    <script>
    $("#name3").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
           //display error message
           $("#errmsg").html("Digits Only").show().fadeOut("slow");
                  return false;
       }
      });    
    </script>
    <script>
var options = {
  valueNames: [ 'producttitle', 'pricetext', 'productcat', 'productauthor' ]
};
var userList = new List('users', options);
console.log(userList);

</script>
<script>
$(document).ready(function() {

	   $('.bid').click(function(event) {
		   var book_id = this.id;
		   console.log(bookid);
		   var mval;
		    var name = [];
		    var price = [];	
		    var id =[];
		    var bookid =[];
		    var bkdetail;
            var quanti=[];
		   <s:iterator value="bookDetailsList" >
		   bkdetail ='<s:property value="bookDetailsList.size()"/>';
		   bookid.push('<s:property value="bookId" />');
		   id.push('<s:property value="id" />');
		   name.push('<s:property value="bookname" />');
		   price.push(parseInt('<s:property value="price" />'));
		   quanti.push(parseInt('<s:property value="quantity" />'));
		    </s:iterator>  
		    console.log(quanti);
for(var i=0;i<bkdetail;i++){
	if(bookid[i]===book_id){
	$('#id').val(id[i]);
	$('#name').val(bookid[i]);
	$('#name1').val(name[i]);
	$('#name2').val(price[i]);
/* 	$('#name3').attr({
		"min":1,
	    "max":mval
	}); */
	}
	$("#name3").keyup(function(event){
		if($("#name3").val().length != 0)
			{
		$("#name4").val(
		parseInt($("#name3").val(),10)*
		parseInt($("#name2").val(),10));
			}
		else	{
			$("#name4").val(0);
		}
		});
} 
	      }); 
	});
	</script>
  </body>
</html>