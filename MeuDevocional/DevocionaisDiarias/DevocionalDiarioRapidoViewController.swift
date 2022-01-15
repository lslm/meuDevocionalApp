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
    
    
    @IBAction func newDevocionalButton(_ sender: Any) {
    }
    
    // MARK: Prepare (edicao e devocional)
    ///funcao que ira gerar o modal para a criacao da nova colecction
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ///adiciona o card que sera apenas editado na proxima view...
        let _ = try? CoreDataStack.createDevocional(titulo: self.titleLabel?.text ?? "",
                                                    baseBiblica: "",
                                                    contextualizacao: "",
                                                    reflexao: "",
                                                    conclusao: "",
                                                    aplicacao1: "",
                                                    aplicacao2: "",
                                                    aplicacao3: "",
                                                    backgroundColor: "1",
                                                    backgroundImage: "crie2",
                                                    link: "",livro: "",
                                                    capitulo: "",
                                                    versiculo: "",
                                                    data: "")
        
        let vc = segue.destination as! MinhaDevocional3ViewController
        let index = try? CoreDataStack.getDevocional().count
        vc.edit = true
        vc.indice = (index ?? 1) - 1
   }
    
    func content(){
        self.titleLabel?.text = devocional?.titulo
        self.refBiblicaLabel?.text = devocional?.refBiblica
    }
}
