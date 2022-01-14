//
//  DataManager.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 14/01/22.
//

import Foundation
import UIKit

class DataManager {
    public static var shared: DataManager = DataManager()
    let baseURL: String = "https://meudevocional.herokuapp.com"
    let dataURL: String = "/devocionais"
    var devocionaisRapidas: [Devocional]?
    var isConect = false
    
    // MARK: - Load Data
    public func loadData(_ completion: @escaping (()->Void)) {
        let session: URLSession = URLSession.shared
        let url: URL = URL(string: baseURL + dataURL)!
        
        // resposta vem no data (json), error vem no error
        let task = session.dataTask(with: url) { data, _, error in
            guard let data = data else {return}
            if error != nil {
                print(String(describing: error?.localizedDescription))
            }
            
            do {
                let devocionaisRapidas = try JSONDecoder().decode([Devocional].self, from: data)
                self.devocionaisRapidas = devocionaisRapidas
                self.isConect = true
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                // FIXME: tratar o erro do decoder
                self.isConect = false
                print("Nao foi possivel fazer o parse")
            }
        }
        task.resume()
    }
}
