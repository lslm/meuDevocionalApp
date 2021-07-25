//
//  DevocionalDiarioViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 15/07/21.
//

import UIKit

class DevocionalDiarioViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "cell"
    let reuseIdentifier2 = "cell2"
    let reuseIdentifier3 = "cell3"
    
    //capas de cada colection
    let capaCotidiano = ["cotidiano1","cotidiano2","cotidiano3","cotidiano4","cotidiano5"]
    let capaVida = ["vida1","vida2","vida3","vida4","vida5","vida6"]
    let capaEstudos = ["estudos1","estudos2","estudos3","estudos4","estudos5"]

    //declaracao de variaveis
    //colections
    @IBOutlet weak var cotidiano: UICollectionView!
    
    @IBOutlet weak var vida: UICollectionView!
    
    @IBOutlet weak var estudos: UICollectionView!
    
    
    //titulo da pagina
    @IBOutlet weak var naviTitle: UINavigationItem!
    
    //titulos das colecoes
    @IBOutlet weak var tituloCotidiano: UILabel?
    @IBOutlet weak var tituloVida: UILabel?
    @IBOutlet weak var tituloEstudos: UILabel?
    
    //configuracao da collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //retorna a quantidade de itens da colectionView
        if collectionView == cotidiano{
            return self.capaCotidiano.count
        }
        else if collectionView == vida {
            return self.capaVida.count
        }
        return self.capaEstudos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cotidiano{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
            editaCelulaDev(cell: cell, array: capaCotidiano, index: indexPath.row)
            return cell
        }
        else if collectionView == vida{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath as IndexPath) as! MyCollectionViewCell
            editaCelulaDev(cell: cell, array: capaVida, index: indexPath.row)
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier3, for: indexPath as IndexPath) as! MyCollectionViewCell
            editaCelulaDev(cell: cell, array: capaEstudos, index: indexPath.row)
            return cell
        }
    }
    
    //funcao que faz passar para dentro do estudo devocional (ao clicar na cell)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == cotidiano {
                if let vc = storyboard?.instantiateViewController(identifier: "devocional") as? DevocionalDiarioEstudoViewController {
                    vc.cell = 1
                    vc.estudo = indexPath.row
                    navigationController?.pushViewController(vc, animated: true)
                }
        }else if collectionView == vida{
            if let vc = storyboard?.instantiateViewController(identifier: "devocional") as?
                DevocionalDiarioEstudoViewController {
                vc.cell = 2
                vc.estudo = indexPath.row
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        else{
            if let vc = storyboard?.instantiateViewController(identifier: "devocional") as?
                DevocionalDiarioEstudoViewController {
                vc.cell = 3
                vc.estudo = indexPath.row
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //transformando o titulo
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: verde]
        
        //personalizando componentes da tela
        //editaTituloVerde(titulo: (tituloCotidiano)!)
        //editaTituloVerde(titulo: (tituloVida)!)
        //editaTituloVerde(titulo: (tituloEstudos)!)
        
        
    }
    
    func editaCelulaDev(cell: MyCollectionViewCell,array: [String],index: Int){
        cell.image.image = UIImage(named: array[index])
        cell.titleCard.text = "Titulo"
        cell.textCard.text = "Referencia"
        cell.titleCard.textColor = verde
        cell.textCard.textColor = verde
        cell.layer.cornerRadius = 15
    }

}
