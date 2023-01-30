//
//  Item.swift
//  Group8_Store
//
//


import Foundation

protocol isPurchaseable {
    var info :String {get}
    func printReceipt(isRefund: Bool, amount:Double)
}
class Item {
    var id:Int = 0
    var title: String = ""
    var price: Double = 0.0
    var info:String {
        return " Title: \(title), Price: $\(price)"
    }
    init(id: Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
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
    init(id: Int, title: String, price: Double,runningTime: Int) {
        super.init(id: id, title: title, price: price)
        self.runningTime = runningTime
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
    
    init(id: Int, title: String, price: Double,isMultiplayer: Bool, publisher: String) {
        self.isMultiplayer = isMultiplayer
        self.publisher = publisher
        super.init(id: id, title: title, price: price)

    }
}


class OwnedItem:Item {
    var minutesUsed:Int = 0
    
    init(id: Int, title: String, price: Double,minutesUsed: Int) {
        super.init(id: id, title: title, price: price)
        self.minutesUsed = minutesUsed
    }
}
