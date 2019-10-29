
<%@ page import="com.digitalmenu.Menu" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-menu" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="menu.dessert.label" default="Dessert" /></td>
				
				<td valign="top" class="value"><g:link controller="food" action="show" id="${menuInstance?.dessert?.id}">${fieldValue(bean: menuInstance, field: "dessert.name")}</g:link></td>

			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="menu.mainDish.label" default="Main Dish" /></td>
				
				<td valign="top" class="value"><g:link controller="food" action="show" id="${menuInstance?.mainDish?.id}">${fieldValue(bean: menuInstance, field: "mainDish.name")}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="menu.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: menuInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="menu.price.label" default="Price" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: menuInstance, field: "price")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="menu.starter.label" default="Starter" /></td>
				
				<td valign="top" class="value"><g:link controller="food" action="show" id="${menuInstance?.starter?.id}">${fieldValue(bean: menuInstance, field: "starter.name")}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
