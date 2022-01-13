//
//  MinhaDevocional2ViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 16/07/21.
//

import UIKit
protocol MinhaDevocional2ViewControllerDelegate: AnyObject {
    func didRegister2()
}

class MinhaDevocional2ViewController: UIViewController {
    
    weak var delegate2: MinhaDevocional2ViewControllerDelegate?
    var tituloShare = "𝑀𝑒𝓊 𝒟𝑒𝓋𝑜𝒸𝒾𝑜𝓃𝒶𝓁"
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
        super.viewDidLoad()
        //navigationController?.navigationBar.prefersLargeTitles = true
        dataDevocional = try! CoreDataStack.getDevocional()
        
        if dataDevocional.count != 0 {
            atualizaDevocional()
        }
        else{
            ///caso nao haja nenhuma devocional, nao é possivel compartilhar nem editar
            shareButton.isHidden = true
            editButton.isHidden = true
        }
        
        editButton(button: link)
        
        pc1.layer.cornerRadius = 5
        pc2.layer.cornerRadius = 5
        pc3.layer.cornerRadius = 5
        pc1.clipsToBounds = true
        pc2.clipsToBounds = true
        pc3.clipsToBounds = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        //super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            delegate2?.didRegister2()
        }
    }
    
    // MARK: Buttons 
    ///carrega o formulario de edicao
    @IBAction func editTrue(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "minhadevocionalForms") as?
                    MinhaDevocional3ViewController {
            vc.edit = true
            vc.indice = devocional
            vc.delegate = self
            navigationController?.present(vc, animated: true, completion: nil)
            }
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let vc = UIActivityViewController(activityItems: [tituloShare,dataDevocional[devocional].titulo!,dataDevocional[devocional].baseBiblica!,dataDevocional[devocional].reflexao!,dataDevocional[devocional].link!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    @IBAction func playButton(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "music") as?
                    DevocionalMusicViewController {
            //envia o link que está armazenado no banco de dados
            if dataDevocional.count == 0{
                vc.recebe = meuDevocional[0].link
            }
            else{vc.recebe  = dataDevocional[devocional].link!}
            navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    ///funcao que atualiza a devocional depois de passar pela tela do edit
    func atualizaDevocional(){
        baseBiblica.text = dataDevocional[devocional].baseBiblica
        titulo.text = dataDevocional[devocional].titulo
        reflexao.text = dataDevocional[devocional].reflexao
        pc1.text = dataDevocional[devocional].aplicacao1
        pc2.text = dataDevocional[devocional].aplicacao2
        pc3.text = dataDevocional[devocional].aplicacao3
        
        //editando cor do titulo
        if dataDevocional[devocional].backgroundColor == "1"{titulo.textColor = verde}
        else if dataDevocional[devocional].backgroundColor == "2"{titulo.textColor = amarelo}
        else if dataDevocional[devocional].backgroundColor == "3"{titulo.textColor = amarelo2}
        else{titulo.textColor = amarelo3}
    }
    
    /// altera o visual do botao de play
    func editButton(button:UIButton){
        button.layer.backgroundColor = nil
        button.layer.cornerRadius = 1
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 1.5
        button.layer.shadowRadius = 3
        button.layer.masksToBounds = false
    }
    
}

extension MinhaDevocional2ViewController: MinhaDevocional3ViewControllerDelegate{
    func didRegister(){
        self.atualizaDevocional()
    }
}
