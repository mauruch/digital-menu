<%@ page import="com.digitalmenu.PaymentMethods" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentMethods.label', default: 'PaymentMethods')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

	<section id="create-paymentMethods" class="first">

		<g:hasErrors bean="${paymentMethodsInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${paymentMethodsInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" role="form" >
			<g:render template="form"/>

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</div>
		</g:form>

	</section>

</body>

</html>
