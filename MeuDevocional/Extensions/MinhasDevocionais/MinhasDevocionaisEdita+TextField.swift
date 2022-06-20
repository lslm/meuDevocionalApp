//
//  MinhasDevocionais+TextField.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit

extension MinhaDevocionalEditaViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    ///essa funcao faz com que a tecla return do teclado faca o app aceitar a entrada e o teclado abaixe
        textField.autocapitalizationType = .words
        textField.resignFirstResponder()
        
        ///confere se o link está correto
        let isValidateLink = self.validation.validateYoutube(name: linkTextField.text!)
        let isValidateLink2 = self.validation.validateSpotify(name: linkTextField.text!)
        if (isValidateLink == false) && (isValidateLink2 == false){
          alertLink()
        }
        //armazena o link certo ou vazio. Se estiver vazio irá mostrar uma playlist Default
        devocional.link = linkTextField.text!
        
        return true
    }
}
