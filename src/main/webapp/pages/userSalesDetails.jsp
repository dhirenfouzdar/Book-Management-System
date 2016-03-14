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
<table class="table">
                <thead>
                    <tr class="filters">
                        <th>Book Name</th>
                        <th>Book Prize</th>
                        <th>Total Prize</th>
                        <th>Number of books sold</th>
                        <th>Purchase Date</th>
                    </tr>
                </thead>
                <tbody>
                <s:iterator value="purchaseDetailsList">
                    <tr>
                        <td><s:property value="bookname"/></td>
                        <td><s:property value="price"/></td>
                         <td><s:property value="totalamount"/></td>
                        <td class="t1"><s:property value="quantity"/></td>
                        <td><s:property value="createdDate"/></td>
                    </tr>
                </s:iterator>    
                    
                </tbody>
            </table>
</body>
</html> --%>



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
					<li class ="active">
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
		<div class="col-md-12">
         <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">Users</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                        
                        <th><input type="text" class="form-control" placeholder="BOOK NAME" disabled></th>
                        <th><input type="text" class="form-control" placeholder="PRICE" disabled></th>
                        <th><input type="text" class="form-control" placeholder="TOTAL AMOUNT" disabled></th>
                        <th><input type="text" class="form-control" placeholder="QUANTITY" disabled></th>
                           <th><input type="text" class="form-control" placeholder="PURCHASED DATE"disabled></th>
                              
                </thead>
                <tbody>
                <s:iterator value="purchaseDetailsList">
                    <tr>
                        <td><s:property value="bookname"/></td>
                        <td><s:property value="price"/></td>
                        <td><s:property value="totalAmount"/></td>
                        <td><s:property value="quantity"/></td>
                       <td><s:date name="createdDate" format="dd/MM/yyyy hh:mm a"></s:date></td>
                         
                    </tr>
                 </s:iterator>  
                </tbody>
            </table>
        </div>
    </div>
							
											
                              </div>
						</div>
					

    <script src="pages/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
    <script src="pages/js/script.js"></script>
    <script>
$(document).ready(function(){
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});

</script>
  
</body>
</html>