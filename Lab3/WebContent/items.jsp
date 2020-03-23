<%@page import="com.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%
//Insert item---------------------------------
if (request.getParameter("btnSubmit") != null){
	Item itemObj = new Item();
	String stsMsg;
	//update
	if(request.getParameter("itemID") != null){
		stsMsg = itemObj.updateItem(request.getParameter("itemID"),
				request.getParameter("itemCode"),
				request.getParameter("itemName"),
				request.getParameter("itemPrice"),
				request.getParameter("itemDesc"));
	} else {//insert
		stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
				 request.getParameter("itemName"),
				 request.getParameter("itemPrice"),
				 request.getParameter("itemDesc"));
	}
	
	session.setAttribute("statusMsg", stsMsg); 
}

//Delete item----------------------------------
if (request.getParameter("btnRemove") != null){
	Item itemObj = new Item();
	String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
	session.setAttribute("statusMsg", stsMsg);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
<h1>Items Management</h1>
<form method="post" action="items.jsp">
 <%
 if (request.getParameter("btnUpdate") != null){
	 out.print(new Item().search(request.getParameter("itemID")));
 } else {
	 out.print("Item code: <input name=\"itemCode\" type=\"text\" ><br>"
			 + "Item name: <input name=\"itemName\" type=\"text\" ><br>"
			 + "Item price: <input name=\"itemPrice\" type=\"text\" ><br>"
			 + "Item description: <input name=\"itemDesc\" type=\"text\"><br>");
 }
 %>
 <input name="btnSubmit" type="submit" value="Save">
</form>
<% 
Object status = session.getAttribute("statusMsg");
if(status != null){
	out.print(status); 
}
%>
<br>
<%
 Item itemObj = new Item();
 out.print(itemObj.readItems());
%>
</body>
</html>