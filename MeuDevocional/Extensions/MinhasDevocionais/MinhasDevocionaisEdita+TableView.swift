//
//  MinhaDevocional+TableView.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit

// MARK: Extensions table view
extension MinhaDevocionalEditaViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///clique na celula
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadInputViews()
    }
}

extension MinhaDevocionalEditaViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! MyTableViewCell
        cell.textFieldCell.placeholder = inputLista[indexPath.row]
        ///Se for a edicao de uma devocional ja criada, as celulas vao mostrar o que ja esta armazenado no banco de dados
        if inputLista[indexPath.row] == "Título"{
            cell.textFieldCell.text = devocional.titulo!
            cell.label.isHidden = true
            cell.textFieldCell.maxLength = 40
        }
        else if inputLista[indexPath.row] == "Livro"{
            cell.textFieldCell.text = devocional.livro!
            cell.textFieldCell.maxLength = 20
            cell.label.isHidden = true
        }
        else if inputLista[indexPath.row] == "Capítulo"{
            cell.textFieldCell.text = devocional.capitulo!
            cell.textFieldCell.maxLength = 20
            cell.label.isHidden = true
        }
        else if inputLista[indexPath.row] == "Versículo"{
            cell.textFieldCell.text = devocional.versiculo!
            cell.textFieldCell.maxLength = 30
            cell.label.isHidden = true
        }
        else if inputLista[indexPath.row] == "Palavra chave 1"{
            cell.textFieldCell.text = devocional.aplicacao1!
            ///definindo uma quanrtidade máxima de letras
            cell.textFieldCell.maxLength = 15
        }
        else if inputLista[indexPath.row] == "Palavra chave 2"{
            cell.textFieldCell.text = devocional.aplicacao2!
            ///definindo uma quanrtidade máxima de letras
            cell.textFieldCell.maxLength = 15
        }
        else if inputLista[indexPath.row] == "Palavra chave 3"{
            cell.textFieldCell.text = devocional.aplicacao3!
            ///definindo uma quanrtidade máxima de letras
            cell.textFieldCell.maxLength = 15
        }
        
        cell.textFieldCell.resignFirstResponder()
        cell.textFieldCell.returnKeyType = .done
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
}
