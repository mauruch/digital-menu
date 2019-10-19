import com.digitalmenu.Category
import com.digitalmenu.User
import com.digitalmenu.UserRole
import com.digitalmenu.Role


class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()

        def testUserAdmin = new User(username: 'admin', password: '1234').save()
        def testUser = new User(username: 'user', password: '1234').save()

        UserRole.create testUserAdmin, adminRole
        UserRole.create testUser, userRole

        new Category(name: "Bebida").save()
        new Category(name: "Postre").save()
        new Category(name: "Entrada").save()
        new Category(name: "Principal").save()

        UserRole.withSession {
            it.flush()
            it.clear()
        }


    }
    def destroy = {
    }
}
