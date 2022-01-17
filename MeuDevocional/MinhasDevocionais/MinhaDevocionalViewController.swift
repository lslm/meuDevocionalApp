//
//  CollectionViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 28/07/21.
//

import UIKit

private let reuseIdentifier = "Cell"

var minhasDevocionais: [CollectionItem] = []
let reuseIdentifier4 = "cell4"

class MinhaDevocionalViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var notFound: UIImageView!
    
    var searching = false
    var dataDevocional: [Devocionais] = []
    var dataFiltred: [Devocionais] = []
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: verde]
        
        super.viewDidLoad()
        self.dataDevocional = try! CoreDataStack.getDevocional()
        self.notFound.isHidden = false
        collectionView.delegate = self
        collectionView.dataSource = self
        self.configureSearchController()
        ///gesto para excluir a celula se for pressionada
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
                collectionView.addGestureRecognizer(longPress)
        
    }
    
    // MARK: Info view
    ///tela de informacao
    @IBAction func infoView(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "info") as?
                    InfoViewController {
            vc.imagem = "devos"
            navigationController?.present(vc, animated: true, completion: nil)
            }
    }
    
    // MARK: Prepare (edicao e devocional)
    ///funcao que ira gerar o modal para a criacao da nova colecction
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ///adiciona o card que sera apenas editado na proxima view...
        let _ = try? CoreDataStack.createDevocional(titulo: "", baseBiblica: "", contextualizacao: "", reflexao: "", conclusao: "", aplicacao1: "", aplicacao2: "", aplicacao3: "", backgroundColor: "1", backgroundImage: "crie2", link: "",livro: "",capitulo: "",versiculo: "",data: "")
        self.collectionView?.reloadData()
        let vc = segue.destination as! MinhaDevocional3ViewController
        vc.edit = false
        vc.delegate = self
   }
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.search
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Busque sua devocional..."
    }
    
    ///Funcoes da collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    ///Retorna a quantidade de itens da collection. Se nao forem os dados do usuario, retorna um item default
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataDevocional.count == 0 && searching == true {
            self.notFound.isHidden = false
            return 0
        }
        
        self.notFound.isHidden = true
        
        if dataDevocional.count == 0 && searching == false {
            return meuDevocional.count
        }
        if searching{
            return dataFiltred.count
        }
        else{
            dataDevocional = try! CoreDataStack.getDevocional()
            return dataDevocional.count

        }
    }
    
    // MARK: Edicao da celula
    ///Funcao que retorna a celula editada
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cellBase = UICollectionViewCell()
    
        if let cell: MyCollectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier4, for: indexPath as IndexPath) as? MyCollectionViewCell {
        
        cell.layer.cornerRadius = 15
        
        ///editando o visual dos elementos da celula
        //let dataDevocional = try! CoreDataStack.getDevocional()
        
        ///se nao houver adicoes no banco de dados, pega a devocional disponibilizada como base
        if dataDevocional.count == 0 && searching == false{
            cell.data.text = ""
            cell.myTitle.text = meuDevocional[indexPath.row].titulo
            cell.myImage.image = meuDevocional[indexPath.row].backgroundImage
            cell.myReference.text = meuDevocional[indexPath.row].baseBiblica
            cell.backgroundColor = .clear
            cell.pc1.text = ""
            cell.pc2.text = ""
            cell.pc3.text = ""
        }
        else{
            ///caso ja houverem dados no Banco de dados, mostra eles aos usuarios
            editaCelula(cell: cell, index: indexPath.row)
            defineTextColor(cell: cell)
        }
        
        ///deixa o background da palavra chave vazio caso nao exista nada adicionado
        if cell.pc1.text == "" {cell.pc1.backgroundColor = nil}
        if cell.pc2.text == "" {cell.pc2.backgroundColor = nil}
        if cell.pc3.text == "" {cell.pc3.backgroundColor = nil}
        
        cellBase = cell
            
        }
        
        return cellBase
    
    }
    
    // MARK: Clique na celula
    ///clique na celula leva para a visualizacao do conteudo
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// se nao houver nenhuma criada, começa a criar uma
        if dataDevocional.count == 0 {
            if let vc = storyboard?.instantiateViewController(identifier: "minhadevocionalForms") as?
                        MinhaDevocional3ViewController {
                ///adiciona o card que sera apenas editado na proxima view...
                let _ = try? CoreDataStack.createDevocional(titulo: "", baseBiblica: "", contextualizacao: "", reflexao: "", conclusao: "", aplicacao1: "", aplicacao2: "", aplicacao3: "", backgroundColor: "1", backgroundImage: "crie2", link: "",livro: "",capitulo: "",versiculo: "",data: "")
                self.collectionView?.reloadData()
                vc.edit = false
                vc.delegate = self
                navigationController?.present(vc, animated: true)
                }
        }
        else{
            if let vc = storyboard?.instantiateViewController(identifier: "minhadevocional") as?
                        MinhaDevocional2ViewController {
                let index = self.searchDevocional(Titulo: dataDevocional[indexPath.row].titulo!)
                vc.devocional = index
                vc.delegate2 = self
                //self.collectionView?.reloadData()
                navigationController?.pushViewController(vc, animated: true)
                }
        }
    
    }
    
    func searchDevocional(Titulo: String) -> Int{
        let devocionaisAtuais = try! CoreDataStack.getDevocional()
        var index = 0
        for i in 0..<devocionaisAtuais.count{
            if (devocionaisAtuais[i].titulo!.lowercased()) == (Titulo.lowercased()){
                index = i
            }
        }
        return index
    }
    
    
    // MARK: Auxiliares de edicao
    /// --------- Funcoes auxiliares -----------
    func editaCelula(cell: MyCollectionViewCell,index: Int){
        ///seleciona o que tem no banco de dados para exibir
        
        cell.data.text = dataDevocional[index].data
        cell.myTitle.text = dataDevocional[index].titulo
        cell.myReference.text = dataDevocional[index].baseBiblica
        cell.myImage.image = UIImage(named: dataDevocional[index].backgroundImage!)
        
    
        cell.pc1.text = dataDevocional[index].aplicacao1
        cell.pc2.text = dataDevocional[index].aplicacao2
        cell.pc3.text = dataDevocional[index].aplicacao3
                
        cell.pc1.clipsToBounds = true
        cell.pc2.clipsToBounds = true
        cell.pc3.clipsToBounds = true

        cell.pc1.layer.cornerRadius = 3
        cell.pc2.layer.cornerRadius = 3
        cell.pc3.layer.cornerRadius = 3
                
        ///define o background de acordo com o codigo armazenado
        if dataDevocional[index].backgroundColor == "1"{
            cell.backgroundColor = verde
            cell.myImage.image = UIImage(named: "criev1")
            self.editPC(aplicacao: dataDevocional[index], cell: cell, color: UIColor(named: "Amarelo1") ?? verde3)
        }
        else if dataDevocional[index].backgroundColor == "2" {
            cell.backgroundColor = amarelo
            cell.myImage.image = UIImage(named: "criev2")
            self.editPC(aplicacao: dataDevocional[index], cell: cell, color: UIColor(named: "Amarelo3") ?? verde3)
        }
        else if dataDevocional[index].backgroundColor == "3"{
            cell.backgroundColor = amarelo2
            cell.myImage.image = UIImage(named: "criev3")
            self.editPC(aplicacao: dataDevocional[index], cell: cell, color: UIColor(named: "Verde1") ?? verde3)
        }
        else{
            cell.backgroundColor = amarelo3
            cell.myImage.image = UIImage(named: "criev4")
            self.editPC(aplicacao: dataDevocional[index], cell: cell, color: UIColor(named: "Verde2") ?? verde3)
        }
        
    }
    
    func editPC(aplicacao: Devocionais, cell: MyCollectionViewCell, color: UIColor){
        ///adiciona background nas palavras - chave apenas se houver algo adicionado
        if aplicacao.aplicacao1 != "" {cell.pc1.backgroundColor = color.withAlphaComponent(0.4)}
        if aplicacao.aplicacao2 != "" {cell.pc2.backgroundColor = color.withAlphaComponent(0.4)}
        if aplicacao.aplicacao3 != "" {cell.pc3.backgroundColor = color.withAlphaComponent(0.4)}
    }
    
    ///define a cor do texto de acordo com o backgrund
    func defineTextColor(cell: MyCollectionViewCell){
        if cell.backgroundColor == verde {
            cell.data.textColor = .white
            cell.myTitle.textColor = .white
            cell.myReference.textColor = .white
        }
        else if cell.backgroundColor == amarelo{
            cell.data.textColor = .white
            cell.myTitle.textColor = .white
            cell.myReference.textColor = .white
        }
        else if cell.backgroundColor == amarelo2{
            cell.data.textColor = verde
            cell.myTitle.textColor = verde
            cell.myReference.textColor = verde
        }
        else {
            cell.data.textColor = amarelo
            cell.myTitle.textColor = amarelo
            cell.myReference.textColor = amarelo
        }
    }
    
    
    // MARK: Long Press function
    ///funcao que gera a exclusao do item se for pressionado
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if searching == false{
        //let dataDevocional = try! CoreDataStack.getDevocional()
            if sender.state == .began {
                let touchPoint = sender.location(in: collectionView)
                if let indexPath = collectionView.indexPathForItem(at: touchPoint) {
                    if dataDevocional.count == 0{
                        let ac = UIAlertController(title: "Não é possível deletar", message: nil, preferredStyle: .actionSheet)
                        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                                [weak self] action in
                                self?.collectionView.reloadData()
                        }))
                        present(ac, animated: true)
                    }
                    else{
                    let ac = UIAlertController(title: "Deletar todo o conteúdo de '\(dataDevocional[indexPath.item].titulo ?? "NONE")'", message: "O conteúdo não poderá ser recuperado.", preferredStyle: .actionSheet)
                        ac.addAction(UIAlertAction(title: "Deletar", style: .destructive, handler: {
                            [weak self] action in
                            let index = self?.searchDevocional(Titulo: self!.dataDevocional[indexPath.row].titulo!)
                            try! CoreDataStack.deleteDevocional(devocionais: self!.dataDevocional[index!])
                        self?.collectionView.reloadData()
                        }))
                        ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                        present(ac, animated: true)
                    
                    }
                    navigationController?.navigationBar.prefersLargeTitles = true
                }
            }
        }
    }
}

// MARK: Delegate
///funcoes delegate utilizadas para atualizar o conteudo da view
extension MinhaDevocionalViewController: MinhaDevocional3ViewControllerDelegate{
    func didRegister(){
        ///para a adicao
        collectionView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension MinhaDevocionalViewController: MinhaDevocional2ViewControllerDelegate{
    ///para a edicao
    func didRegister2(){
        collectionView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension MinhaDevocionalViewController: UISearchBarDelegate, UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            self.dataFiltred.removeAll() //limpando o filtro
            ///atualizar collection
            for devocional in self.dataDevocional{
                if (devocional.titulo!.lowercased().contains(searchText.lowercased())){
                    self.dataFiltred.append(devocional)
                }
            }
            self.dataDevocional = self.dataFiltred
        }
        else {
            searching = false
            self.dataFiltred.removeAll()
            self.dataDevocional = try! CoreDataStack.getDevocional()
        }
        
        self.collectionView.reloadData()
    }
}
