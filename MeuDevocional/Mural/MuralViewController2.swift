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
    var isEdit = false
    
    @IBOutlet weak var limitText: UILabel!
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
        minhaNotaInput.delegate = self
        dataPost = try! CoreDataStackPost.getPost()
        okButton.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        if isEdit == true{
            indice = dataPost.count-1
        }
        dataPost.last?.nota = minhaNotaInput.text!
        dataPost.last?.backgroundImage = selectedColor
        
        let date = Date()
        let formatter =  DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dataPost.last?.data =  formatter.string(from: date)
        
        //salvando
        try? CoreDataStackPost.saveContext()
        
        //atualiza a collectionView
        delegate?.didRegister()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
       
            let ac = UIAlertController(title: "", message: "Tem certeza de que deseja descartar este novo motivo?", preferredStyle: .actionSheet)
                ac.addAction(UIAlertAction(title: "Ignorar alterações", style: .destructive, handler: {
                    [self] action in
                    ///opcoes de cancelamento
                    ///se for uma adicao, exclui o item que tinha adicionado anteriormente
                    try! CoreDataStackPost.deletePost(post: dataPost.last!)
                    delegate?.didRegister()
                    self.dismiss(animated: true, completion: nil)
                }))
                ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                present(ac, animated: true)
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
    visualizacaoLabel.text = minhaNotaInput.text
    textField.resignFirstResponder()
    return true
    }
    
    //funcao criada para printar o limite de caracteres da palavra chave
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

           guard let text = textField.text else { return true }
        let length = text.count + string.count - range.length
           // create an Integer of 15 - the length of your TextField.text to count down
           //let count = 15 - length
            let count = length
           // set the .text property of your UILabel to the live created String
           limitText.text =  String(count) + "/100"
           // if you want to limit to 15 charakters
           // you need to return true and <= 15

           return length < 100
       }
}
