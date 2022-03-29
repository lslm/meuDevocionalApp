//
//  MinhasDevocionais+CollectionView.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit


extension MinhaDevocionalViewController: UICollectionViewDelegate{
    
    // MARK: Clique na celula
    ///clique na celula leva para a visualizacao do conteudo
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// se nao houver nenhuma criada, começa a criar uma
        if dataDevocional.count == 0 {
            if let vc = storyboard?.instantiateViewController(identifier: "minhadevocionalForms") as?
                        MinhaDevocionalEditaViewController {
                ///adiciona o card que sera apenas editado na proxima view...
                let _ = CoreDataStack.shared.createDevocional(titulo: "", baseBiblica: "", contextualizacao: "", reflexao: "", conclusao: "", aplicacao1: "", aplicacao2: "", aplicacao3: "", backgroundColor: "1", backgroundImage: "crie2", link: "",livro: "",capitulo: "",versiculo: "",data: "")
                self.collectionView?.reloadData()
                vc.edit = false
                vc.delegate = self
                navigationController?.present(vc, animated: true)
                }
        }
        else{
            if let vc = storyboard?.instantiateViewController(identifier: "minhadevocional") as?
                        MinhaDevocionalVisualizaViewController {
                var index = 0
                if searching{
                    index = self.searchDevocional(Titulo: dataFiltred[indexPath.row].titulo!,isSearching: true)
                }
                else{
                    index = self.searchDevocional(Titulo: dataDevocional[indexPath.row].titulo!,isSearching: true)
                }
                vc.devocional = index
                vc.delegate2 = self
                //self.collectionView?.reloadData()
                navigationController?.pushViewController(vc, animated: true)
                }
        }
    }
}

extension MinhaDevocionalViewController:UICollectionViewDataSource{
    // MARK: Quantidade de itens
    ///Retorna a quantidade de itens da collection. Se nao forem os dados do usuario, retorna um item default
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ///nao encontrou nenhum resultado e habilita a empty view
        if dataFiltred.count == 0 && searching == true {
            self.notFound.isHidden = false
            return 0
        }
        self.notFound.isHidden = true
        
        self.dataDevocional = CoreDataStack.shared.getDevocional()
        
        ///empty view
        if dataDevocional.count == 0 && searching == false {
            searchController.searchBar.isHidden = true
            return meuDevocional.count
        }
        ///caso de mostrar a colection filtrada
        searchController.searchBar.isHidden = false
        if searching{
            //self.dataDevocional = dataFiltred
            return dataFiltred.count
        }
        else{
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
            if searching{
                cell.editaCelula(index: indexPath.row, dataDevocional: dataFiltred)
                cell.defineTextColor()
            }
            else{
                cell.editaCelula(index: indexPath.row, dataDevocional: dataDevocional)
                cell.defineTextColor()
            }
        }
        
        ///deixa o background da palavra chave vazio caso nao exista nada adicionado
        if cell.pc1.text == "" {cell.pc1.backgroundColor = nil}
        if cell.pc2.text == "" {cell.pc2.backgroundColor = nil}
        if cell.pc3.text == "" {cell.pc3.backgroundColor = nil}
        
        cellBase = cell
        }
        
        return cellBase
    
    }
}

