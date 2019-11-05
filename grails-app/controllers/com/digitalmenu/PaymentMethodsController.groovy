package com.digitalmenu

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * PaymentMethodsController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */

@Secured(["ROLE_USER", "ROLE_ADMIN"])
@Transactional(readOnly = true)
class PaymentMethodsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(["permitAll"])
	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PaymentMethods.list(params), model:[paymentMethodsInstanceCount: PaymentMethods.count()]
    }

    @Secured(["permitAll"])
	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PaymentMethods.list(params), model:[paymentMethodsInstanceCount: PaymentMethods.count()]
    }

    def show(PaymentMethods paymentMethodsInstance) {
        respond paymentMethodsInstance
    }

    def create() {
        respond new PaymentMethods(params)
    }

    @Transactional
    def save(PaymentMethods paymentMethodsInstance) {
        if (paymentMethodsInstance == null) {
            notFound()
            return
        }

        if (paymentMethodsInstance.hasErrors()) {
            respond paymentMethodsInstance.errors, view:'create'
            return
        }

        paymentMethodsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'paymentMethodsInstance.label', default: 'PaymentMethods'), paymentMethodsInstance.id])
                redirect paymentMethodsInstance
            }
            '*' { respond paymentMethodsInstance, [status: CREATED] }
        }
    }

    def edit(PaymentMethods paymentMethodsInstance) {
        respond paymentMethodsInstance
    }

    @Transactional
    def update(PaymentMethods paymentMethodsInstance) {
        if (paymentMethodsInstance == null) {
            notFound()
            return
        }

        if (paymentMethodsInstance.hasErrors()) {
            respond paymentMethodsInstance.errors, view:'edit'
            return
        }

        paymentMethodsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PaymentMethods.label', default: 'PaymentMethods'), paymentMethodsInstance.id])
                redirect paymentMethodsInstance
            }
            '*'{ respond paymentMethodsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PaymentMethods paymentMethodsInstance) {

        if (paymentMethodsInstance == null) {
            notFound()
            return
        }

        paymentMethodsInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PaymentMethods.label', default: 'PaymentMethods'), paymentMethodsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentMethodsInstance.label', default: 'PaymentMethods'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
