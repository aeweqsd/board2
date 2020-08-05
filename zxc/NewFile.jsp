
<body>
	<%@ include file= "Header.jsp" %>
	<%
		String id = "";
		Cookie[] co = request.getCookies();
	if(co !=null && co.length>0){
		for(int i=0;i<co.length;i++)
			if(co[i].getName().equals("id")){
				id = co[i].getValue();
			}
			
		}
	
	
	
	
	
	%>
	
	
	
	
<div class="container layer">
	  <div class="row">
	  	<div class="col-sm-2"></div>
	  		<div class = "col-sm-8">
    	 		<form class="form-signin" action="/zxc/service/login" method="post">
       			 <h2 class="form-signin-heading">Please Log in</h2>
       			 <label for="inputEmail" class="sr-only">Id</label>
        		 <input type="email" name="id" class="form-control" value="<%=id %>" required autofocus>
        			<label for="inputPassword" class="sr-only">Password</label>
        			<input type="password" name="password" class="form-control" required>
        				<div class="checkbox">
          					<label>
            				<input type="checkbox" name="remember"value="1"> Remember me
          					</label>
        				</div>
        					<button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
      			</form>
      <a href="service/Register">Register</a>
      </div>
      <div class="col-sm-2"></div>
      </div>
      </div>
	<%@ include file= "Footer.jsp" %>
</body>
</html>
