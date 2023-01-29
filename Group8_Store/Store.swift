//
//  Store.swift
//  Group8_Store
//
//

import Foundation
class Store {
    var items:[Item] = []
    init(items: [Item]) {
        self.items = items
    }
    
    func findByTitle(_ keyword:String) -> [Item]?{
        //if found return the item else return nil
        var searchedItems:[Item] = []
        
        for item in items {
            if((item.title).contains(keyword)){
                searchedItems.append(item)
            }
            return searchedItems
        }
        return nil
    }
    
    
    func buy(_ customer:Customer, _ itemId: Int) {
        var hasEnoughMoney = false
        var customerHasIt = false
        for item in customer.itemsList{
            if itemId == item.id
            {
                customerHasIt = true

            }
        }
        for item in items{
            if item.id == itemId{
                hasEnoughMoney = customer.balance >= item.price
                if (hasEnoughMoney && !customerHasIt){
                    customer.balance -= item.price
                    customer.itemsList.append( OwnedItem(id: item.id, title: item.title, price: item.price, minutesUsed: 0) )
                    print("Purchase success!")
                    item.printReceipt(isRefund: false, amount: item.price)
                }
                else{
                    hasEnoughMoney == false ? print("You do not have enough balance to buy \(item.title)") : print("you already have \(item.title)")
                }
            }
        }
        
    }

        func issueRefund(_ customer:Customer, _ itemId: Int){
            var refundable: Bool = false
            var customerHasIt = false
            for (i, item) in customer.itemsList.enumerated(){
                if itemId == item.id
                {
                    refundable = item.minutesUsed < 30
                    customerHasIt = true
                    if(refundable && customerHasIt){
                        customer.balance += item.price
                        item.printReceipt(isRefund: true, amount: item.price)
                        customer.itemsList.remove(at: i)
                    }
                    else{
                        print("Item: \(item.title) is not refundable as it has been used for more than 30 minutes")
                    }
                    
                }
            }

        }
        
        func findByTitle(_ keyword:String){
            for item in items{
                if(item.title.lowercased().contains(keyword.lowercased())){
                    print("" + item.info)
                }
                else{
                    print("Sorry, no matching games found")
                }
            }
        }
    }
    


