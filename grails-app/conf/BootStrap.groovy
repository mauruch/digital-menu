import com.digitalmenu.Category
import com.digitalmenu.Food
import com.digitalmenu.Menu
import com.digitalmenu.PaymentMethods
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

        def ravioles = new Food(name: "Ravioles de verdura", price: 299, category: main, description: "salsa fileto", isAvailable: true, isGlutenFree: false, isVegetarian: true)
        ravioles.save()

        def tortilla = new Food(name: "Tortilla de papa", price: 299, category: starter, isAvailable: true, isGlutenFree: true, isVegetarian: true)
        tortilla.save()

        def milaTernera = new Food(name: "Milanesa de ternera", price: 299, category: main, description: "frita o al horno", isAvailable: true, isGlutenFree: false, isVegetarian: false)
        milaTernera.save()

        new Food(name: "Milanesa de pollo", price: 250, category: main, description: "frita o al horno", isAvailable: true, isGlutenFree: false, isVegetarian: false).save()
        def gaseosa = new Food(name: "Gaseosa", price: 80, category: drink, description: "light o regular | línea pepsi", isAvailable: true, isGlutenFree: true, isVegetarian: true)
        gaseosa.save()
        new Food(name: "Agua", price: 80, category: drink, description: "con o sin gas", isAvailable: true, isGlutenFree: true, isVegetarian: true).save()
        def vino = new Food(name: "Vino", price: 99, category: drink, description: "una copa", isAvailable: true, isGlutenFree: true, isVegetarian: true)
        vino.save()
        new Food(name: "Ñoquis", price: 199, category: main, description: "salsa fileto", isAvailable: true, isGlutenFree: false, isVegetarian: true).save()
        def sopa = new Food(name: "Sopa", price: 110, category: starter, description: "calabaza", isAvailable: true, isGlutenFree: true, isVegetarian: true)
        sopa.save()
        def flan = new Food(name: "Flan", price: 150, category: dessert, isAvailable: true, isGlutenFree: true, isVegetarian: true)
        flan.save()
        def frutas= new Food(name: "Ensalada de frutas", price: 150, description: "frutas de estacíon", category: dessert, isAvailable: true, isGlutenFree: true, isVegetarian: true)
        frutas.save()

        def menu1 = new Menu(name: "pastas", price: 330, starter: sopa, mainDish: ravioles, dessert: frutas, drink: vino)
        menu1.save()

        def menu2 = new Menu(name: "Martes de milansea", price: 350, starter: tortilla, mainDish: milaTernera, dessert: flan, drink: gaseosa)
        menu2.save()


        def payment = new PaymentMethods(paymentMethods: "Visa crédito y débito", promotions: "10% off abonando en efectivo")
        payment.save()


        UserRole.withSession {
            it.flush()
            it.clear()
        }


    }
    def destroy = {
    }
}
