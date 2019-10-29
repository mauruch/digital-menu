import com.digitalmenu.Category
import com.digitalmenu.Food
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

        def drink = new Category(name: "Bebida", code: "DRI")
        def dessert = new Category(name: "Postre", code: "D")
        def starter = new Category(name: "Entrada", code:"S")
        def main = new Category(name: "Principal", code:"M")

        drink.save()
        dessert.save()
        starter.save()
        main.save()

        new Food(name: "Milanesa de ternera", price: 299, category: main, description: "frita o al horno", isAvailable: true, isGlutenFree: false, isVegetarian: false).save()
        new Food(name: "Milanesa de pollo", price: 250, category: main, description: "frita o al horno", isAvailable: true, isGlutenFree: false, isVegetarian: false).save()
        new Food(name: "Pepsi", price: 80, category: drink, description: "light o regular", isAvailable: true, isGlutenFree: true, isVegetarian: true).save()
        new Food(name: "Agua", price: 80, category: drink, description: "con o sin gas", isAvailable: true, isGlutenFree: true, isVegetarian: true).save()
        new Food(name: "Ñoquis", price: 199, category: main, description: "salsa fileto", isAvailable: true, isGlutenFree: false, isVegetarian: true).save()
        new Food(name: "Sopa", price: 110, category: starter, description: "calabaza", isAvailable: true, isGlutenFree: true, isVegetarian: true).save()
        new Food(name: "Flan", price: 150, category: dessert, isAvailable: true, isGlutenFree: true, isVegetarian: true).save()

        UserRole.withSession {
            it.flush()
            it.clear()
        }


    }
    def destroy = {
    }
}
