package com.digitalmenu

import org.springframework.security.access.annotation.Secured

@Secured(["permitAll"])
class IndexController {

	def index() {
		redirect(controller: 'menu', action: 'list')
	}
}
