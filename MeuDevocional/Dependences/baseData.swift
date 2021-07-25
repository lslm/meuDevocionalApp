//
//  baseData.swift
//  MeuDevocional
//  Nesse arquivo declaro variaveis globais que serao utilizadas no programa
//  Created by Beatriz Duque on 15/07/21.
//


import UIKit
//rgba 0.93, 0.73, 0.49, 1.0
let amarelo = UIColor( red: 0.93, green: 0.73, blue:0.49, alpha: 1.0 )
//rgba 0.55, 0.64, 0.58, 1.0
let verde = UIColor( red: 0.55, green: 0.64, blue: 0.58, alpha: 1.0 )
//rgba 0.97, 0.85, 0.63, 1.0
let amarelo2 = UIColor( red: 0.97, green: 0.85, blue:0.63, alpha: 1.0 )
//rgba 0.99, 0.93, 0.8, 1.0
let amarelo3 = UIColor( red: 0.99, green: 0.93, blue:0.8, alpha: 1.0 )
//rgba 0.18, 0.62, 0.63, 1.0
let verde2 = UIColor(red: 0.18, green: 0.62, blue:0.63, alpha: 1.0)

//base de dados mostrado ao usuário na aba mural
var item0 = CollectionItemMural(nota: "", backgroundImage: UIImage(named:"base1")!)
var item1 = CollectionItemMural(nota: "", backgroundImage: UIImage(named:"base2")!)
var meuMural: [CollectionItemMural] = [item0,item1]

//base de dados mostrado ao usuário na aba Meu Devocional
var devocional0 = CollectionItem(titulo: "Crie sua devocional!", baseBiblica: "Esse é seu espaço", contextualizacao: "", reflexao: "", conclusao: "", aplicacao1: " ", aplicacao2: " ", aplicacao3: " ", backgroundColor: verde, backgroundImage: UIImage(named: "crie1")!,link:"")
var meuDevocional: [CollectionItem] = [devocional0]



///base de dados das devocionais em "Minhas devocionais"
var cotidiano: [CollectionItem] = []
var vidaComDeus: [CollectionItem] = []
var estudos: [CollectionItem] = []


///base de dados que sera alterado pelo usuario
let defaults = UserDefaults.standard
var baseAplicacaoCotidiano1 = ["","","","",""]
var baseAplicacaoCotidiano2 = ["","","","",""]
var baseAplicacaoCotidiano3 = ["","","","",""]
var baseAnotacaoCotidiano = ["","","","",""]


var baseAplicacaoVida1 = ["","","","","",""]
var baseAplicacaoVida2 = ["","","","","",""]
var baseAplicacaoVida3 = ["","","","","",""]
var baseAnotacaoVida = ["","","","","",""]


var baseAplicacaoEstudos1 = ["","","","",""]
var baseAplicacaoEstudos2 = ["","","","",""]
var baseAplicacaoEstudos3 = ["","","","",""]
var baseAnotacaoEstudos = ["","","","",""]

//defaults.set(baseAplicacaoCotidiano1, forKey: "baseAplicacaoCotidiano1")
//defaults.set(baseAplicacaoCotidiano2, forKey: "baseAplicacaoCotidiano2")
//defaults.set(baseAplicacaoCotidiano3, forKey: "baseAplicacaoCotidiano3")
