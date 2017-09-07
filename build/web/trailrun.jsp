<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>

<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>play game</title>

<script type="text/javascript" src="ticket.js" > </script>
<script type="text/javascript" src="jquery-3.1.1.js" ></script>
</head>
	
<style>
	#container
	{
		width:100%;
		height:100%;
	}
	body
	{
		width:100%;
		background-color:#cccccc;
	}
		
	#number
	{
		height:200px;
		width:200px;
			
	}
		
	#claimsdiv
	{
		height:200px;
		width:200px;	
		position:absolute;
		top:500px;
	}
	#tickettable
	{
		height:140px;
		width:700px;
		color: red;
		position:absolute;
		
		left:314px;
		top:500px;
	
		
	}
	#ServletTablediv
	{
		height:200px;
		width:1000px;
		position:absolute;
		top:250px;
		left:400px;
		
		color: #333;
		font-family: times;
		font-size: 20px;
		text-align: center;
	}
	input[type=submit]
	{
		width: 110px;  height: 60px;
		color:white;
		background-color:#333;
		font-family: times;
		font-size: 20px;
	}
	
	
	#number
	{
		position:absolute;
		
		top:250px;
		
		left:100px;
		color: #000;
		font-family: times;
		font-size: 90px;
	}
	#playbutton
	{
		width: 200px;  height: 150px;
		position:absolute;
                top:1000px;
                left:-50px;
		color:white;
		background-color:#333;
		
		font-family: times;
		font-size: 40px;
	}
	#playbuttondiv
	{
		position:absolute;
		top:50%;
		left:40%;
		
	}
	#pointsDiv
	{	
		color: rgb(0,170,0);
		position:absolute;
		top:400px;
		left:100px;
			
	}
	#claimsdiv
	{
		position:absolute;
		top:750px;
		left:500px;
                
	}
	#pointsbutton
	{	
		width: 200px;  height: 150px;
		
		color: greenyellow;
		position:absolute;
		
		background-color:#333;
		font-family: times;
		font-size: 50px;
		
		display:none;
	}
	.claims
	{
		height: 50px;
		background-color:#ff3300;
		font-family: times;
		font-size: 20px;
		color:white;
		
	}
	#header
	{
		width: 100%;
		height: 100px;
		background: #333;
		box-shadow: 0px 2px 4px gray;
		color:white;
		text-decoration: none;
		color: white;
		font-family: times;
		font-size: 20px;
		line-height: 80px;
		display: block;
		text-align: center;
	}
	#ServletTable td
	{
		background:#333;
		color:white;
		font-family: times;
		font-size: 40px;
	}
	</style>
	<div id="container">
	<div id="header">
		<h1> Click below button to play </h1>
                <h2><a href="homepage.html"><span class="glyphicon glyphicon-log-in"></span> Logout</a></h2>
	</div>
	<div id="body">
            
            <%
        Connection con = null;
        //HttpSession session1=request.getSession(false);
        /*if(session1==null){
            response.sendRedirect("Login.html");
        }*/
        String n = (String)session.getAttribute("name");
        String name=null;
         out.println(n);
            if(n==null){
             
            }
        try {
              Class.forName("com.mysql.jdbc.Driver").newInstance ();
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tambola","root","1234");
               Statement ps = con.createStatement();
            //ResultSet rs=ps.executeQuery("select * from registration where username=?");
            out.println("sucess");
            PreparedStatement st=con.prepareStatement("select * from points where Email=?");
            
            st.setString(1, n);
            ResultSet rs=st.executeQuery();
                    while(rs.next()){;
                        name=rs.getString("points");
                        //out.println("name");
                    }
          // out.println(name);
            //Statement stat = con.createStatement();
            //String q="select points from points where emailid="+n+"";
            
           name=rs.getString("points");
              
            out.println("sucess");
            out.println(rs);
            con.close();
        } catch (Exception e) { }

       // response.sendRedirect("success.htm");
    %>
		<div id="playbuttondiv">
			<input type="button" id="playbutton" value="play" onclick="play();" >
		</div>
		<div id="ServletTablediv" >
			<table id="ServletTable" width="700px" style="display:none;"></table>
		</div>
		
		
		<div id="number">
			<h1> ${number} </h1>
	
		</div>
		
	
		
	
		<div id="claimsdiv">
			<table>
				
				<tr>
					<td> <input type="button"  class="claims" value="#Fast Five " id="fastfive" onclick="fastfive();" style="visibility:hidden;"></td>
					<td> <input type="button"  class="claims" value="#TopLine " id="topline" onclick="topline();" style="visibility:hidden;"></td>
					<td> <input type="button"  class="claims" value="#MiddleLine " id="middleline" onclick="middleline();"  style="visibility:hidden;"></td>
					<td> <input type="button"  class="claims" value="#BottomLine " id="bottomline" onclick="bottomline();" style="visibility:hidden;"></td>
					<td> <input type="button" class="claims"  value="#Housy " id="housy" onclick="housy();" style="visibility:hidden;"></td>
				</tr>			
				
			</table>
	
		</div>
		<div id="pointsDiv">
			<h2 id="scoreheading" style="display:none"> Earned Points </h2>
			<input type="button" id="pointsbutton" onclick="update(this)" value="<%=name%>" style="font-size:20px" > 
			
		</div>
		<p id="demo"></p>
 </div>
 </div>
                        <script>
                            alert("called");
                            function update(data)
        {
            alert("sucess");
            var s=data.value;
            var url ="PointsUpdate?arr="+s;
                    var xmlhttp=new XMLHttpRequest();
                    xmlhttp.onreadystatechange=function(){
                    if (xmlhttp.readyState==4 && xmlhttp.status==200){
                    document.getElementById("demo").innerHTML=xmlhttp.responseText;
              
                    }
                    };
//                    document.location.href = url;
                    xmlhttp.open("GET",url,true);
                    xmlhttp.send();
            
        }
        </script>
	</div>
	</div>
</html>