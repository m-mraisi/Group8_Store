//
//  Customer.swift
//  Group8_Store
//
//  Created by jacob on 2023-01-27.
//

import Foundation
class Customer {
    var balance: Double = 0.0
    var itemsList: [OwnedItem] = []
    
    func reloadAmount( _amt: Double) {
        self.balance = self.balance + _amt
    }
    
    func useItem (_id:String, _minutes:Int) {
        //find id where it matches
        for item in self.itemsList {
            if(item.id == _id) {
                item.minutesUsed = item.minutesUsed + _minutes
            }
        }
    }
}
Footer
© 2023 GitHub, Inc.
Footer navigation
