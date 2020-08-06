<%@ include file= "Header.jsp" %>
<body>


<div class="container layer">
	  <div class="row">
	  	<div class="col-sm-2"></div>
	  		<div class = "col-sm-8">
    	 		<form class="form-signin" action="service/memberinsert" method="post">
       			 <h2 class="form-signin-heading">Register</h2>
       			 <label for="inputEmail" class="sr-only">Id</label>
        		 <input type="email" name="id" class="form-control" placeholder="Insert ID" required autofocus>
        			<label for="inputPassword" class="sr-only">Password</label>
        			<input type="password" name="password" class="form-control" placeholder="Insert password" required>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
      			</form>
      	</div>
	  </div>
</div>s
<%@ include file= "Footer.jsp" %>
</body>
</html>