//
//  DevocionaisDiarios+CollectionView.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit

extension DevocionalDiarioViewController: UICollectionViewDataSource{
    /// configuracao da collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /// retorna a quantidade de itens da colectionView
        if collectionView == cotidiano{
            return self.capaCotidiano.count
        }
        else if collectionView == vida {
            return self.capaVida.count
        }
        else if collectionView == rapidas{
            return devocionaisRapidas?.count ?? 1
        }
        
        return self.capaEstudos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cotidiano{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
            self.editaCelulaDev(cell: cell, array: capaCotidiano, index: indexPath.row,tit: titCotidiano,referencia: refCotidiano)
            return cell
        }
        else if collectionView == vida{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath as IndexPath) as! MyCollectionViewCell
            self.editaCelulaDev(cell: cell, array: capaVida, index: indexPath.row,tit: titVida,referencia: refVida)
            return cell
        }
        else if collectionView == rapidas{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier0, for: indexPath as IndexPath) as! MyCollectionViewCell
            if (self.devocionaisRapidas != nil){
                cell.editaRapidas(devocional: (self.devocionaisRapidas?[indexPath.row])!,status: self.isConect)
            }
            else{
                cell.editaEmpty(status: self.isConect)
            }
            cell.stylize()
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier3, for: indexPath as IndexPath) as! MyCollectionViewCell
            self.editaCelulaDev(cell: cell, array: capaEstudos, index: indexPath.row,tit: titEstudos,referencia: refEstudos)
            return cell
        }
    }
    
    /// funcao para editar a celula devocional
    func editaCelulaDev(cell: MyCollectionViewCell,array: [String],index: Int,tit:[String],referencia: [String]){
        cell.image.image = UIImage(named: array[index])
        cell.titleCard.text = tit[index]
        cell.textCard.text = referencia[index]
        cell.titleCard.textColor = verde3
        cell.textCard.textColor = verde3
        cell.layer.cornerRadius = 15
    }
    
}

