//
//  MuralEdita+ImagePicker.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit


extension MuralEditaViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.visualizacao.image = image
        self.visualizacao.alpha = 0.6
        dataPost.last?.backgroundImage = SalvarImagem.saveToFiles(image: self.visualizacao.image)
    }
}
