//
//  MinhaDevocional3ViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 20/07/21.
//

import UIKit



class MinhaDevocionalEditaViewController: UIViewController {
    
    var validation = Validation() //para validar links
    weak var delegate: MinhaDevocionalEditaViewControllerDelegate?
    
    var dataDevocional: [Devocionais] = []
    var indice = 0
    var edit = false
    var rapida = false
    var selectedColor = "1"
    var meuTitulo = ""
    var minhaBase = ""
    var selectedColorName = "crie1"
    
    let inputLista: [String] = ["Título", "Livro","Capítulo","Versículo","Palavra chave 1", "Palavra chave 2", "Palavra chave 3"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reflexaoView: UITextView!
    
    //botoes de cores
    @IBOutlet weak var color1: UIButton!
    @IBOutlet weak var color2: UIButton!
    @IBOutlet weak var color3: UIButton!
    @IBOutlet weak var color4: UIButton!
    
    //textField do link
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var okayLinkButton: UIButton!
    
    //para pegar a data
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        reflexaoView.delegate = self
        linkTextField.delegate = self
        
        ///funcao que faz o clique na tela ocultar o teclado
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
        
        dataDevocional = try! CoreDataStack.getDevocional()
        
        
        // MARK: Edicao ou criacao
        ///define se está atualizando uma devocional ou apenas criando uma nova
        if edit == false {
            indice = dataDevocional.count-1
        }
        
        ///define o tipo de texto que sera mostrado ao usuário na reflexao (se é o armazenado ou o default)
        if dataDevocional[indice].reflexao != ""{
            reflexaoView.text = dataDevocional[indice].reflexao
        }
        else{
            reflexaoView.text = "Comece a escrever..."
            reflexaoView.textColor = UIColor.lightGray
        }
        
        ///mostra o link caso tiver armazenado
        linkTextField.text = dataDevocional[indice].link
        selectedColor = dataDevocional[indice].backgroundColor!
        
        ///salvando data
        let date = Date()
        let formatter =  DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dataDevocional[indice].data =  formatter.string(from: date)
        okayLinkButton.layer.cornerRadius = 8
        
        ///salvando o progresso
        try? CoreDataStack.saveContext()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.saveContent()
    }
    
