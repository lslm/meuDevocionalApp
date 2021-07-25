//
//  MyCollectionViewCell.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 15/07/21.
//

import UIKit

//classe das celulas das devocionais
class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleCard: UILabel!
    @IBOutlet weak var textCard: UILabel!
    
    
    //celulas personalizadas
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myReference: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    
    //palavras-chave
    
    @IBOutlet weak var pc1: UILabel!
    @IBOutlet weak var pc2: UILabel!
    @IBOutlet weak var pc3: UILabel!
}

//classe das celulas dos post its (em Mural)
class MyCollectionViewCell2: UICollectionViewCell{
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var nota: UILabel!
}
