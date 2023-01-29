import Foundation

func searchItems(_ searchArray:[Item]) {
    if(searchArray.isEmpty){
        print("No items found with keyword: \(keyword)")
    }else {
        for item in searchArray{
            print("Item found: \(item.title)")
        }
    }
}
//1. Creating a customer
var customer = Customer(balance: 10.0, itemsList: [])
//2. Creating a variety of movies and games
// movies
var movie1 = Movie(id: 0, title: "Spiderman: No way home", price: 10.0, runningTime: 148)
var movie2 = Movie(id: 1, title: "Thor: Love and thunder", price: 15.0, runningTime: 119)
// games
var game1 = Game(id: 2, title: "Call of Duty: Modern Warfare 2", price: 60.0, isMultiplayer: true, publisher: "Activision")
var game2 = Game(id: 3, title: "Witcher 3: The wild hunt", price: 15.0, isMultiplayer: false, publisher: "CD Projekt Red")

//3. Create a store and add movies and games to it
var store = Store(items: [game1,game2,movie1,movie2])

//4. Searching for an item that exists
var keyword = "Call of Duty"
var searchedItems:[Item] = store.findByTitle(keyword)!
print("4. Searching for an item that exists")
searchItems(searchedItems)

//5. Searching for an item that does not exist
keyword = "Hello World"
searchedItems = store.findByTitle(keyword)!
print("5. Searching for an item that does not exist")
searchItems(searchedItems)

//6. Trying to purchase an item the customer cannot afford
print("6. Trying to purchase an item the customer cannot afford")
store.buy(customer, store.items[0].id)
//7. Reloading the customer’s gift card so they have sufficient funds
print("7. Reloading the customer’s gift card so they have sufficient funds")
customer.reloadAmount(100.0)
//8. Trying to purchase the same item again (now, they should be able to afford it)
print("8. Trying to purchase the same item again (now, they should be able to afford it)")
store.buy(customer, store.items[0].id)
//9. Purchasing an item that the customer does not own
print("9. Purchasing an item that the customer does not own")
store.buy(customer, store.items[1].id)
//10. Purchasing an item customer already owns
print("10. Purchasing an item customer already owns")
store.buy(customer, store.items[1].id)
//11. Using one of the items for more than 30 minutes
print("11. Using one of the items for more than 30 minutes")
customer.useItem(customer.itemsList[0].id, 35)
// 12. Trying to refund an item that does NOT the refund policy requirements
print("12. Trying to refund an item that does NOT meet the refund policy requirements")
store.issueRefund(customer, customer.itemsList[0].id)
// 13. Refunding an item that DOES meet the refund policy requirements

store.issueRefund(customer, customer.itemsList[1].id)




