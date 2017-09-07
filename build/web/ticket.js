
	var InspectingArray=new Array();
		
	var InspectingArrayIterator=0;
	
	var Top=new Array();
	var Middle=new Array();
	var Bottom=new Array();
	 var myVar;
		
	function play()
	{
		
		$("#playbutton").hide();
		$("#pointsbutton").show();
		$("#scoreheading").show();
		
		
		var rows = 3;
		var cols = 9;
		var ticket = new Array();
		var colcou=new Array();
		var numbers=new Array();
		var row = 0, num=0, val ;
		
		for (var i=0;i<rows;i++) 
		{
			ticket[i]=new Array();
	 		for (var j=0;j<cols;j++) 
	 		{
	 			ticket[i][j]=0;
	 		}
		}
		for (var j=0;j<cols;j++) 
 		{
 			colcou[j]=0;
 		}
		for (var j=0;j<90;j++) 
 		{
 			numbers[j]=0;
 		}
		while(num<15)
		{
			
			var col = Math.floor(Math.random() * 10);
			val = col*10+Math.floor(Math.random() * 10);
			if(ticket[row][col]==0 && colcou[col]<2 && val!=0 &&  numbers[val]==0)
			{
				numbers[val]=1;
				ticket[row][col]=val;
				colcou[col]++;
				if(++num%5==0)
				{
					row++;
				}
			}
		}
		
		makeTable($(document.body), ticket);
		
		function makeTable(container, data) 
		{
			var table = $("<table/ id='tickettable' height='300px' width='1000px'>").addClass('CSSTableGenerator');
			$.each(data, function(rowIndex, r) 
			{
				var rowt = $("<tr/>");
				$.each(r, function(colIndex, c) 
				{ 
					if(c==0)
					{
						rowt.append($("<td/>").append($("<input type='submit' id='ticketbutton' value='' disabled/>")));
					}
					else
					{
						
						rowt.append($("<td/>").append($("<input type='submit' id="+c+" value="+c+" onclick='count(this)' />")));
					}
					
				});
				table.append(rowt);
			});
			container.append(table);
		}
		
		
		
		var count=0,rc=0,cc=0;
		var table = document.getElementById("ServletTable");
	    var rowf;

	    myFunction();
	    myVar = setInterval(function(){ myFunction();}, 1000);
		
			
		function myFunction()
		{
			$.post('getRandomNumber', function(data)
			{
				document.getElementById("number").innerHTML=data;
				if(parseInt(data)==0)
				{
					$("#number").hide();
				}
				var number=data;
				if(count > 88)
				{
					clearInterval(myVar);
					$("#number").hide();
				}
				else
				{
					if(count%30==0)
					{
						rowf=table.insertRow(rc++);
						cc=0;
					}
					var cell=rowf.insertCell(cc++);
					cell.innerHTML=number;
					count++;
				}
				$("#ServletTable").show();
				document.getElementById("fastfive").style.visibility = 'visible';
				document.getElementById("topline").style.visibility = 'visible';
				document.getElementById("middleline").style.visibility = 'visible';
				document.getElementById("bottomline").style.visibility = 'visible';
				document.getElementById("housy").style.visibility = 'visible';
				search(data);
					
			});
		}
		function search(data)
		{
			//alert("search method inspp length "+InspectingArray.length);
			for (var i=0;i<rows;i++) 
			{
		 		for (var j=0;j<cols;j++) 
		 		{
		 			if(data==ticket[i][j])
		 			{
		 				InspectingArray[InspectingArrayIterator++]=data;
		 				if(i==0)
		 				{
		 					Top.push(data);
		 					//alert("Top Length "+Top.length);
		 				}
		 				else if(i==1)
		 				{
		 					Middle.push(data);
		 					//alert("Middle Length "+Middle.length);
		 				}
		 				else if(i==2)
		 				{
		 					Bottom.push(data);
		 					//alert("Bottom Length "+Bottom.length);
		 				}
		 			
		 				
		 			}
		 		}
			}
		}
	}
	
	
	
	
	function count(number)
	{
		//alert("called count >>> " +number.value);
		for(i=0;i<InspectingArray.length;i++)
		{
			var id="#"+number.value;
			//alert(id+" > "+number.value+" --> "+InspectingArray[i]);
			
			if(InspectingArray[i]==parseInt(number.value))
			{
				//$(id).css("background-color","yellow");
				document.getElementById(number.value).style.background="#98AFC7";
				//number.style.background = "yellow";
			}
		}
		
	}
	
	function fastfive()
	{
		//alert("fastfive "+InspectingArray.length);
		if(InspectingArray.length>4)
		{
			var value=parseInt(document.getElementById("pointsbutton").value)+50;
			$("#pointsbutton").attr('value', value);
			document.getElementById("fastfive").disabled = true;
			document.getElementById("fastfive").style.background="#98AFC7";
			
		}
	}
	function topline()
	{
		//alert("Topline "+Top.length);
		if(Top.length>4)
		{
			var value=parseInt(document.getElementById("pointsbutton").value)+100;
			$("#pointsbutton").attr('value', value);
			document.getElementById("topline").disabled = true;
			document.getElementById("topline").style.background="#98AFC7";
			
		}
	}
	function middleline()
	{
		if(Middle.length>4)
		{
			var value=parseInt(document.getElementById("pointsbutton").value)+100;
			$("#pointsbutton").attr('value', value);
			document.getElementById("middleline").disabled = true;
			document.getElementById("middleline").style.background="#98AFC7";
		}
	}
	function bottomline()
	{
		//alert("Bottom  "+Bottom.length);
		if(Bottom.length>4)
		{
			var value=parseInt(document.getElementById("pointsbutton").value)+100;
			$("#pointsbutton").attr('value', value);
			document.getElementById("bottomline").disabled = true;
			document.getElementById("bottomline").style.background="#98AFC7";
		}
	}
	function housy()
	{
		//alert("fastfive "+InspectingArray.length);
		if(InspectingArray.length>14)
		{
			var value=parseInt(document.getElementById("pointsbutton").value)+200;
			$("#pointsbutton").attr('value', value);
			document.getElementById("housy").disabled = true;
			document.getElementById("housy").style.background="#98AFC7";
		}
	}
	
	