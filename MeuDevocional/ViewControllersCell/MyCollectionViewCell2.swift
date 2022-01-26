//
//  MyCollectionViewCell2.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 24/01/22.
//

import UIKit


//classe das celulas dos post its (em Mural)
class MyCollectionViewCell2: UICollectionViewCell{
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var nota: UILabel!
    @IBOutlet weak var data: UILabel!
    
    func setImage(image: String,color: String){
        if image == "postit1"{
            self.backgroundColor = UIColor(named: "Verde2")
            self.setDefault()
        }
        else if image == "postit2"{
            self.backgroundColor = UIColor(named: "Amarelo1")
            self.setDefault()
        }
        else if image == "postit3"{
            self.backgroundColor = UIColor(named: "Amarelo2")
            self.setDefault()
        }
        else if image == "postit4"{
            self.backgroundColor = UIColor(named: "Amarelo3")
            self.setDefault()
        }
        else if image == "novopost" || image == "base1" || image == "base2"{
            self.background.image = UIImage(named: image)
            self.backgroundColor = .clear
            self.background.alpha = 1
        }
        else{
            let path = image
            let imageNew = UIImage(contentsOfFile: SalvarImagem.getFilePath(fileName: path))
            self.background.image = imageNew
            self.background.alpha = 0.6
            self.background.layer.cornerRadius = 10
            self.background.contentMode = .scaleAspectFill
            self.nota.backgroundColor = UIColor(named: color)
            self.data.backgroundColor = UIColor(named: color)
            self.backgroundColor = .clear
        }
    }
    
    func setDefault(){
        self.background.image = nil
        self.background.alpha = 1
        self.nota.backgroundColor = .clear
        self.data.backgroundColor = .clear
    }
}
