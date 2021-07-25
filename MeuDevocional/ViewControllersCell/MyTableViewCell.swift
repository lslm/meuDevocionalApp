//
//  MyTableViewCell.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 20/07/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    //configurando o textField
    @IBOutlet weak var textFieldCell: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textFieldCell.translatesAutoresizingMaskIntoConstraints = false
        textFieldCell.frame = bounds
        textFieldCell.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension MyTableViewCell: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //essa funcao faz com que a tecla return do teclado faca o app aceitar a entrada e o teclado abaixe
    textFieldCell.resignFirstResponder()
    textFieldCell.returnKeyType = .done
    textFieldCell.autocapitalizationType = .words
    textFieldCell.frame = bounds
    return true
    }
}
