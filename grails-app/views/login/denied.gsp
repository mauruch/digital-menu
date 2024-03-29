<html>
<head>
	<title><g:message code="springSecurity.denied.title"/></title>
	<meta name="layout" content="kickstart" />

	<g:set var="layout_nomainmenu"		value="${true}" scope="request"/>
	<g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
</head>

<body>
	<content tag="header">
		<!-- Empty Header -->
	</content>

  	<section id="Error" class="">
		<div class="big-message">
			<div class="container">
				<h1><g:message code="springSecurity.denied.title" default="Denied!"/></h1>
		    	<h2><g:message code="springSecurity.denied.message" /></h2> 
				
				<div class="actions margin-top-large">
					<a href="${createLink(uri: '/')}" class="btn btn-large btn-primary">
						<i class="glyphicon glyphicon-chevron-left icon-white"></i>
						<g:message code="error.button.backToHome"/>
					</a>

				</div>
			</div>
		</div>
	</section>

</body>
</html>