    // MARK: Save button
    ///funcao criada para adicionar a nova celula criada
    @IBAction func addAndSave(_ sender: Any) {
        self.saveContent()
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveContent(){
        //titulo
        let index = IndexPath(row: 0, section: 0)
        let cell: MyTableViewCell = self.tableView.cellForRow(at: index) as! MyTableViewCell
        meuTitulo = cell.textFieldCell.text!
        dataDevocional[indice].titulo = meuTitulo
        
        //livro
        let index1 = IndexPath(row: 1, section: 0)
        let cell1: MyTableViewCell = self.tableView.cellForRow(at: index1) as! MyTableViewCell
        
        //capitulo
        let index2 = IndexPath(row: 2, section: 0)
        let cell2: MyTableViewCell = self.tableView.cellForRow(at: index2) as! MyTableViewCell
        
        //versiculo
        let index3 = IndexPath(row: 3, section: 0)
        let cell3: MyTableViewCell = self.tableView.cellForRow(at: index3) as! MyTableViewCell
        
        //minha base é a base Biblica concatenada (composto de livro, capitulo e versiculo)
        minhaBase += cell1.textFieldCell.text!
        dataDevocional[indice].livro = cell1.textFieldCell.text!
        
        if minhaBase == ""{
            dataDevocional[indice].baseBiblica = minhaBase
        }
        else if rapida == true{
            minhaBase = dataDevocional[indice].baseBiblica ?? ""
            
        }
        else if rapida == false && cell2.textFieldCell.text != ""{
            minhaBase += " "
            minhaBase += String(cell2.textFieldCell.text!)
            dataDevocional[indice].capitulo = cell2.textFieldCell.text!
            minhaBase += ":"
            minhaBase += cell3.textFieldCell.text!
            dataDevocional[indice].versiculo = cell3.textFieldCell.text!
            
            ///juncao Livro + Capitulo + Versiculo
            dataDevocional[indice].baseBiblica = minhaBase
        }
        
        
        ///palavra chave 1
        let index4 = IndexPath(row: 4, section: 0)
        let cell4: MyTableViewCell = self.tableView.cellForRow(at: index4) as! MyTableViewCell
        
        ///palavra chave 2
        let index5 = IndexPath(row: 5, section: 0)
        let cell5: MyTableViewCell = self.tableView.cellForRow(at: index5) as! MyTableViewCell
        
        ///palavra chave 3
        let index6 = IndexPath(row: 6, section: 0)
        let cell6: MyTableViewCell = self.tableView.cellForRow(at: index6) as! MyTableViewCell
        
        dataDevocional[indice].aplicacao1 = cell4.textFieldCell.text!
        dataDevocional[indice].aplicacao2 = cell5.textFieldCell.text!
        dataDevocional[indice].aplicacao3 = cell6.textFieldCell.text!
        
        ///cor
        dataDevocional[indice].backgroundColor = selectedColor
        dataDevocional[indice].backgroundImage = selectedColorName
        
        ///reflexao
        dataDevocional[indice].reflexao = reflexaoView.text!
        if reflexaoView.textColor == UIColor.lightGray{
            ///caso o usuario nao tenha feito nenhuma alteracao em reflexao, é salvo no banco de dados um dado de string vazia
            dataDevocional[indice].reflexao = ""
        }
        
        ///link
        dataDevocional[indice].link = linkTextField.text!
        
        ///salvando o progresso
        try? CoreDataStack.saveContext()
        ///registra as aleracoes para visualizacao futura
        delegate?.didRegister()
        tableView.reloadData()
        tableView.reloadInputViews()
        
    }
    
    // MARK: Cancel button
    ///botao de cancelar
    @IBAction func cancelButton(_ sender: Any) {
        /// se for apenas uma edicao, apenas cancela a tela
        ///alerta de cancelar
        let ac = UIAlertController(title: "", message: "Tem certeza de que deseja descartar esta nova Devocional?", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Ignorar alterações", style: .destructive, handler: {
                [self] action in
                    ///opcoes de cancelamento
                    if edit == true {
                        self.dismiss(animated: true, completion: nil)
                    }
                    else{
                        ///se for uma adicao, exclui o item que tinha adicionado anteriormente
                        try! CoreDataStack.deleteDevocional(devocionais: dataDevocional[indice])
                        delegate?.didRegister()
                        self.dismiss(animated: true, completion: nil)
                    }
            }))
            ac.addAction(UIAlertAction(title: "Continuar editando", style: .cancel, handler: nil))
            present(ac, animated: true)
    }
    
    // MARK: Funcoes de cores
    ///funcoes que selecionam as cores
    @IBAction func changeColor1(_ sender: Any) {
        ///desativa as outras cores
        changeColor(button: color2!, cor: "color2")
        changeColor(button: color3!, cor: "color3")
        changeColor(button: color4!, cor: "color4")
        ///ativa cor selecionada
        changeColor(button: color1!, cor: "color1s")
        selectedColor = "1"
        selectedColorName = "criev1"
    }
    @IBAction func changeColor2(_ sender: Any) {
        ///desativa as outras cores
        changeColor(button: color1!, cor: "color1")
        changeColor(button: color3!, cor: "color3")
        changeColor(button: color4!, cor: "color4")
        ///ativa cor atual
        changeColor(button: color2!, cor: "color2s")
        selectedColor = "2"
        selectedColorName = "criev2"
    }
    @IBAction func changeColor3(_ sender: Any) {
        ///desativa as outras cores
        changeColor(button: color1!, cor: "color1")
        changeColor(button: color2!, cor: "color2")
        changeColor(button: color4!, cor: "color4")
        //ativa cor atual
        changeColor(button: color3!, cor: "color3s")
        selectedColor = "3"
        selectedColorName = "criev3"

    }
    @IBAction func changeColor4(_ sender: Any) {
        ///desativa as outras cores
        changeColor(button: color1!, cor: "color1")
        changeColor(button: color2!, cor: "color2")
        changeColor(button: color3!, cor: "color3")
        ///ativa cor atual
        changeColor(button: color4!, cor: "color4s")
        selectedColor = "4"
        selectedColorName = "criev4"
    }
    
    ///funcao para mudar a cor selecionada
    func changeColor(button:UIButton, cor:String){
        button.setBackgroundImage(UIImage(named: cor), for: .normal)
    }
    
    // MARK: Link button
    ///guarda o link disponibilizado pela pessoa
    @IBAction func okayLink(_ sender: Any) {
        
        linkTextField.returnKeyType = .done
        linkTextField.autocapitalizationType = .words
        linkTextField.delegate = self
        linkTextField.resignFirstResponder()
        
        ///confere se o link está correto
        let isValidateLink = self.validation.validateYoutube(name: linkTextField.text!)
        let isValidateLink2 = self.validation.validateSpotify(name: linkTextField.text!)
        if (isValidateLink == false) && (isValidateLink2 == false){
          alertLink()
          return
        }
        //armazena o link certo ou vazio. Se estiver vazio irá mostrar uma playlist Default
        dataDevocional[indice].link = linkTextField.text!

    }
    
    func alertLink(){
        let ac = UIAlertController(title:"Link Inválido", message: "Insira um link do YouTube, Spotify, Apple Music ou Deezer.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                [weak self] action in
                self!.linkTextField.text? = ""
        }))
        present(ac, animated: true)
    }
}



extension MinhaDevocionalEditaViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    ///essa funcao faz com que a tecla return do teclado faca o app aceitar a entrada e o teclado abaixe
        textField.autocapitalizationType = .words
        textField.resignFirstResponder()
        
        ///confere se o link está correto
        let isValidateLink = self.validation.validateYoutube(name: linkTextField.text!)
        let isValidateLink2 = self.validation.validateSpotify(name: linkTextField.text!)
        if (isValidateLink == false) && (isValidateLink2 == false){
          alertLink()
        }
        //armazena o link certo ou vazio. Se estiver vazio irá mostrar uma playlist Default
        dataDevocional[indice].link = linkTextField.text!
        
        return true
    }
}
