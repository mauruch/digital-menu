package com.digitalmenu

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * MenuController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */

@Secured(["ROLE_USER", "ROLE_ADMIN"])
@Transactional(readOnly = true)
class MenuController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(["permitAll"])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Menu.list(params), view: 'list', model: [menuInstanceCount: Menu.count()]
    }

    @Secured(["permitAll"])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Menu.list(params), model: [menuInstanceCount: Menu.count()]
    }

    def show(Menu menuInstance) {
        respond menuInstance
    }

    def create() {
        Map<String, List<Category>> categories = com.digitalmenu.Food.list().groupBy({ food -> food.category.code })
        respond new Menu(params), model: [categories: categories]
    }

    @Transactional
    def save(Menu menuInstance) {
        if (menuInstance == null) {
            notFound()
            return
        }

        if (menuInstance.hasErrors()) {
            respond menuInstance.errors, view: 'create'
            return
        }

        menuInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'menuInstance.label', default: 'Menu'), menuInstance.id])
                redirect menuInstance
            }
            '*' { respond menuInstance, [status: CREATED] }
        }
    }

    def edit(Menu menuInstance) {
        respond menuInstance
    }

    @Transactional
    def update(Menu menuInstance) {
        if (menuInstance == null) {
            notFound()
            return
        }

        if (menuInstance.hasErrors()) {
            respond menuInstance.errors, view: 'edit'
            return
        }

        menuInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Menu.label', default: 'Menu'), menuInstance.id])
                redirect menuInstance
            }
            '*' { respond menuInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Menu menuInstance) {

        if (menuInstance == null) {
            notFound()
            return
        }

        menuInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Menu.label', default: 'Menu'), menuInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuInstance.label', default: 'Menu'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
