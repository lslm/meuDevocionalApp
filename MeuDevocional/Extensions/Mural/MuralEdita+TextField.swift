//
//  MuralEdita+TextField.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit


// MARK: Extension TextField
extension MuralEditaViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //essa funcao faz com que a tecla return do teclado faca o app aceitar a entrada e o teclado abaixe
    visualizacaoLabel.text = minhaNotaInput.text
    textField.resignFirstResponder()
    return true
    }
    
    //funcao criada para printar o limite de caracteres da palavra chave
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

           guard let text = textField.text else { return true }
        let length = text.count + string.count - range.length
           // create an Integer of 15 - the length of your TextField.text to count down
           //let count = 15 - length
            let count = length
           // set the .text property of your UILabel to the live created String
           limitText.text =  String(count) + "/100"
           // if you want to limit to 15 charakters
           // you need to return true and <= 15

           return length < 100
       }
}

