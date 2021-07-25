//
//  DevocionalDiarioEstudoViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 15/07/21.
//

import UIKit

class DevocionalDiarioEstudoViewController: UIViewController {
    //carrega o banco de dados dessas devocionais
    
    //estudo biblico selecionado
    var estudo = 0
    var cell = 0
    
    var aplicacao1: [String] = []
    var aplicacao2: [String] = []
    var aplicacao3: [String] = []
    var anotacao: [String] = []
    var keySelected1 = ""
    var keySelected2 = ""
    var keySelected3 = ""
    var keySelected4 = ""
        
    
    //variaveis mutaveis de acordo com o array
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var baseBiblica: UILabel!
    @IBOutlet weak var imagemTema: UIImageView!
    @IBOutlet weak var contextualizacao: UILabel!
    @IBOutlet weak var contextualizacaoConteudo: UITextView!
    @IBOutlet weak var reflexaoConteudo: UITextView!
    @IBOutlet weak var conclusaoConteudo: UITextView!
    
    //inputs do usuario
    @IBOutlet weak var fieldAplicacao1: UITextField!
    @IBOutlet weak var fieldAplicacao2: UITextField!
    @IBOutlet weak var fieldAplicacao3: UITextField!
    @IBOutlet weak var anotacoesPessoais: UITextView!
    
    //botoes de checklist
    @IBOutlet weak var check1: UIButton!
    @IBOutlet weak var check2: UIButton!
    @IBOutlet weak var check3: UIButton!
    
    
    
    override func viewDidLoad() {
        //carregar banco de dados
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
        
        selecionaBaseDados()
        
   
        
        aplicacao1 = defaults.object(forKey: keySelected1) as? [String] ?? [String]()
        aplicacao2 = defaults.object(forKey: keySelected2) as? [String] ?? [String]()
        aplicacao3 = defaults.object(forKey: keySelected3) as? [String] ?? [String]()
        anotacao = defaults.object(forKey: keySelected4) as? [String] ?? [String]()
        
        
        selecionaVetores()
        
        ///verificacao dos inputs na textField
        fieldAplicacao1.text = aplicacao1[estudo]
        fieldAplicacao2.text = aplicacao2[estudo]
        fieldAplicacao3.text = aplicacao3[estudo]
        
        ///verificacao da anotacao pessoal
        ///define o tipo de texto que sera mostrado ao usuário na reflexao (se é o armazenado ou o default)
        
        if anotacao[estudo] != ""{
            anotacoesPessoais.text = anotacao[estudo]
        }
        else{
            anotacoesPessoais.text = "Comece a escrever..."
            anotacoesPessoais.textColor = UIColor.lightGray
        }
        
        fieldAplicacao1.delegate = self
        fieldAplicacao2.delegate = self
        fieldAplicacao3.delegate = self
        anotacoesPessoais.delegate = self
    }
    
    @IBAction func saveButton(_ sender: Any) {
        aplicacao1[estudo] = fieldAplicacao1.text!
        aplicacao2[estudo] = fieldAplicacao2.text!
        aplicacao3[estudo] = fieldAplicacao3.text!
        
        if anotacoesPessoais.textColor == UIColor.lightGray {
            anotacao[estudo] = ""

        }
        else{
            anotacao[estudo] = anotacoesPessoais.text!

        }        
        defaults.set(aplicacao1,forKey: keySelected1)
        defaults.set(aplicacao2,forKey: keySelected2)
        defaults.set(aplicacao3,forKey: keySelected3)
        defaults.set(anotacao,forKey: keySelected4)
        
        let ac = UIAlertController(title: "Você salvou as alterações", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in}))
        present(ac, animated: true)
        
        hideKeyboard()
    }
    @IBAction func playMusicButton(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "music") as?
                    DevocionalMusicViewController {
            vc.recebe  = "https://www.youtube.com/watch?v=DpRIomLBQZA"
            navigationController?.pushViewController(vc, animated: true)
            }
    }
    func selecionaBaseDados(){
        if cell == 1{
            keySelected1 = "baseAplicacaoCotidiano1"
            keySelected2 = "baseAplicacaoCotidiano2"
            keySelected3 = "baseAplicacaoCotidiano3"
            keySelected4 = "baseAnotacaoCotidiano"
        }
        else if cell == 2{
            keySelected1 = "baseAplicacaoVida1"
            keySelected2 = "baseAplicacaoVida2"
            keySelected3 = "baseAplicacaoVida3"
            keySelected4 = "baseAnotacaoVida"
        }
        else if cell == 3{
            keySelected1 = "baseAplicacaoEstudos1"
            keySelected2 = "baseAplicacaoEstudos2"
            keySelected3 = "baseAplicacaoEstudos3"
            keySelected4 = "estudosAnotacao"
        }
    }
    func selecionaVetores(){
        if cell == 1{
            if aplicacao1.count == 0{
                aplicacao1 = ["","","","",""]
                aplicacao2 = ["","","","",""]
                aplicacao3 = ["","","","",""]
                anotacao = ["","","","",""]
                defaults.set(aplicacao1,forKey: keySelected1)
                defaults.set(aplicacao2,forKey: keySelected2)
                defaults.set(aplicacao3,forKey: keySelected3)
                defaults.set(anotacao,forKey: keySelected4)
            }
        }
        else if cell == 2{
            if aplicacao1.count == 0{
                aplicacao1 = ["","","","","",""]
                aplicacao2 = ["","","","","",""]
                aplicacao3 = ["","","","","",""]
                anotacao = ["","","","","",""]
                defaults.set(aplicacao1,forKey: keySelected1)
                defaults.set(aplicacao2,forKey: keySelected2)
                defaults.set(aplicacao3,forKey: keySelected3)
                defaults.set(anotacao,forKey: keySelected4)
            }
        }
        else {
            if aplicacao1.count == 0{
                aplicacao1 = ["","","","",""]
                aplicacao2 = ["","","","",""]
                aplicacao3 = ["","","","",""]
                anotacao = ["","","","",""]
                defaults.set(aplicacao1,forKey: keySelected1)
                defaults.set(aplicacao2,forKey: keySelected2)
                defaults.set(aplicacao3,forKey: keySelected3)
                defaults.set(anotacao,forKey: keySelected4)

            }
        }
    }
    override func touchesBegan(_: Set<UITouch>, with: UIEvent?) {
        ///anotacoesPessoais.resignFirstResponder()
        hideKeyboard()
        self.view.endEditing(true)
    }
}

extension DevocionalDiarioEstudoViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ///essa funcao faz com que a tecla return do teclado faca o app aceitar a entrada e o teclado abaixe
        textField.resignFirstResponder()
        return true
    }
}

extension DevocionalDiarioEstudoViewController: UITextViewDelegate{
    func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
       textField.resignFirstResponder()
       return true;
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if anotacoesPessoais.textColor == UIColor.lightGray {
            anotacoesPessoais.text = ""
            anotacoesPessoais.textColor = .label
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if anotacoesPessoais.text == "" {
            anotacoesPessoais.text = "Comece a escrever ..."
            anotacoesPessoais.textColor = UIColor.lightGray
        }
    }
}



