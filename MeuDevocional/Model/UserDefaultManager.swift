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
    var gratidao: [String]?{
        didSet{
            UserDefaults(suiteName: "group.com.biaduque.MeuDevocional")?.set(gratidao, forKey: "gratidao")
        }
    }
    var background: [String]?{
        didSet{
            UserDefaults(suiteName: "group.com.biaduque.MeuDevocional")?.set(background, forKey: "background")
        }
    }
    private init(){
        self.gratidao = UserDefaults(suiteName: "group.com.biaduque.MeuDevocional")?.stringArray(forKey: "gratidao")
        self.background = UserDefaults(suiteName: "group.com.biaduque.MeuDevocional")?.stringArray(forKey: "background")
    }
}
