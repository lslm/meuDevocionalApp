//
//  CollectionViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 28/07/21.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

var minhasDevocionais: [CollectionItem] = []
let reuseIdentifier4 = "cell4"

class MinhaDevocionalViewController: UIViewController,NSFetchedResultsControllerDelegate {

    @IBOutlet var collectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var notFound: UIImageView!
    
    var searching = false
    var dataDevocional: [Devocionais] = []
    var dataFiltred: [Devocionais] = []
    
    // MARK: Fetch Data
    private lazy var fetchResultController: NSFetchedResultsController<Devocionais> = {
        let request: NSFetchRequest<Devocionais> = Devocionais.fetchRequest() 
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Devocionais.data, ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: request,
                                             managedObjectContext: CoreDataStack.shared.context,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "Accent")]

        //navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "Accent")]
        
        super.viewDidLoad()
        self.notFound.isHidden = false
        collectionView.delegate = self
        collectionView.dataSource = self
        self.configureSearchController()
        
        ///gesto para excluir a celula se for pressionada
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        collectionView.addGestureRecognizer(longPress)
        
        ///fetch results
        do {
            try fetchResultController.performFetch()
            self.dataDevocional = fetchResultController.fetchedObjects ?? []
        } catch {
            fatalError("Nao foi possivel atualizar conteudo")
        }
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
        let novaDevocional = CoreDataStack.shared.createDevocional(titulo: "", baseBiblica: "", contextualizacao: "", reflexao: "", conclusao: "", aplicacao1: "", aplicacao2: "", aplicacao3: "", backgroundColor: "1", backgroundImage: "crie2", link: "",livro: "",capitulo: "",versiculo: "",data: "")
        self.collectionView?.reloadData()
        let vc = segue.destination as! MinhaDevocionalEditaViewController
        vc.devocional = novaDevocional
        vc.edit = false
        vc.delegate = self
   }
    
    
    // MARK: Coleta de dados
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //guard let devocionais = controller.fetchedObjects as? [Devocionais] else { return }
        let devocionais = CoreDataStack.shared.getDevocional()
        self.dataDevocional = devocionais
        self.collectionView.reloadData()
    }
    
    
    ///funcao auxiliar que busca a devocional atraves do titulo
    func searchDevocional(Titulo: String, isSearching: Bool) -> Devocionais? {
        let devocionaisAtuais = self.dataDevocional
        var index = 0
        for i in 0..<devocionaisAtuais.count{
            if (devocionaisAtuais[i].titulo!.lowercased()) == (Titulo.lowercased()){
               return devocionaisAtuais[i]
            }
        }
        return nil
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
                            if let devocional = self?.searchDevocional(Titulo: self?.dataDevocional[indexPath.item].titulo ?? "", isSearching: false){
                                do{
                                    try CoreDataStack.shared.deleteDevocional(devocionais: devocional)
                                }catch{
                                    print(error)
                                }
                            }
                           
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
extension MinhaDevocionalViewController: MinhaDevocionalEditaViewControllerDelegate{
    func didRegister(){
        ///para a adicao
        collectionView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension MinhaDevocionalViewController: MinhaDevocionalVisualizaViewControllerDelegate {
    ///para a edicao
    func didRegisterEdicoes(){
        collectionView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
