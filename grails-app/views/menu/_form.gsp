<%@ page import="com.digitalmenu.Menu" %>


			<div class="${hasErrors(bean: menuInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="menu.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${menuInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: menuInstance, field: 'name', 'error')}</span>
				</div>
			</div>

					<div class="${hasErrors(bean: menuInstance, field: 'starter', 'error')} required">
				<label for="starter" class="control-label"><g:message code="menu.starter.label" default="Starter" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="starter" name="starter.id" from="${com.digitalmenu.Food.list()}" optionKey="id" required="" value="${menuInstance?.starter?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: menuInstance, field: 'starter', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: menuInstance, field: 'mainDish', 'error')} required">
				<label for="mainDish" class="control-label"><g:message code="menu.mainDish.label" default="Main Dish" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="mainDish" name="mainDish.id" from="${com.digitalmenu.Food.list()}" optionKey="id" required="" value="${menuInstance?.mainDish?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: menuInstance, field: 'mainDish', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: menuInstance, field: 'dessert', 'error')} required">
				<label for="dessert" class="control-label"><g:message code="menu.dessert.label" default="Dessert" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="dessert" name="dessert.id" from="${com.digitalmenu.Food.list()}" optionKey="id" required="" value="${menuInstance?.dessert?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: menuInstance, field: 'dessert', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: menuInstance, field: 'price', 'error')} required">
				<label for="price" class="control-label"><g:message code="menu.price.label" default="Price" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="price" value="${fieldValue(bean: menuInstance, field: 'price')}" required=""/>
					<span class="help-inline">${hasErrors(bean: menuInstance, field: 'price', 'error')}</span>
				</div>
			</div>
