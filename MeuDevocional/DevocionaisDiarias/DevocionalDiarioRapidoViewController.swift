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
    @IBOutlet weak var contextualizacaoLabel: UILabel?
    @IBOutlet weak var reflexaoLabel: UILabel?
    
    @IBOutlet weak var musicButton: UIButton!
    
    var versiculo = ""
    var musica = ""
    var introducao = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contextualizacaoLabel?.textColor = .label
        self.reflexaoLabel?.textColor = .label
        editButton(button: musicButton)
        content()
    }
    
    
    @IBAction func newDevocionalButton(_ sender: Any) {
    }
    
    // MARK: Prepare (edicao e devocional)
    ///funcao que ira gerar o modal para a criacao da nova colecction
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ///adiciona o card que sera apenas editado na proxima view...
        let _ = try? CoreDataStack.createDevocional(titulo: self.titleLabel?.text ?? "",
                                                    baseBiblica: self.versiculo,
                                                    contextualizacao: "",
                                                    reflexao: self.introducao,
                                                    conclusao: "",
                                                    aplicacao1: "",
                                                    aplicacao2: "",
                                                    aplicacao3: "",
                                                    backgroundColor: "1",
                                                    backgroundImage: "crie2",
                                                    link: self.musica,
                                                    livro: self.versiculo,
                                                    capitulo: "",
                                                    versiculo: "",
                                                    data: "")
        
        let vc = segue.destination as! MinhaDevocional3ViewController
        let index = try? CoreDataStack.getDevocional().count
        vc.edit = true
        vc.rapida = true 
        vc.indice = (index ?? 1) - 1
   }
    
    @IBAction func openMusic(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "music") as?
                    DevocionalMusicViewController {
            vc.recebe  = devocional!.musica
            navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    
    func content(){
        self.titleLabel?.text = devocional?.titulo
        let parte1 =  devocional!.introducao
        let parte2 = devocional!.refBiblica
        self.refBiblicaLabel?.text =  "\(parte1) - \(parte2)"
        self.contextualizacaoLabel?.text = devocional?.desenvolvimento
        self.reflexaoLabel?.text = devocional?.conclusao
        
        self.versiculo = devocional!.refBiblica
        self.introducao = devocional!.desenvolvimento
        self.musica = devocional!.musica
        
    }
    
    /// altera o visual do botao de play
    func editButton(button:UIButton){
        button.layer.backgroundColor = nil
        button.layer.cornerRadius = 1
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 2
        button.layer.shadowRadius = 3
        button.layer.masksToBounds = false
    }
    
}
