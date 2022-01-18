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
    @IBOutlet weak var versicleLabel: UILabel!
    @IBOutlet weak var waitView: UIActivityIndicatorView!
    
    
    public func editaRapidas(devocional: Devocional,status: Bool){
            ///quando consegue carregar o conteúdo, esconte as empty states
            self.waitView.isHidden = true
            self.buttonEmpty.isHidden = true
            self.textEmpty.isHidden = true
            self.emptyImage.isHidden = true
            
            self.titleCard.isHidden = false
            self.textCard.isHidden = false
            self.versicleLabel.isHidden = false
            
            ///editando a celula
            titleCard.text = devocional.titulo
            textCard.text = devocional.refBiblica
            versicleLabel.text = devocional.introducao

    }
    public func editaEmpty(status: Bool){
        if status == false{
            self.buttonEmpty.layer.cornerRadius = 3
            self.buttonEmpty.isHidden = false
            self.textEmpty.isHidden = false
            self.emptyImage.isHidden = false
            self.waitView.isHidden = false
            
            self.waitView.startAnimating()

            
            self.titleCard.isHidden = true
            self.textCard.isHidden = true
            self.versicleLabel.isHidden = true
        }
    }
    
    public func stylize(){
        let newColor = UIColor(named: colors[Int.random(in: 0..<colors.count)])
        self.backgroundColor = newColor?.withAlphaComponent(0.3)
        self.layer.cornerRadius = 10
        self.titleCard.textColor = UIColor(named: "Accent")
        self.textCard.textColor = UIColor(named: "Accent")?.withAlphaComponent(0.7)
        self.versicleLabel.textColor = UIColor(named: "Accent")?.withAlphaComponent(0.7)
    }
}

//classe das celulas dos post its (em Mural)
class MyCollectionViewCell2: UICollectionViewCell{
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var nota: UILabel!
    @IBOutlet weak var data: UILabel!
    
    func setImage(image: String,color: String){
        if image != "postit1" &&
            image != "postit2" &&
            image != "postit3" &&
            image != "postit4"{
            
            let path = image
            let imageNew = UIImage(contentsOfFile: SalvarImagem.getFilePath(fileName: path))
            self.background.image = imageNew
            self.background.alpha = 0.6
            self.background.layer.cornerRadius = 10
            self.background.contentMode = .scaleAspectFill
            self.nota.backgroundColor = UIColor(named: color)
        }
        else{
            self.background.image = UIImage(named: image)
            self.background.alpha = 1
            self.nota.backgroundColor = .clear
        }
    }
}
