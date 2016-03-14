<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE>
<html>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%> 
<%@taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Books Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <!-- Bootstrap -->
   <link href="pages/css/bootstrap.min.css" rel="stylesheet">
    <link href="pages/css/font-awesome.min.css" rel="stylesheet">
   <link href="pages/css/style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="pages/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="pages/js/bootstrap.min.js"></script>
    <script src="pages/js/script.js"></script>    
    <sj:head jqueryui="true" 
         jquerytheme="customTheme" 
         customBasepath="template/"/> 

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
  
  <div class="container">
    <div class="row ">
		<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						Welcome
					</div>
					<div class="profile-usertitle-job">
						&nbsp;&nbsp;<s:property value="#session.username"/>
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS -->
				
				<!-- END SIDEBAR BUTTONS -->
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav">
					
					<li class="active">
				    <s:url action="addbook" var="adbk"/>
			        <s:a href="%{adbk}"><i class="glyphicon glyphicon-book"></i>Add Books</s:a>
					</li>
				     
				    <li>
				    <s:url action="salesData" var="sd"/>
			        <s:a href="%{sd}"><i class="glyphicon glyphicon-book"></i>SalesDetails</s:a>
					</li>
					
					
					<li>
				    <s:url action="stockData" var="os"/>
			        <s:a href="%{os}"><i class="glyphicon glyphicon-book"></i>OutOffStock</s:a>
					</li>
					
					<li>
				    <s:url action="updateadminPassword" var="up"/>
			        <s:a href="%{up}"><i class="glyphicon-asterisk"></i>Update Password</s:a>
					</li>
						
					<li>
				    <s:url action="adminLogout" var="adlogout"/>
			        <s:a href="%{adlogout}"><i class="glyphicon-log-out"></i>Logout</s:a>
					</li>			
					  
						
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
	
		
		<div class="col-md-4">
            <div class="profile-content">
			    <div class="panel panel-default">
                <div class="panel-body">
             <s:if test="hasActionMessages()">
  							   <div class="welcome">
    						   <s:actionmessage/>
  							  </div>
							</s:if>
							<%-- <s:form action="salesData">
							   <s:submit value="SalesDetails"></s:submit>
							</s:form>
							<s:form action="stockData">
							   <s:submit value="OutOffStock"></s:submit>
							</s:form> --%>
                    <s:form class="form" action="addBookDetails" role="form" method="post">
                    
                       <div class="form-group">                       
                         <label>ISBN</label>
                            <input name="bookId" type="text" class="form-control" minlength="3" maxlength="15" placeholder="ISBN" required/>               
                        </div>                    
                    
                       
                       <div class="form-group">
                         <label>Book Name</label>
                            <input name="bookname" type="text" class="form-control"  minlength="1" maxlength="15" placeholder="Book Name"  required/>
                        </div>                    
                    
                       <div class="form-group">                        
                         <label>Category</label>
                         <select name="category" class="form-control" required>
                         <option value="">Select Option</option>
                         <option value="Agriculture">Agriculture</option>
                         <option value="Business">Business</option>
                         <option value="Cooking">Cooking</option>
                         <option value="Drama">Drama</option>
                         <option value="Friction">Friction</option>
                         <option value="Games">Games</option>
                         <option value="Health">Health</option>
                         <option value="Sports">Sports</option>
                         <option value="Medical">Medical</option>
                         <option value="Musics">Musics</option>
                         <option value="Novels">Novels</option>
                         <option value="Travel">Travel</option>
                         </select>
                            
                        </div>                    
                    
                       <div class="form-group">
                         <label>Author Name</label>
                            <input name="author" type="text" class="form-control" placeholder="Author Name"  minlength="3" maxlength="25" pattern="[A-Z a-z]+" title="Provid valid Name" required />
                        </div>                    
                    
                       <div class="form-group">
                         <label>Price</label>
                            <input name="price" type="number" min="1" max="100000" class="form-control" placeholder="" pattern="[0-9]{0-9}+" title="Provid valid Input" required/>
                        </div>                    
                    
                       <div class="form-group">
                         <label>Publish Date</label>
                         <select name="publishedDate" class="form-control" required>
                          <script>
                                  var myDate = new Date();
                                  var year = myDate.getFullYear();
                                  document.write('<option value="">Select year</option>');
                                  for(var i = 1980; i < year+1; i++){
	                              document.write('<option value="'+i+'">'+i+'</option>');
                                 }
                          </script>
                         </select>
                           
                        </div>                    
                    
                       <div class="form-group">
                         <label>Number Of Books</label>
                            <input name="numberOfbooks" type="number" min="1" max="1000"class="form-control" placeholder=""  required/>
                        </div>                    
                    
					   
                     <input type="submit" class="form-control btn btn-login" value="SUBMIT" role="button" />
                     </s:form>
                </div>
               
       </div>
            </div>
		</div>
		<div class="col-md-5">
		 <s:url id="remoteurl" action="bookDetailsData.action"  escapeAmp="false"/>  
   <s:url id="editurl" action="updateEventDetails.action"/>
	<sjg:grid
	    id="gridtable" 
	    caption="Book Details"
	  	dataType="json"
		href="%{remoteurl}"
		pager="true" 
		gridModel="booksList" 
		loadonce="false"
		rowNum="100"
		navigator="true" 
		navigatorAdd="false" 
		navigatorDelete="true"
		navigatorEdit="true" 
		navigatorEditOptions="{addCaption:'EDIT',height:600,width:250,reloadAfterSubmit:false,closeAfterEdit:true}"
		navigatorDeleteOptions="{height:180,reloadAfterDelete:false,closeAfterDelete:true}"
		navigatorRefresh="true" 
		navigatorSearch="false"
		navigatorView="false" 
		rowList="20,30,40,50,60,100"
		viewrecords="true" 
		onSelectRowTopics="rowselect" 
		editurl="%{editurl}"
		editinline="false" 
   		rownumbers="true"
   		sortable="true"
   		sortname="id" 
   		sortorder="asc"
		autowidth="true"
		height="400"
		>
 		<sjg:gridColumn name="id" hidden="true"  search="false" key="true" index="Id" title="Event ID" sortable="true" />
 			<sjg:gridColumn name="bookId" align="left" width="100" index="bookId" title="bookId"  sortable="true" editable="true" editoptions="{maxlength:'120'}" editrules="{required: true}"/>
			<sjg:gridColumn name="bookname" align="left" width="100" index="bookname" title="bookname" sortable="true" editable="true" editrules="{required: true}"/>
			<sjg:gridColumn name="category" align="left" width="100" index="category" title="category" sortable="true" editable="true" editoptions="{maxlength:'600'}" editrules="{required: true}"/>
			<sjg:gridColumn name="author" align="left" width="100"  index="author" title="author" sortable="true" editable="true" editoptions="{maxlength:'3000'}" editrules="{required: true}"/>
			<sjg:gridColumn name="price" align="left" width="100"  index="Price" title="Price" sortable="true" editable="true" />
			<sjg:gridColumn name="publishedDate" align="left" width="100" index="publishedDate" title="PublishedDate" sortable="true" editable="true" />
			<sjg:gridColumn name="numberOfbooks" align="left" width="100" index="numberOfBooks" title="NumberOfBooks" sortable="true" editable="true" /> 
	</sjg:grid>
		</div>
	</div>
</div>
  


  </body>
</body>
</html>