<?php 
	session_start();
	$_SESSION['theatre_n']=null;
	$_SESSION['timer']=null;
?>


<html>
<head>
<title>User Dashboard</title>
<link href="css/animate.css" type='text/css' rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/swiper.min.css">

<link rel="stylesheet" type="text/css" href="css/userdashboardstyles.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>
.navbar li a:hover {
     background-color: black;
		color: white;
	
}

.navbar ul 
{	
	height:50px;
    list-style-type: none;
    overflow: hidden;
    background-color: #0b243d;
}

.navbar li a {
  float: left;
  display: block;
  color:white;
  text-align: center;
  padding: 12px 16px;
  text-decoration: none;
  font-size: 22px;
}

.navbar li a.active {
	background-color:black;
 color: white;
}


.navbar .search-container {
  float: right;
}

.navbar input[type=text] {
  padding: 6px;
  margin-top: 2px;
  font-size: 17px;
  border: none;
}

.navbar .search-container button {
  float: right;
  padding: 7.5px 10px;
  margin-top: 2px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.navbar .search-container button:hover {
  background: #ccc;
}



</style>

<body class="animated fadeIn">

<div class='navbar'>
<ul>	
<li>
	<div class="toggle-btn" onclick="toggleSidebar()">
	<span></span>
	<span></span>
	<span></span>
	</div>
</li>

<li><img src="images/logoo.png" style="padding-left:50px;padding-right:20px;padding-top:8px;float:left;height:35px;width:250px" /></li>

<li ><a class="active" href="userdashboard.php">Home</a></li>
<li><a href="#about">About</a></li>
<li ><a href="#contact">Contact</a></li>

<?php if(isset($_SESSION['name']))
	{?>
<li style="padding-left:50px;padding-right:20px;padding-top:6px;"><button class='sign' onclick="document.location.href='userlogout.php'">Logout</button></li>
<?php }else{?>
<li style="padding-left:50px;padding-right:20px;padding-top:6px;"><button class='sign'  onclick="document.location.href='index.php'">Sign In</button></li>
<?php }?>
 
 
 
  <div class="search-container">
    <form method="post">
      <input type="text" placeholder="Search Movie" name="search">
      <button type="submit" name="search1" ><i class="fa fa-search"></i></button>
    </form>
  </div>

</ul>
</div>

<?php
if(isset($_POST['search1']))
	
{
	$movie=$_POST['search'];
	include('dbcon.php');
	$qry1 = "Call searchmovie('$movie'); ";
	$result=mysqli_query($con,$qry1);
	$rows=mysqli_num_rows($result);
	if($rows==0)
	{
		$_SESSION['noid']=$movie;
		header('location:mdetails.php');
		
	}
	$row = mysqli_fetch_array($result);
	$_SESSION['mid']=$row['Movie_id'];
	header('location:mdetails.php');
	
	
}

?>






	
	
	
	

    <!-- Add Pagination -->
<div class="swiper-pagination"></div>
</div>


<br>


<div style="background-color: #0b243d;">
<br><br>
<h2 class="headings" style="margin-left:30px;color:#886D2C;font-size:30px;text-decoration:underline;text-decoration-color:red;">NEW </h2>

<h2 style="margin-left:30px;color:#886D2C;font-size:30px;">RELEASES</h2>
<br>
<br>
</div>





<h2 style="position:absolute;left:30px;top:220px">COMEDY<i class="right"></i></h2>

<h2 style="position:absolute;left:30px;top:630px">DRAMA/ACTION<i class="right"></i></h2>

<h2 style="position:absolute;left:30px;top:1050px">HORROR/THRLLER<i class="right"></i></h2>




<div class="movie-list">

 <table height="1300px" width="100%">
 
        <tr style="padding-bottom:10px;">
	
        <?php
       
        include('dbcon.php');
       
        $qry = "select * from movies where Genre='comedy'";
 
        $run = mysqli_query($con,$qry);
		$row=mysqli_num_rows($run);
		while($row = mysqli_fetch_array($run))
		{
		if($row['Release_date']<="2021-10-15")
		{
        ?>       
                <td width="25%">
                <center>
 
                     <div class="zoomimg">
					 <a href="mdetails.php?id=<?php echo $row['Movie_id'];?>">
		<img height="300px" width="300px" style="transition:0.75s;border-radius:20px;" src="Image/<?php echo $row['poster'];?>"> 
		
					 </a>
					 
					 </div>
                   
                </center>
                </td>
				
				
		<?php }
		
		}?>
			   
		</tr>
		
		
		
		<tr style="padding-top:20px;padding-bottom:10px;">
        <?php
       
        include('dbcon.php');
       
        $qry = "select * from movies where Genre like '%drama%' or Genre like '%action%'";
 
        $run = mysqli_query($con,$qry);
		$rows=mysqli_num_rows($run);
		while($row = mysqli_fetch_array($run))
		{
		if($row['Release_date']<="2021-10-15")
		{
        ?>       
                <td width="25%">
                <center>
                 
 
                     <div class="zoomimg">
					 <a href="mdetails.php?id=<?php echo $row['Movie_id'];?>">
		<img height="300px" width="300px" style="transition:0.75s;border-radius:20px;" src="Image/<?php echo $row['poster'];?>"> 
					 </a>
					</div>
                   
                </center>
                </td>
				
				
		<?php }
		
		}?>
			   
		</tr>
		
		
		
		<tr style="padding-top:20px;padding-bottom:10px;">
        <?php
       
        include('dbcon.php');
       
        $qry = "select * from movies where Genre like '%horror%' or Genre like '%thriller%'";
 
        $run = mysqli_query($con,$qry);
		$rows=mysqli_num_rows($run);
		while($row = mysqli_fetch_array($run))
		{
		if($row['Release_date']<="2021-10-15")
		{
        ?>      
                <td width="25%">
                <center>
                       
 
                     <div class="zoomimg">
					 <a href="mdetails.php?id=<?php echo $row['Movie_id'];?>">
			<img height="300px" width="300px" style="transition:0.75s;border-radius:20px;" src="Image/<?php echo $row['poster'];?>"> 
					 </a>
					 </div>
               
                         
                   
                </center>
                </td>
				
				
		<?php }
		
		}?>
			   
		</tr>

    </table>

</div>











</body>
</html>

