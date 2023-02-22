<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>

#container{
      width: 100%;
      margin: 0px auto;
      text-align: center;
      border: 0px solid #bcbcbc;
   
   }
   #header{
      padding: 5px;
      margin-bottom: 5px;
      border: 0px solid #bcbcbc;
   
   
   }

   #content{
      width: 100%;
      padding: 5px;
      margin-right: 5px;
      float: left;
      border: 0px solid #bcbcbc;
   }
   #footer{
      clear: both;
      padding: 5px;
      border: 0px solid #bcbcbc;
    
   } -->


</style> 


<title>
	<tiles:insertAttribute name="title"/>
	
</title>
</head>
<body>
<div id="container">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="sidebar-left">
		<tiles:insertAttribute name="side"/>
	</div>
	<div id="content">
		<tiles:insertAttribute name="body"/>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>

</div>
</body>
</html>