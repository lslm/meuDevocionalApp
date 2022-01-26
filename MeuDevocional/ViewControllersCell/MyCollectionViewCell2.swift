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
            self.background.alpha = 1
            self.data.backgroundColor = .clear
        }
        else if image == "postit2"{
            self.backgroundColor = UIColor(named: "Amarelo1")
            self.background.alpha = 1
            self.data.backgroundColor = .clear
        }
        else if image == "postit3"{
            self.backgroundColor = UIColor(named: "Amarelo2")
            self.background.alpha = 1
            self.data.backgroundColor = .clear
        }
        else if image == "postit4"{
            self.backgroundColor = UIColor(named: "Amarelo3")
            self.background.alpha = 1
            self.data.backgroundColor = .clear
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
        }
    }
}
