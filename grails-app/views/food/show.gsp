
<%@ page import="com.digitalmenu.Food" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'food.label', default: 'Plato')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-food" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="food.category.label" default="Category" /></td>
				
				<td valign="top" class="value"><g:link controller="category" action="show" id="${foodInstance?.category?.id}">${foodInstance?.category?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="food.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: foodInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="food.isAvailable.label" default="Is Available" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${foodInstance?.isAvailable}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="food.isGlutenFree.label" default="Is Gluten Free" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${foodInstance?.isGlutenFree}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="food.isVegetarian.label" default="Is Vegetarian" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${foodInstance?.isVegetarian}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="food.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: foodInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="food.price.label" default="Price" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: foodInstance, field: "price")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
