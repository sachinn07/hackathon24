
<!DOCTYPE html>
<html lang="en" xmlns="https://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<%@page isELIgnored="false" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <head>
    <link rel="stylesheet" href="/views/Login.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <title>Home</title>
    <header>
 <div style="background-color: #281d46; height: 70px; width: 100%;">
  <div style="height: 100px; width: 100px;">
 <img height=50 width=200 alt="image"  src="https://seeklogo.com/images/N/natwest-logo-FA71B898B1-seeklogo.com.png"> 
     </div>
  <div>
 
  </div>
 </div>
    </header>
    <body>
    <div id="carddiv" class="row">
     
    </div>
 
 <div id="carddiv" class="row">
        <div class="col-sm-6" style="padding: 20px;"><div class="card" style="width: 100%; 
         margin-left: 20%"><div class="card-body">
          <h5> We are here to provide you savings for your short term buying plans.  </h5><br>
       <h5>Let us know what you are saving for and how much time do you want to take.  </h5><br>
        <h5>Fill in the details and we will suggest you how much you need to save per transaction <br>
        by our algorithm.</h5></div>
        </div></div>
        </div>

 <script>
function showdata(data) {
	fetch('http://localhost:8080/Donation/selectaccount', {
		  method: 'POST',
		  body: data
		}).then(res => res.json())
		  .then(res => console.log(res));
console.log("fds")
}
</script>

<form action="user" method="post">
  <div class="form-group"class="row">
 
        <div class="col-sm-6" style="padding: 20px;"><div class="card" style="width: 100%; 
         margin-left: 20%"><div class="card-body">
    <h5> hi <input type="text" name="userName" value= '${userName}'> <br>
		
	  <h5> Amount: </h5>		<input type="text" name="amount"><br>
		  <h5>Time you have in Months: </h5>		<input type="text" name="timet"><br> 
  <button type="submit" class="btn btn-primary" value="/makepayment">Submit</button>
  </div></div>
        
  </div>
  </div>
</form>
    </body>
    
   
  
</html>