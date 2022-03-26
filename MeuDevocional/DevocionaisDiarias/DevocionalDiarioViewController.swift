//
//  DevocionalDiarioViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 15/07/21.
//

import UIKit
import UserNotifications

class DevocionalDiarioViewController: UIViewController {
    
    let reuseIdentifier0 = "cellRapidas"
    let reuseIdentifier = "cell"
    let reuseIdentifier2 = "cell2"
    let reuseIdentifier3 = "cell3"
    
    /// capas de cada colection
    let capaCotidiano = ["cotidiano1","cotidiano2","cotidiano3","cotidiano4","cotidiano5"]
    let capaVida = ["vida1","vida2","vida3","vida4","vida5","vida6"]
    let capaEstudos = ["estudos1","estudos2","estudos3","estudos4","estudos5"]

    // MARK: Declaracao de variaveis
    /// colections
    @IBOutlet weak var rapidas: UICollectionView!
    
    @IBOutlet weak var cotidiano: UICollectionView!
    
    @IBOutlet weak var vida: UICollectionView!
    
    @IBOutlet weak var estudos: UICollectionView!
    
    
    /// titulo da pagina
    @IBOutlet weak var naviTitle: UINavigationItem!
    
    /// titulos das colecoes
    @IBOutlet weak var tituloCotidiano: UILabel?
    @IBOutlet weak var tituloVida: UILabel?
    @IBOutlet weak var tituloEstudos: UILabel?
    
    /// variavel de conexao com o Banco de dados
    var isConect = false
    var devocionaisRapidas: [Devocional]?
    

    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.openOnboardFirstRun()
        
        DataManager.shared.loadData{
            self.devocionaisRapidas = DataManager.shared.devocionaisRapidas
            self.devocionaisRapidas = self.devocionaisRapidas?.reversed() //reverte o vetor pra mais nova sempre ficar no começo
            self.isConect = DataManager.shared.isConect
            self.rapidas.reloadData()
        }
        
        //transformando o titulo
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "Accent")]
        //chama a solicitacao de notificacao
        self.criaNotif()
        ///delegate e dataSource das devocionais rapidas
        self.rapidas.delegate = self
        self.rapidas.dataSource = self
        
    }
    
    // MARK: Onboard
    
    @IBAction func openOnboard(_ sender: Any) {
        print("clicou")
        let vc = OnboardViewController(isOnboarding: true)
        present(vc, animated: true, completion: nil)
    }
    
    func openOnboardFirstRun(){
        let isFirstRun = defaults.bool(forKey: "isMyFirstRun")
        ///colocado como false pq o user default ja inicia como false
        if isFirstRun == false{
            let vc = OnboardViewController(isOnboarding: true)
            present(vc, animated: true, completion: nil)
            defaults.set(true,forKey: "isMyFirstRun")
        }
    }
    
    // MARK: Notificacao
    func criaNotif(){
        /// pedindo permissão
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound]){
            (granted,error) in
        }
        /// criando o conteudo da notificacao
        let rand = Int.random(in: 0..<ConteudoNotificacoes.shared.notfTitles.count)
        let content = UNMutableNotificationContent()
        content.title = ConteudoNotificacoes.shared.notfTitles[rand]
        content.body = ConteudoNotificacoes.shared.notfContents[rand]
        
        //criando o intervalo de tempo
        //86200 = 24h
        //43200 = metade de 1 dia
        //5 para testes
        
        let date = Date().addingTimeInterval(86200)
        let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        /// criando o request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        /// registrando no notification center
        center.add(request){
            (error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error Local notification")")
            }
        }
        
    }
}

// MARK: Collection View
extension DevocionalDiarioViewController: UICollectionViewDelegate{
    /// funcao que faz passar para dentro do estudo devocional (ao clicar na cell)
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
        }else if collectionView == rapidas{
            if self.isConect == true{
                if let vc = storyboard?.instantiateViewController(identifier: "leituraRapida") as?
                    DevocionalDiarioRapidoViewController {
                    vc.devocional = devocionaisRapidas?[indexPath.row]
                    navigationController?.pushViewController(vc, animated: true)
                }
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
}
