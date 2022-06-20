//
//  DevocionaisDiariosEstudos+TextView.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit

extension DevocionalDiarioEstudoViewController: UITextViewDelegate{
    func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
       textField.resignFirstResponder()
       return true;
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if anotacoesPessoais.textColor == UIColor.lightGray {
            anotacoesPessoais.text = ""
            anotacoesPessoais.textColor = .label
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if anotacoesPessoais.text == "" {
            anotacoesPessoais.text = "Comece a escrever ..."
            anotacoesPessoais.textColor = UIColor.lightGray
        }
    }
}
