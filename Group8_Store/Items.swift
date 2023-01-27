import Foundation

class Item {
    var id:String = ""
    var title: String = ""
    var price: Double = 0.0
}

class Movie:Item {
    var runningTime:Int = 0
}
class Game:Item {
    var isMultiplayer:Bool = false
}
class OwnedItem:Item {
    var minutesUsed:Int = 0
    
    init(minutesUsed: Int) {
        self.minutesUsed = minutesUsed
    }
}
