%{--<ul class="nav pull-right">--}%
<sec:ifLoggedIn>

    <li class="dropdown">

        <a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
            <!-- TODO: Only show menu items based on permissions (e.g., Guest has no account page) -->
            <i class="glyphicon glyphicon-user icon-white"></i>
            <sec:username/>
            %{--<g:message code="default.user.unknown.label" default="Guest"/> <b class="caret"></b>--}%
        </a>
        <ul class="dropdown-menu" role="menu">
            <!-- TODO: Only show menu items based on permissions -->

            <li class=""><a href="${createLink(uri: '/logout/index')}">
                <i class="glyphicon glyphicon-off"></i>
                <g:message code="security.signoff.label"/>
            </a></li>
        </ul>

    </li>
%{--</ul>--}%

</sec:ifLoggedIn>

<noscript>
    <ul class="nav pull-right">
        <li class="">
            <g:link controller="logout" action="index"><g:message code="default.user.unknown.label"/></g:link>
        </li>
    </ul>
</noscript>
