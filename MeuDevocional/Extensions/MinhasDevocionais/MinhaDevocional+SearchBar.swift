//
//  MinhaDevocional+SearchBar.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 26/03/22.
//

import Foundation
import UIKit

// MARK: Search bar functions
extension MinhaDevocionalViewController: UISearchBarDelegate, UISearchResultsUpdating{
    
    
    func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.search
        searchController.searchBar.placeholder = "Busque sua devocional..."

        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
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
            //self.dataDevocional = self.dataFiltred
        }
        else {
            searching = false
            self.dataFiltred.removeAll()
            self.dataDevocional = try! CoreDataStack.getDevocional()
        }
        self.collectionView.reloadData()
    }
}

