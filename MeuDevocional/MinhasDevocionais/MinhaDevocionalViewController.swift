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

class MinhaDevocionalViewController: UICollectionViewController {

    override func viewDidLoad() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: verde]
        
        super.viewDidLoad()
        
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

    
    ///Funcoes da collectionView
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    ///Retorna a quantidade de itens da collection. Se nao forem os dados do usuario, retorna um item default
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dataDevocional = try! CoreDataStack.getDevocional()
        if dataDevocional.count == 0 {
            return meuDevocional.count
        }
        return dataDevocional.count
    }
    
    // MARK: Edicao da celula
    ///Funcao que retorna a celula editada
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cellBase = UICollectionViewCell()
    
        if let cell: MyCollectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier4, for: indexPath as IndexPath) as? MyCollectionViewCell {
        
        cell.layer.cornerRadius = 15
        
        ///editando o visual dos elementos da celula
        let dataDevocional = try! CoreDataStack.getDevocional()
        
        ///se nao houver adicoes no banco de dados, pega a devocional disponibilizada como base
        if dataDevocional.count == 0 {
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
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// se nao houver nenhuma criada, começa a criar uma
        let dataDevocional = try! CoreDataStack.getDevocional()
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
                vc.devocional = indexPath.row
                vc.delegate2 = self
                //self.collectionView?.reloadData()
                navigationController?.pushViewController(vc, animated: true)
                }
        }
    
    }
    
    // MARK: Auxiliares de edicao
    /// --------- Funcoes auxiliares -----------
    func editaCelula(cell: MyCollectionViewCell,index: Int){
        ///seleciona o que tem no banco de dados para exibir
        let dataDevocional = try! CoreDataStack.getDevocional()
        
        cell.data.text = dataDevocional[index].data
        cell.myTitle.text = dataDevocional[index].titulo
        cell.myReference.text = dataDevocional[index].baseBiblica
        cell.myImage.image = UIImage(named: dataDevocional[index].backgroundImage!)
        
        cell.pc1.text = dataDevocional[index].aplicacao1
        cell.pc2.text = dataDevocional[index].aplicacao2
        cell.pc3.text = dataDevocional[index].aplicacao3
        
        ///adiciona background nas palavras - chave apenas se houver algo adicionado
        if dataDevocional[index].aplicacao1 != "" {cell.pc1.backgroundColor = verde3}
        if dataDevocional[index].aplicacao2 != "" {cell.pc2.backgroundColor = verde3}
        if dataDevocional[index].aplicacao3 != "" {cell.pc3.backgroundColor = verde3}
        
        cell.pc1.clipsToBounds = true
        cell.pc2.clipsToBounds = true
        cell.pc3.clipsToBounds = true

        cell.pc1.layer.cornerRadius = 3
        cell.pc2.layer.cornerRadius = 3
        cell.pc3.layer.cornerRadius = 3
        
        cell.pc1.textColor = .white
        cell.pc2.textColor = .white
        cell.pc3.textColor = .white
                
        ///define o background de acordo com o codigo armazenado
        if dataDevocional[index].backgroundColor == "1"{
            cell.backgroundColor = verde
        }
        else if dataDevocional[index].backgroundColor == "2" {
            cell.backgroundColor = amarelo
        }
        else if dataDevocional[index].backgroundColor == "3"{
            cell.backgroundColor = amarelo2

        }
        else{
            cell.backgroundColor = amarelo3
        }
        
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
        let dataDevocional = try! CoreDataStack.getDevocional()
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
                    try! CoreDataStack.deleteDevocional(devocionais: dataDevocional[indexPath.row])
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
