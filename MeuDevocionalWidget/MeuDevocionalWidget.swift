//
//  MeuDevocionalWidget.swift
//  MeuDevocionalWidget
//
//  Created by Beatriz Duque on 19/01/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),gratidao: [""],background:[""])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),gratidao: [""],background: [""])
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 60 * 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            
            let gratidao = UserDefaultsManager.shared.gratidao
            let background = UserDefaultsManager.shared.background
            let entry = SimpleEntry(date: entryDate,
                                    gratidao: gratidao ?? ["Que tal adicionar um novo motivo?"],
                                    background: background ?? ["postit1"])
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let gratidao: [String]
    let background: [String]
}

func changeColor() -> String{
    let colors  = ["Verde2","Amarelo1","Amarelo2","Amarelo3"]
    return colors[Int.random(in: 0..<colors.count)]
}

func changeText(string: String) -> String{
    if string == "Verde2"{
        return "Amarelo3"
    }
    else if string == "Amarelo1"{
        return "Amarelo3"
    }
    else if string == "Amarelo2"{
        return "Verde1"
    }
    else if string == "Amarelo3"{
        return "Amarelo1"
    }
    else{
        //let path = string
        return "Amarelo3"
    }
}

func setVersisculo(gratidao: [String]) -> String{
    ///array com as notificações do app

    var titulo = widgetsTitle
    var corpo = widgetsContent
    
    for i in 1..<gratidao.count{
        ///adicionando novos conteúdos ao corpo do widget
        titulo.append("")
        corpo.append(gratidao[i])
    }
    
    let index = Int.random(in: 0..<titulo.count)
    var content = "\(titulo[index])\n\(corpo[index])"
    
    if content == ""{
        content = "Lembre dos seus motivos de gratidão"
    }
    
    return content
}
func changeDate() -> DateFormatter{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "pt-br")
    dateFormatter.dateStyle = .short
    return dateFormatter
}

struct MeuDevocionalWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        
        let gratidoes = entry.gratidao
        //let cores = entry.background
        ///seta um motivo aleatorio do que esta no userDefaults
        let motivo = setVersisculo(gratidao: gratidoes)
        let newColor = changeColor()
        let textColor = changeText(string: newColor)
        let df = changeDate()
        ///tirar o comentario caso queira adicionar imagem de fundo
        //let imageNew = (UIImage(contentsOfFile: SalvarImagem.getFilePath(fileName: newColor)))
        //let sub = UIImage(named: "VarianteEmpty")
        
        GeometryReader{ geometry in
            ZStack{
                Color(uiColor: UIColor(named: newColor) ?? .systemYellow)
                //Image(uiImage: (imageNew) ?? sub!)
                   //.resizable().scaledToFit()
                   // .luminanceToAlpha()
                   // .foregroundColor(.red)
                VStack{
                    Text(motivo)
                        .foregroundColor(Color(uiColor: UIColor(named: textColor) ?? .systemYellow))
                        .frame(maxWidth: .infinity ,maxHeight: .infinity,alignment: .center)
                        .font(Font.system(size: 11, weight: .bold, design: .monospaced))
                        .multilineTextAlignment(.center)
                        .font(Font.system(.body))
                        .padding()
                    Spacer()
                    let strDate = df.string(from: entry.date)
                    Text(strDate).padding()
                        .font(Font.system(size: 10, weight: .regular, design: .monospaced))
                        .frame(maxWidth: .infinity ,maxHeight: geometry.size.height/6,alignment: .center)
                        .foregroundColor(Color(uiColor: UIColor(named: textColor) ?? .systemYellow))
                }
            }
        }
        
    }
}

@main
struct MeuDevocionalWidget: Widget {
    let kind: String = "MeuDevocionalWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MeuDevocionalWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct MeuDevocionalWidget_Previews: PreviewProvider {
    static var previews: some View {
        let gratidao = UserDefaultsManager.shared.gratidao
        let background = UserDefaultsManager.shared.background
        
        MeuDevocionalWidgetEntryView(entry: SimpleEntry(date: Date(),gratidao: gratidao ?? ["Lembre dos seus motivos de gratidão"], background: background ?? ["novaCor"]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .environment(\.locale, Locale(identifier: "pt-br"))

    }
}
