package com.digitalmenu

import org.springframework.security.access.annotation.Secured

@Secured(["ROLE_USER", "ROLE_ADMIN"])
class IndexController {

	def index() {
	}
}
