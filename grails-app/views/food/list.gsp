
<%@ page import="com.digitalmenu.Food" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'food.label', default: 'Plato')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-food" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>

				<g:sortableColumn property="name" title="${message(code: 'food.name.label', default: 'Name')}" />
			
				%{--<th><g:message code="food.category.label" default="Category" /></th>--}%
				<g:sortableColumn property="category" title="${message(code: 'food.category.label', default: 'Categoría')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'food.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="isAvailable" title="${message(code: 'food.isAvailable.label', default: 'Is Available')}" />
			
				<g:sortableColumn property="isGlutenFree" title="${message(code: 'food.isGlutenFree.label', default: 'Is Gluten Free')}" />
			
				<g:sortableColumn property="isVegetarian" title="${message(code: 'food.isVegetarian.label', default: 'Is Vegetarian')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${foodInstanceList}" status="i" var="foodInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${foodInstance.id}">${fieldValue(bean: foodInstance, field: "name")}</g:link></td>

				<td>${fieldValue(bean: foodInstance, field: "category")}</td>
			
				<td>${fieldValue(bean: foodInstance, field: "description")}</td>
			
				<td><g:formatBoolean boolean="${foodInstance.isAvailable}" /></td>
			
				<td><g:formatBoolean boolean="${foodInstance.isGlutenFree}" /></td>
			
				<td><g:formatBoolean boolean="${foodInstance.isVegetarian}" /></td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${foodInstanceCount}" />
	</div>
</section>

</body>

</html>
