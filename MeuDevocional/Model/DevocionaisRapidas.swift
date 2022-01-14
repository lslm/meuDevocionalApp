//
//  DevocionaisRapidas.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 14/01/22.
//

import Foundation


struct Devocional: Codable{
    var id: Int
    var titulo: String
    var refBiblica: String
    var introducao: String
    var desenvolvimento: String
    var conclusao: String
    var musica: String
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case titulo = "titulo"
        case refBiblica = "refBiblica"
        case introducao =  "introducao"
        case desenvolvimento = "desenvolvimento"
        case conclusao = "conclusao"
        case musica = "musica"
    }
}

extension Devocional: CustomStringConvertible {
    var description: String {
        return "{id: \(id),refBiblica:\(refBiblica), introducao: \(introducao), titulo: \(titulo), desenvolvimento: \(desenvolvimento), conclusao: \(conclusao)}"
    }
}

