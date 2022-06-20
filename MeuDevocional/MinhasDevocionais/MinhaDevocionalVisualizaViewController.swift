//
//  MinhaDevocional2ViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 16/07/21.
//

import UIKit



class MinhaDevocionalVisualizaViewController: UIViewController {
    
    weak var delegate2: MinhaDevocionalVisualizaViewControllerDelegate?
    var tituloShare = "𝑀𝑒𝓊 𝒟𝑒𝓋𝑜𝒸𝒾𝑜𝓃𝒶𝓁"
    var devocionalSelecionada = Devocionais()
    var devocional = 0
    var dataDevocional: [Devocionais] = []
    var textoDefaut = ""
    
    @IBOutlet weak var baseBiblica: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var reflexao: UITextView!
    @IBOutlet weak var link: UIButton!
    @IBOutlet weak var pc1: UILabel!
    @IBOutlet weak var pc2: UILabel!
    @IBOutlet weak var pc3: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
   
    
    override func viewDidLoad() {
        pc1.layer.cornerRadius = 5
        pc2.layer.cornerRadius = 5
        pc3.layer.cornerRadius = 5
        pc1.isHidden = true
        pc2.isHidden = true
        pc3.isHidden = true
        pc1.clipsToBounds = true
        pc2.clipsToBounds = true
        pc3.clipsToBounds = true
        
        reflexao.textColor = .label
        
        dataDevocional = CoreDataStack.shared.getDevocional()

        super.viewDidLoad()
        //navigationController?.navigationBar.prefersLargeTitles = true
        self.atualizaDevocional()
        editButton(button: link)

      
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        //super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            delegate2?.didRegisterEdicoes()
        }
    }
    
    // MARK: Buttons 
    ///carrega o formulario de edicao
    @IBAction func editTrue(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "minhadevocionalForms") as?
            MinhaDevocionalEditaViewController  {
            vc.devocional = devocionalSelecionada
            vc.edit = true
            vc.indice = devocional
            vc.delegate = self
            navigationController?.present(vc, animated: true, completion: nil)
            }
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let vc = UIActivityViewController(activityItems: [tituloShare,
                                                          devocionalSelecionada.titulo!,
                                                          devocionalSelecionada.baseBiblica!,
                                                          devocionalSelecionada.reflexao!,
                                                          devocionalSelecionada.link!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    @IBAction func playButton(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "music") as?
                    DevocionalMusicViewController {
            //envia o link que está armazenado no banco de dados
//            if dataDevocional.count == 0{
//                vc.recebe = meuDevocional[0].link
//            }
            vc.recebe  = devocionalSelecionada.link ?? ""
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: Funcoes de cores
    func editaCores(){
        var selectedColor = UIColor()
        if devocionalSelecionada.backgroundColor == "1"{
            selectedColor = UIColor(named: "Verde1") ?? verde
        }
        else if devocionalSelecionada.backgroundColor == "2"{
            selectedColor =  UIColor(named: "Amarelo1") ?? verde
            
        }
        else if devocionalSelecionada.backgroundColor == "3"{
            selectedColor = UIColor(named: "Amarelo2") ?? verde
            
        }
        else{
            selectedColor = UIColor(named: "Amarelo2") ?? verde
            
        }
        
        titulo.textColor = selectedColor
        self.editPalavraChave(pc: pc1, color: selectedColor)
        self.editPalavraChave(pc: pc2, color: selectedColor)
        self.editPalavraChave(pc: pc3, color: selectedColor)

    }
    
    ///funcao auxiliar
    func editPalavraChave(pc: UILabel, color: UIColor){
        if pc.text != ""{
            pc.isHidden = false
            pc.backgroundColor = color.withAlphaComponent(0.5)
        }
    }
    
    ///funcao que atualiza a devocional depois de passar pela tela do edit
    func atualizaDevocional(){
        baseBiblica.text = devocionalSelecionada.baseBiblica
        titulo.text = devocionalSelecionada.titulo
        reflexao.text = devocionalSelecionada.reflexao
        pc1.text = devocionalSelecionada.aplicacao1
        pc2.text = devocionalSelecionada.aplicacao2
        pc3.text = devocionalSelecionada.aplicacao3
        
        //editando cores da devocional
        self.editaCores()
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

extension MinhaDevocionalVisualizaViewController: MinhaDevocionalEditaViewControllerDelegate{
    func didRegister(){
        self.atualizaDevocional()
    }
}
