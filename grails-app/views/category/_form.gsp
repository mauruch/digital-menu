<%@ page import="com.digitalmenu.Category" %>



			<div class="${hasErrors(bean: categoryInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="category.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${categoryInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: categoryInstance, field: 'name', 'error')}</span>
				</div>
			</div>

