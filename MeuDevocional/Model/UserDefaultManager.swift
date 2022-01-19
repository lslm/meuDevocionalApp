//
//  UserDefaultManager.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 19/01/22.
//

import Foundation

///classe utilizada para guardar o motivo de gratidao utilizado
class UserDefaultsManager{
    static let shared = UserDefaultsManager()
    var gratidao: String?{
        didSet{
            UserDefaults(suiteName: "group.MeuDevocional")?.set(gratidao, forKey: "gratidao")
        }
    }
    var background: String?{
        didSet{
            UserDefaults(suiteName: "group.MeuDevocional")?.set(background, forKey: "background")
        }
    }
    private init(){
        self.gratidao = UserDefaults(suiteName: "group.MeuDevocional")?.object(forKey: "gratidao") as? String
        self.background = UserDefaults(suiteName: "group.MeuDevocional")?.object(forKey: "background") as? String
    }
}
