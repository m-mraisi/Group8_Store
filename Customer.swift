//
//  Customer.swift
//  Group8_Store

import Foundation
class Customer {
    var balance: Double
    var itemsList: [OwnedItem]
    
    init(){
        self.balance = 10.0
        self.itemsList = []
    }
    
    init(balance: Double, itemsList: [OwnedItem]) {
        self.balance = balance
        self.itemsList = itemsList
    }
    
    func reloadAmount( _ amount: Double) {
        self.balance = self.balance + amount
        print("Successfully reloaded gift card!")
        print("Current Balance: $\(self.balance)")
    }
    
    func useItem (_ id:Int, _ minutes:Int) {
        //find id where it matches
        for item in self.itemsList {
            if(item.id == id) {
                item.minutesUsed = item.minutesUsed + minutes
                print("Used item: \(item.title)")
                print("Minutes: \(minutes)")
                print("Total Minutes used: \(item.minutesUsed)")
            }
        }
    }
}

