import UIKit

public class Collection{
    var items: [CollectionItem] //lista de funkos do dono da colecao
    
    public init(){
        items = [] //lista esta vazia quando instanciada a colecao
    }
    public func add(item: CollectionItem){
        items.append(item)
    }
    /// Here, we encode all the attributes
    /// transform into a data information, saved under a Key
    func encode(with aCoder: NSCoder) {
        aCoder.encode(items, forKey: "items")
    }
    
    /// Retrieve the Data form and turn into a CustomObject
    required convenience init?(coder aDecoder: NSCoder) {
        _ = aDecoder.decodeObject(forKey: "items") as! [Collection]
        self.init()
    }
}
