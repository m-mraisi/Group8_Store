//
//  Store.swift
//  Group8_Store
//
//  Created by jacob on 2023-01-27.
//

import Foundation


class Store {
    var items:[Item] = []
    
    func findByTitle(_keyword:String) -> Item?{
        //if found return the item else return nil
        for item in items {
            if((item.title).contains(_keyword)){
                return item
            }
        }
        return nil
    }
    func buy(_customer:Customer, _itemId: String) {
        
    }
    
    func issueRefund(_customer:Customer, _itemId: String){
        
    }
}
