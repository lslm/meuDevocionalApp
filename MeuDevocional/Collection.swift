//colecao de itens de devocionais

import UIKit

public class Collection{
    public var categoria: String
    var items: [CollectionItem] //lista de funkos do dono da colecao
    
    public init(categoria: String){
        self.categoria = categoria
        items = [] //lista esta vazia quando instanciada a colecao
    }
    
    public func add(item: CollectionItem){
        items.append(item) //adicionando na lista o item
    }
}
