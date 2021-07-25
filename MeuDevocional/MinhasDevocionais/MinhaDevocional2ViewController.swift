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
    var devocional = 0
    var dataDevocional: [Devocionais] = []
    
    @IBOutlet weak var baseBiblica: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var reflexao: UITextView!
    @IBOutlet weak var link: UIButton!
    @IBOutlet weak var pc1: UILabel!
    @IBOutlet weak var pc2: UILabel!
    @IBOutlet weak var pc3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataDevocional = try! CoreDataStack.getDevocional()
        print(dataDevocional.count)
        if dataDevocional.count != 0 {
            atualizaDevocional()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            delegate2?.didRegister2()
        }
    }
    
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
        print("batata")
        let vc = UIActivityViewController(activityItems: [dataDevocional[devocional].titulo!,dataDevocional[devocional].baseBiblica!,dataDevocional[devocional].reflexao!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    @IBAction func playButton(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "music") as?
                    DevocionalMusicViewController {
            //envia o link que está armazenado no banco de dados
            vc.recebe  = dataDevocional[devocional].link!
            
            navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    
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
}

extension MinhaDevocional2ViewController: MinhaDevocional3ViewControllerDelegate{
    func didRegister(){
        atualizaDevocional()
    }
}
