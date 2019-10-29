
<%@ page import="com.digitalmenu.Menu" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-menu" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			<g:sortableColumn property="name" title="${message(code: 'menu.name.label', default: 'Name')}" />

			<g:sortableColumn property="price" title="${message(code: 'menu.price.label', default: 'Price')}" />

				<th><g:message code="menu.starter.label" default="Starter" /></th>


			<th><g:message code="menu.mainDish.label" default="Main Dish" /></th>

			<th><g:message code="menu.drink.label" default="Bebida" /></th>

				<th><g:message code="menu.dessert.label" default="Dessert" /></th>
			


			

			</tr>
		</thead>
		<tbody>
		<g:each in="${menuInstanceList}" status="i" var="menuInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

			<td><g:link action="show" id="${menuInstance.id}">${fieldValue(bean: menuInstance, field: "name")}</g:link></td>

			<td>${fieldValue(bean: menuInstance, field: "price")}</td>

			<td>${fieldValue(bean: menuInstance, field: "starter.name")}</td>

			<td>${fieldValue(bean: menuInstance, field: "mainDish.name")}</td>

			<td>${fieldValue(bean: menuInstance, field: "drink.name")}</td>

			<td>${fieldValue(bean: menuInstance, field: "dessert.name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${menuInstanceCount}" />
	</div>
</section>

</body>

</html>
