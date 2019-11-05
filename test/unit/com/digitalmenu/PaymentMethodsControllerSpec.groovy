package com.digitalmenu



import grails.test.mixin.*
import spock.lang.*

@TestFor(PaymentMethodsController)
@Mock(PaymentMethods)
class PaymentMethodsControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.paymentMethodsInstanceList
            model.paymentMethodsInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.paymentMethodsInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def paymentMethods = new PaymentMethods()
            paymentMethods.validate()
            controller.save(paymentMethods)

        then:"The create view is rendered again with the correct model"
            model.paymentMethodsInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            paymentMethods = new PaymentMethods(params)

            controller.save(paymentMethods)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/paymentMethods/show/1'
            controller.flash.message != null
            PaymentMethods.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def paymentMethods = new PaymentMethods(params)
            controller.show(paymentMethods)

        then:"A model is populated containing the domain instance"
            model.paymentMethodsInstance == paymentMethods
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def paymentMethods = new PaymentMethods(params)
            controller.edit(paymentMethods)

        then:"A model is populated containing the domain instance"
            model.paymentMethodsInstance == paymentMethods
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/paymentMethods/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def paymentMethods = new PaymentMethods()
            paymentMethods.validate()
            controller.update(paymentMethods)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.paymentMethodsInstance == paymentMethods

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            paymentMethods = new PaymentMethods(params).save(flush: true)
            controller.update(paymentMethods)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/paymentMethods/show/$paymentMethods.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/paymentMethods/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def paymentMethods = new PaymentMethods(params).save(flush: true)

        then:"It exists"
            PaymentMethods.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(paymentMethods)

        then:"The instance is deleted"
            PaymentMethods.count() == 0
            response.redirectedUrl == '/paymentMethods/index'
            flash.message != null
    }
}
