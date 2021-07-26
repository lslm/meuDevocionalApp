//
//  MinhaDevocionalViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 16/07/21.
//

import UIKit
let teste = CollectionItem()

class MinhaDevocionalViewController: UIViewController{
    var isFirstRun = true
    var minhasDevocionais: [CollectionItem] = []
    let reuseIdentifier4 = "cell4"
    
    //collection view
    @IBOutlet weak var collectionDevocional: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionDevocional.dataSource = self
        collectionDevocional.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: verde]
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
                collectionDevocional.addGestureRecognizer(longPress)
    }
    
    @IBAction func addDevocionalCollection(_ sender: Any) {
    }
    
    //funcao que ira gerar o modal para a criacao da nova colecction
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //adiciona o card que sera apenas editado na proxima view...
        let _ = try? CoreDataStack.createDevocional(titulo: "", baseBiblica: "", contextualizacao: "", reflexao: "", conclusao: "", aplicacao1: "", aplicacao2: "", aplicacao3: "", backgroundColor: "1", backgroundImage: "crie2", link: "",livro: "",capitulo: "",versiculo: "")
        self.collectionDevocional?.reloadData()
        let vc = segue.destination as! MinhaDevocional3ViewController
        vc.edit = false
        vc.delegate = self
   }
}

extension MinhaDevocionalViewController: UICollectionViewDataSource{
    //funcoes da collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dataDevocional = try! CoreDataStack.getDevocional()
        if dataDevocional.count == 0 {
            return meuDevocional.count
        }
        return dataDevocional.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MyCollectionViewCell  = collectionDevocional?.dequeueReusableCell(withReuseIdentifier: reuseIdentifier4, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.layer.cornerRadius = 15
        
        ///editando o visual dos elementos da celula
        let dataDevocional = try! CoreDataStack.getDevocional()
        
        ///se nao houver adicoes no banco de dados, pega a devocional disponibilizada como base
        if dataDevocional.count == 0 {
            cell.myTitle.text = meuDevocional[indexPath.row].titulo
            cell.myImage.image = meuDevocional[indexPath.row].backgroundImage
            cell.myReference.text = meuDevocional[indexPath.row].baseBiblica
            cell.backgroundColor = verde
            cell.myTitle.textColor = .white
            cell.myReference.textColor = .white
            cell.pc1.text = " "
            cell.pc2.text = " "
            cell.pc3.text = " "
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
        
        return cell
    }
    
    ///funcao generica que edita a celula da devocional criada
    func editaCelula(cell: MyCollectionViewCell,index: Int){
        ///seleciona o que tem no banco de dados para exibir
        let dataDevocional = try! CoreDataStack.getDevocional()
        
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
            cell.myTitle.textColor = .white
            cell.myReference.textColor = .white
        }
        else if cell.backgroundColor == amarelo{
            cell.myTitle.textColor = .white
            cell.myReference.textColor = .white
        }
        else if cell.backgroundColor == amarelo2{
            cell.myTitle.textColor = verde
            cell.myReference.textColor = verde
        }
        else {
            cell.myTitle.textColor = amarelo
            cell.myReference.textColor = amarelo
        }
    }
    
    ///funcao que gera a exclusao do item se for pressionado
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        let dataDevocional = try! CoreDataStack.getDevocional()
        if sender.state == .began {
            let touchPoint = sender.location(in: collectionDevocional)
            if let indexPath = collectionDevocional.indexPathForItem(at: touchPoint) {
                if dataDevocional.count == 0{
                    let ac = UIAlertController(title: "Não é possível deletar", message: nil, preferredStyle: .actionSheet)
                    ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                            [weak self] action in
                            self?.collectionDevocional.reloadData()
                    }))
                    present(ac, animated: true)
                }
                else{
                let ac = UIAlertController(title: "Deletar todo o conteúdo de '\(dataDevocional[indexPath.item].titulo ?? "NONE")'", message: nil, preferredStyle: .actionSheet)
                    ac.addAction(UIAlertAction(title: "Confirmar", style: .destructive, handler: {
                        [weak self] action in
                    try! CoreDataStack.deleteDevocional(devocionais: dataDevocional[indexPath.row])
                    self?.collectionDevocional.reloadData()
                    }))
                    ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                    present(ac, animated: true)
                }
            }
        }
    }
}


extension MinhaDevocionalViewController: UICollectionViewDelegate {
    // funcao de ir pra celula selecionada
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "minhadevocional") as?
                    MinhaDevocional2ViewController {
            vc.devocional = indexPath.item
            vc.delegate2 = self
            navigationController?.pushViewController(vc, animated: true)
            }
        self.collectionDevocional?.reloadData()
    }
}


///funcoes delegate utilizadas para atualizar o conteudo da view

extension MinhaDevocionalViewController: MinhaDevocional3ViewControllerDelegate{
    func didRegister(){
        collectionDevocional.reloadData()
    }
}

extension MinhaDevocionalViewController: MinhaDevocional2ViewControllerDelegate{
    func didRegister2(){
        collectionDevocional.reloadData()
    }
}
