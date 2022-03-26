//
//  MinhaDevocional+TextField.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit

// MARK: Extensions Text view
///extensao criada para a configuracao da textField que apresentara um texto default para o usuario
extension MinhaDevocionalEditaViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if reflexaoView.textColor == UIColor.lightGray {
            reflexaoView.text = ""
            reflexaoView.textColor = .label
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if reflexaoView.text == "" {
            reflexaoView.text = "Comece a escrever ..."
            reflexaoView.textColor = UIColor.lightGray
        }
    }
}


