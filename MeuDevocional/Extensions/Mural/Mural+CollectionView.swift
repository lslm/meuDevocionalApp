//
//  Mural+CollectionView.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit


// MARK: Collection View
extension MuralViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //retorna a quantidade de PostIts presentes no meu CoreData
        let post = CoreDataStackPost.shared.getPost()
        if post.count == 0{
            //se nada foi adicionado no banco de dados, vai mostrar a dataBase disponibilizada no app
            return meuMural.count
        }
        return post.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MyCollectionViewCell2 = muralCollection.dequeueReusableCell(withReuseIdentifier: "cell5", for: indexPath) as! MyCollectionViewCell2
        let post = CoreDataStackPost.shared.getPost()
        //se nao houver nenhuma adicao no banco de dados, mostra os dados base do App
        if post.count == 0{
            cell.nota.text = meuMural[indexPath.row].nota
            cell.background.image = meuMural[indexPath.row].backgroundImage
            cell.data.text = ""
            return cell
        }
        //caso haja valores no banco de dados, mostra os dados do Banco de dados
        cell.nota.text = post[indexPath.row].nota
        cell.data.text = post[indexPath.row].data
        cell.setImage(image: post[indexPath.row].backgroundImage ?? "postit1",color:  post[indexPath.row].color ?? "Verde2")
        changeTextColor(cell: cell, color:  post[indexPath.row].color ?? "semCor")
        cell.layer.cornerRadius = 15
        
        return cell
    }
    func changeTextColor(cell: MyCollectionViewCell2, color: String){
        cell.nota.font = UIFont(name:"Helvetica-Bold",size:17)
        
        if cell.background.image == UIImage(named: "postit1") || color == "Verde2"{
            cell.nota.textColor = .white
            cell.data.textColor = .white
        }
        else if cell.background.image == UIImage(named: "postit2") || color == "Amarelo1"{
            cell.nota.textColor = .white
            cell.data.textColor = .white
        }
        else if cell.background.image == UIImage(named: "postit3") || color == "Amarelo2"{
            cell.nota.textColor = verde
            cell.data.textColor = verde
        }
        else if cell.background.image == UIImage(named: "postit4") || color == "Amarelo3"{
            cell.nota.textColor = amarelo
            cell.data.textColor = amarelo
        }
    }
    
}

extension MuralViewController: UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataPost1 = CoreDataStackPost.shared.getPost()
        if dataPost1.count != 0{
            let ac = UIAlertController(title:"Meu motivo", message: dataPost1[indexPath.row].nota, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                    [weak self] action in
                    self?.muralCollection.reloadData()
            }))
            present(ac, animated: true)
        }
        
        muralCollection.reloadData()
    }
}

