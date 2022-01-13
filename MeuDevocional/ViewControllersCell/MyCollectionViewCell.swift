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
    
    //data
    @IBOutlet weak var data: UILabel!
    
    
    //empty-view para conexoes
    @IBOutlet weak var buttonEmpty: UIButton!
    @IBOutlet weak var textEmpty: UILabel!
    @IBOutlet weak var emptyImage: UIImageView!
    
    
    public func editaRapidas(titulo: String,status: Bool){
        if status == false{
            self.buttonEmpty.layer.cornerRadius = 5
            self.buttonEmpty.isHidden = false
            self.textEmpty.isHidden = false
            self.emptyImage.isHidden = false
            self.titleCard.isHidden = true
            self.textCard.isHidden = true
        }
        else{
            ///quando consegue carregar o conteúdo, esconte as empty states
            self.buttonEmpty.isHidden = true
            self.textEmpty.isHidden = true
            self.emptyImage.isHidden = true
            
            self.titleCard.isHidden = false
            self.textCard.isHidden = false

        }
    }
    
    public func stylize(){
        self.backgroundColor = UIColor(named: colors[Int.random(in: 0..<colors.count)])?.withAlphaComponent(0.3)
        self.layer.cornerRadius = 10
    }
}

//classe das celulas dos post its (em Mural)
class MyCollectionViewCell2: UICollectionViewCell{
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var nota: UILabel!
    @IBOutlet weak var data: UILabel!
}
