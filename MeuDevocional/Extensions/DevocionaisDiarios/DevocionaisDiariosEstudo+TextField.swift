//
//  DevocionaisDiariosEstudo+TextField.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit

// MARK: Extension Text Field
extension DevocionalDiarioEstudoViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ///essa funcao faz com que a tecla return do teclado faca o app aceitar a entrada e o teclado abaixe
        textField.resignFirstResponder()
        return true
    }
}

