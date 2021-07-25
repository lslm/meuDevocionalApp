//
//  MuralViewController2.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 16/07/21.
//

import UIKit
import Foundation

protocol MuralViewController2Delegate: AnyObject {
    func didRegister()
}

class MuralViewController2: UIViewController {
    
    weak var delegate: MuralViewController2Delegate? //para atualizacao da collectionView

    var dataPost: [Post] = []
    var indice = 0
    var minhaNota = ""
    var selectedColor = "postit1"
    
    @IBOutlet weak var minhaNotaInput: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var color1: UIButton?
    @IBOutlet weak var color2: UIButton?
    @IBOutlet weak var color3: UIButton?
    @IBOutlet weak var color4: UIButton?
    @IBOutlet weak var visualizacao: UIImageView!
    @IBOutlet weak var visualizacaoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataPost = try! CoreDataStackPost.getPost()
        okButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        
        dataPost.last?.nota = minhaNotaInput.text!
        dataPost.last?.backgroundImage = selectedColor
        
        //salvando
        try? CoreDataStackPost.saveContext()
        
        //atualiza a collectionView
        delegate?.didRegister()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //funcoes de selecao de cores
    @IBAction func clickColor1(_ sender: Any) {
            visualizacaoLabel.textColor = .white
            //desativa as outras cores
            changeColor(button: color2!, cor: "color2")
            changeColor(button: color3!, cor: "color3")
            changeColor(button: color4!, cor: "color4")
            //ativa cor selecionada
            changeColor(button: color1!, cor: "color1s")
            visualizacao.image = UIImage(named: "postitView1")
            selectedColor = "postit1"
    }
    
    @IBAction func clickColor2(_ sender: Any) {
            visualizacaoLabel.textColor = .white
            //desativa as outras cores
            changeColor(button: color1!, cor: "color1")
            changeColor(button: color3!, cor: "color3")
            changeColor(button: color4!, cor: "color4")
            //ativa cor atual
            changeColor(button: color2!, cor: "color2s")
            visualizacao.image = UIImage(named: "postitView2")
            selectedColor = "postit2"

    }
    @IBAction func clickColor3(_ sender: Any) {
            visualizacaoLabel.textColor = verde
            //desativa as outras cores
            changeColor(button: color1!, cor: "color1")
            changeColor(button: color2!, cor: "color2")
            changeColor(button: color4!, cor: "color4")
            //ativa cor atual
            changeColor(button: color3!, cor: "color3s")
            visualizacao.image = UIImage(named: "postitView3")
            selectedColor = "postit3"

    }
    @IBAction func clickColor4(_ sender: Any) {
            visualizacaoLabel.textColor = amarelo
            //desativa as outras cores
            changeColor(button: color1!, cor: "color1")
            changeColor(button: color2!, cor: "color2")
            changeColor(button: color3!, cor: "color3")
            //ativa cor atual
            changeColor(button: color4!, cor: "color4s")
            visualizacao.image = UIImage(named: "postitView4")
            selectedColor = "postit4"
    }
    
    //funcao para mudar a cor selecionada
    func changeColor(button:UIButton, cor:String){
        button.setBackgroundImage(UIImage(named: cor), for: .normal)
    }
    //funcao para adicionar o texto
    @IBAction func atualizaTexto(_ sender: Any) {
        minhaNotaInput.returnKeyType = .done
        minhaNotaInput.autocapitalizationType = .words
        minhaNotaInput.delegate = self
        minhaNotaInput.resignFirstResponder()
        visualizacaoLabel.text = minhaNotaInput.text
    }
    
}
extension MuralViewController2: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //essa funcao faz com que a tecla return do teclado faca o app aceitar a entrada e o teclado abaixe
    textField.resignFirstResponder()
    return true
    }
}
