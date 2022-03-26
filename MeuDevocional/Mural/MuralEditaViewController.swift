//
//  MuralViewController2.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 16/07/21.
//

import UIKit
import Foundation
import PhotosUI


class MuralEditaViewController: UIViewController {
    
    weak var delegate: MuralEditaViewControllerDelegate? //para atualizacao da collectionView

    var dataPost: [Post] = []
    var indice = 0
    var minhaNota = ""
    var selectedColor = "postit1"
    var colorText = "Amarelo1"
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
    
    var imagePicker: ImagePicker!
    var acesso = false
    var isImage = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minhaNotaInput.delegate = self
        dataPost = try! CoreDataStackPost.getPost()
        okButton.layer.cornerRadius = 8
        
        ///photo picker
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        self.visualizacao.layer.cornerRadius = 10
        self.visualizacao.contentMode = .scaleAspectFill
        

    }
    
    // MARK: Buttons
    @IBAction func onTap(_ sender: Any) {
        if isEdit == true{
            indice = dataPost.count-1
        }
        dataPost.last?.nota = minhaNotaInput.text!
        
        if isImage != true {
            dataPost.last?.backgroundImage = selectedColor
        }
        dataPost.last?.color = colorText
        
        let date = Date()
        let formatter =  DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dataPost.last?.data =  formatter.string(from: date)
        
        //salvando
        try? CoreDataStackPost.saveContext()
        
        //atualiza a collectionView
        delegate?.didRegister()
        
        //salva no userDefault
        verifWidgets()
        
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
    
    @IBAction func addPhoto(_ sender: Any) {
        self.isImage = true
        let photos = PHPhotoLibrary.authorizationStatus()
            if photos == .notDetermined {
                PHPhotoLibrary.requestAuthorization({status in
                    if status != .denied{
                        self.acesso = true

                    } else {
                        self.acesso = false
                    }
                })
            }
        else{
            let teste = PHPhotoLibrary.authorizationStatus()
            if teste != .denied{
                self.imagePicker.present(from: sender as! UIView)
            }
            else{
                print("Nao permitido")
            }
        }
    }
    
    // MARK: Funcao que verifica o userDefaults no mural para os widgets
    func verifWidgets(){
        let post = try! CoreDataStackPost.getPost()
        ///vai preencher o vetor de user Defaults com os postits de gratidao armazenados no coredata
        if post.count-1 != (UserDefaultsManager.shared.gratidao?.count){
            ///reseta o vetor do user defaults
            UserDefaultsManager.shared.background = [""]
            UserDefaultsManager.shared.gratidao = [""]
            var vetaux: [String] = [""]
            var vetaux2: [String] = [""]
            for i in 0..<post.count{
                vetaux.append(post[i].nota ?? "Pelo o que você é grato hoje?")
                vetaux2.append(post[i].backgroundImage ?? "postit1")
            }
            ///atualiza o vetor do user defaults
             UserDefaultsManager.shared.gratidao = vetaux
             UserDefaultsManager.shared.background = vetaux2
        }
        //print("gratidao",UserDefaultsManager.shared.gratidao)
    }
    
    // MARK: Colors Button
    
    //funcoes de selecao de cores
    @IBAction func clickColor1(_ sender: Any) {
        visualizacaoLabel.textColor = .white
        if isImage == false{
            visualizacao.image = UIImage(named: "postitView1")
            selectedColor = "postit1"
        }
        else{
            visualizacaoLabel.backgroundColor = UIColor(named: "Verde2")
        }
        //desativa as outras cores
        changeColor(button: color2!, cor: "color2")
        changeColor(button: color3!, cor: "color3")
        changeColor(button: color4!, cor: "color4")
        //ativa cor selecionada
        changeColor(button: color1!, cor: "color1s")
        colorText = "Verde2"
    }
    
    @IBAction func clickColor2(_ sender: Any) {
        visualizacaoLabel.textColor = .white
        if isImage == false{
            visualizacao.image = UIImage(named: "postitView2")
            selectedColor = "postit2"
        }
        else{
            visualizacaoLabel.backgroundColor = UIColor(named: "Amarelo1")
        }
        //desativa as outras cores
        changeColor(button: color1!, cor: "color1")
        changeColor(button: color3!, cor: "color3")
        changeColor(button: color4!, cor: "color4")
        //ativa cor atual
        changeColor(button: color2!, cor: "color2s")
        colorText = "Amarelo1"

    }
    @IBAction func clickColor3(_ sender: Any) {
        visualizacaoLabel.textColor = verde
        if isImage == false{
            visualizacao.image = UIImage(named: "postitView3")
            selectedColor = "postit3"
        }
        else{
            visualizacaoLabel.backgroundColor = UIColor(named: "Amarelo2")
        }
        //desativa as outras cores
        changeColor(button: color1!, cor: "color1")
        changeColor(button: color2!, cor: "color2")
        changeColor(button: color4!, cor: "color4")
        //ativa cor atual
        changeColor(button: color3!, cor: "color3s")
        colorText = "Amarelo2"

    }
    @IBAction func clickColor4(_ sender: Any) {
        visualizacaoLabel.textColor = amarelo
        if isImage == false {
            visualizacao.image = UIImage(named: "postitView4")
            selectedColor = "postit4"
        }
        else{
            visualizacaoLabel.backgroundColor = UIColor(named: "Amarelo3")
        }
        //desativa as outras cores
        changeColor(button: color1!, cor: "color1")
        changeColor(button: color2!, cor: "color2")
        changeColor(button: color3!, cor: "color3")
        //ativa cor atual
        changeColor(button: color4!, cor: "color4s")
        colorText = "Amarelo3"
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

