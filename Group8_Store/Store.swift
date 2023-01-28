//
//  Store.swift
//  Group8_Store
//
//

import Foundation
class Store {
    var items:[Item] = []
    
    func findByTitle(_ keyword:String) -> Item?{
        //if found return the item else return nil
        for item in items {
            if((item.title).contains(keyword)){
                return item
            }
        }
        return nil
    }
    func buy(_ customer:Customer, _ itemId: String) {
        var hasEnoughMoney = false
        var customerHasIt = false
        var pickedItem: Item = Item()
        for item in customer.itemsList{
            if itemId == item.id
            {
                customerHasIt = true
                
            }
        }
        for item in items{
            if item.id == itemId{
                hasEnoughMoney = customer.balance >= item.price
                pickedItem = item
            }
        }
        if (hasEnoughMoney && !customerHasIt){
            customer.balance -= pickedItem.price
            customer.itemsList.append( OwnedItem(minutesUsed: 0) )
            print("Purchase success!")
            pickedItem.printReceipt(isRefund: false, amount: pickedItem.price)
        }
        else{
            hasEnoughMoney == false ? print("You do not have enough balance to buy \(pickedItem.info)") : print("you already have \(pickedItem.info)")
        }
    }
    
    func issueRefund(_ customer:Customer, _ itemId: String){
        var pickedItem: Item = Item()
        var pickedItemIndex: Int = 0
        var refundable: Bool = false
        var customerHasIt = false
        for item in customer.itemsList{
            if itemId == item.id
            {
                refundable = item.minutesUsed < 30
                customerHasIt = true
            }
        }
        for item in items{
            if item.id == itemId{
                pickedItem = item
            }
        }
        if(refundable && customerHasIt){
            customer.balance += pickedItem.price
            pickedItem.printReceipt(isRefund: true, amount: pickedItem.price)
            customer.itemsList.remove(at: pickedItemIndex)
        }
        else{
            refundable == false ? print("Item: \(pickedItem.info) is not refundable as it has been used for more than 30 minutes") : print("you do not have Item: \(pickedItem.info)")
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

