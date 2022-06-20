//
//  MuralViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 16/07/21.
//

import UIKit

class MuralViewController: UIViewController {
    var minhaNota = ""
    var selectedIndex: Int = 0
    var isFirstRun = true
    var dataPost1: [Post] = []
    
    @IBOutlet weak var muralCollection: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        dataPost1 = CoreDataStackPost.shared.getPost()
        
        //print("gratidao",UserDefaultsManager.shared.gratidao)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "Accent")]
        muralCollection.dataSource = self
        muralCollection.delegate = self
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
                muralCollection.addGestureRecognizer(longPress)
    }
    
    
    // MARK: Buttons
    
    @IBAction func addButton(_ sender: Any) {
    }
    
    @IBAction func infoView(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "info") as?
                    InfoViewController {
            vc.imagem = "mural"
            navigationController?.present(vc, animated: true, completion: nil)
            }
    }
    
    // MARK: Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //adiciona o card que sera apenas editado na proxima view...
        let _ = CoreDataStackPost.shared.createPost(nota: " ", backgroundImage: "novopost", data: "",color: "Amarelo1")
        muralCollection.reloadData()
        let vc = segue.destination as! MuralEditaViewController
        vc.delegate = self
   }
    
    // MARK: Long press
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        let dataMural = CoreDataStackPost.shared.getPost()
        if sender.state == .began {
            let touchPoint = sender.location(in: muralCollection)
            if let indexPath = muralCollection.indexPathForItem(at: touchPoint) {
                if dataMural.count == 0{
                    let ac = UIAlertController(title: "Não é possível deletar", message: nil, preferredStyle: .actionSheet)
                        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                            [weak self] action in
                            self?.muralCollection.reloadData()
                            
                    }))
                    present(ac, animated: true)
                }
                else{
                let ac = UIAlertController(title: "Deletar '\(dataMural[indexPath.item].nota ?? "NONE")'", message: "O conteúdo não poderá ser recuperado.", preferredStyle: .actionSheet)
                    ac.addAction(UIAlertAction(title: "Deletar", style: .destructive, handler: {
                        [weak self] action in
                        do{
                            try CoreDataStackPost.shared.deletePost(post: dataMural[indexPath.row])
                        }catch{
                            print("nao foi possivel apagar")
                        }
                        
                    self?.muralCollection.reloadData()
                    }))
                    ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                    present(ac, animated: true)}
            }
        }
    }
    
}

// MARK: Delegate
extension MuralViewController: MuralEditaViewControllerDelegate{
    func didRegister(){
        muralCollection.reloadData()
    }
}
