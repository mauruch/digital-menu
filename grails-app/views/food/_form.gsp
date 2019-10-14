<%@ page import="com.digitalmenu.Food" %>

			<div class="${hasErrors(bean: foodInstance, field: 'name', 'error')} ">
			<label for="name" class="control-label"><g:message code="food.name.label" default="Name" /></label>
			<div>
				<g:textField class="form-control" name="name" value="${foodInstance?.name}"/>
				<span class="help-inline">${hasErrors(bean: foodInstance, field: 'name', 'error')}</span>
			</div>
			</div>

			<div class="${hasErrors(bean: foodInstance, field: 'price', 'error')} required">
			<label for="price" class="control-label"><g:message code="food.price.label" default="Price" /><span class="required-indicator">*</span></label>
			<div>
				<g:field class="form-control" name="price" value="${fieldValue(bean: foodInstance, field: 'price')}" required=""/>
				<span class="help-inline">${hasErrors(bean: foodInstance, field: 'price', 'error')}</span>
			</div>
			</div>

			<div class="${hasErrors(bean: foodInstance, field: 'category', 'error')} required">
				<label for="category" class="control-label"><g:message code="food.category.label" default="Category" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="category" name="category.id" from="${com.digitalmenu.Category.list()}" optionKey="id" required="" value="${foodInstance?.category?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: foodInstance, field: 'category', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: foodInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="food.description.label" default="Description" /></label>
				<div>
					<g:textField class="form-control" name="description" value="${foodInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: foodInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: foodInstance, field: 'isAvailable', 'error')} ">
				<label for="isAvailable" class="control-label"><g:message code="food.isAvailable.label" default="Is Available" /></label>
				<div>
					<bs:checkBox name="isAvailable" value="${foodInstance?.isAvailable}" />
					<span class="help-inline">${hasErrors(bean: foodInstance, field: 'isAvailable', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: foodInstance, field: 'isGlutenFree', 'error')} ">
				<label for="isGlutenFree" class="control-label"><g:message code="food.isGlutenFree.label" default="Is Gluten Free" /></label>
				<div>
					<bs:checkBox name="isGlutenFree" value="${foodInstance?.isGlutenFree}" />
					<span class="help-inline">${hasErrors(bean: foodInstance, field: 'isGlutenFree', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: foodInstance, field: 'isVegetarian', 'error')} ">
				<label for="isVegetarian" class="control-label"><g:message code="food.isVegetarian.label" default="Is Vegetarian" /></label>
				<div>
					<bs:checkBox name="isVegetarian" value="${foodInstance?.isVegetarian}" />
					<span class="help-inline">${hasErrors(bean: foodInstance, field: 'isVegetarian', 'error')}</span>
				</div>
			</div>

