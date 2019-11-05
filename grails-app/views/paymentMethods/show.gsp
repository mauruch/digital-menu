
<%@ page import="com.digitalmenu.PaymentMethods" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentMethods.label', default: 'PaymentMethods')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-paymentMethods" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentMethods.paymentMethods.label" default="Payment Methods" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paymentMethodsInstance, field: "paymentMethods")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentMethods.promotions.label" default="Promotions" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paymentMethodsInstance, field: "promotions")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
