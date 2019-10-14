
<sec:ifLoggedIn>
<li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
   		<i class="glyphicon glyphicon-wrench"></i>
		<g:message code="default.admin.label"/><b class="caret"></b>
	</a>
	<ul class="dropdown-menu">
		<li class="">
			<a href="${createLink(uri: '/user/index')}">
				<g:message code="default.users.create"/>
			</a>
		</li>
	</ul>
</li>
</sec:ifLoggedIn>