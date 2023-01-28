//
//  Customer.swift
//  Group8_Store

import Foundation
class Customer {
    var balance: Double = 10.0
    var itemsList: [OwnedItem] = []
    
    init(balance: Double, itemsList: [OwnedItem]) {
        self.balance = balance
        self.itemsList = itemsList
    }
    
    func reloadAmount( _ amount: Double) {
        self.balance = self.balance + amount
    }
    
    func useItem (_ id:String, _ minutes:Int) {
        //find id where it matches
        for item in self.itemsList {
            if(item.id == id) {
                item.minutesUsed = item.minutesUsed + minutes
            }
        }
    }
}

