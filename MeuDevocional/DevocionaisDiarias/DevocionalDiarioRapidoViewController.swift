//
//  DevocionalDiarioRapidoViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 14/01/22.
//

import UIKit

class DevocionalDiarioRapidoViewController: UIViewController {
    var devocional: Devocional?
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var refBiblicaLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content()
    }
    
    func content(){
        self.titleLabel?.text = devocional?.titulo
        self.refBiblicaLabel?.text = devocional?.refBiblica
    }
}
