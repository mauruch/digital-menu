
<%@ page import="com.digitalmenu.PaymentMethods" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentMethods.label', default: 'PaymentMethods')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-paymentMethods" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="paymentMethods" title="${message(code: 'paymentMethods.paymentMethods.label', default: 'Payment Methods')}" />
			
				<g:sortableColumn property="promotions" title="${message(code: 'paymentMethods.promotions.label', default: 'Promotions')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${paymentMethodsInstanceList}" status="i" var="paymentMethodsInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${paymentMethodsInstance.id}">${fieldValue(bean: paymentMethodsInstance, field: "paymentMethods")}</g:link></td>
			
				<td>${fieldValue(bean: paymentMethodsInstance, field: "promotions")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${paymentMethodsInstanceCount}" />
	</div>
</section>

</body>

</html>
