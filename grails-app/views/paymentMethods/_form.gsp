<%@ page import="com.digitalmenu.PaymentMethods" %>



			<div class="${hasErrors(bean: paymentMethodsInstance, field: 'paymentMethods', 'error')} ">
				<label for="paymentMethods" class="control-label"><g:message code="paymentMethods.paymentMethods.label" default="Payment Methods" /></label>
				<div>
					<g:textArea class="form-control" name="paymentMethods" value="${paymentMethodsInstance?.paymentMethods}"/>
					<span class="help-inline">${hasErrors(bean: paymentMethodsInstance, field: 'paymentMethods', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: paymentMethodsInstance, field: 'promotions', 'error')} ">
				<label for="promotions" class="control-label"><g:message code="paymentMethods.promotions.label" default="Promotions" /></label>
				<div>
					<g:textArea class="form-control" name="promotions" value="${paymentMethodsInstance?.promotions}"/>
					<span class="help-inline">${hasErrors(bean: paymentMethodsInstance, field: 'promotions', 'error')}</span>
				</div>
			</div>

