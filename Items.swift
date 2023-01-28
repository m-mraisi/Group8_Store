//
//  Items.swift
//  Group8_Store
//

import Foundation
class Item {
    var id:String = ""
    var title: String = ""
    var price: Double = 0.0
    var info:String {
        return " Title: \(title), Price: $\(price)"
    }
    
    func printReceipt(isRefund: Bool, amount:Double){
        if(isRefund){
            print("""
                  -------------------------
                  YOUR RECEIPT
                  -------------------------
                  We are refunding the purchase of Heroes: \(self.title)
                  Refund amount: $\(self.price)
                  """)
        }
        else{
            print("""
                  -------------------------
                  YOUR RECEIPT
                  -------------------------
                  Thank you for purchasing Heroes: \(self.title)
                  Purchase amount: $\(self.price)
                  """)
        }
    }
}

class Movie:Item {
    var runningTime:Int = 0
    override var info: String {
        return  """
            [MOVIE] \(super.info)
            RunningTime: \(runningTime)
            """
    }
}

class Game:Item {
    var isMultiplayer:Bool = false
    var publisher:String = ""
    override var info: String {
        return  """
            [GAME] \(super.info)
            Publisher: \(publisher)
            IsMultiplayer: \(isMultiplayer)
            """
    }
    init(isMultiplayer: Bool, publisher: String) {
        self.isMultiplayer = isMultiplayer
        self.publisher = publisher
    }
}


class OwnedItem:Item {
    var minutesUsed:Int = 0
    
    init(minutesUsed: Int) {
        self.minutesUsed = minutesUsed
    }
}
