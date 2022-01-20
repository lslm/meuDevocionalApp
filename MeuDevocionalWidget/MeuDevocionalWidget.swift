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
        SimpleEntry(date: Date(),gratidao: [""],background: [""])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),gratidao: [""],background: [""])
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let gratidao = UserDefaultsManager.shared.gratidao
            let background = UserDefaultsManager.shared.background
            let entry = SimpleEntry(date: entryDate,
                                    gratidao: gratidao ?? ["Crie um novo motivo"],
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

func changeColor(string: String, isPersonal: Bool) -> String{
    let colors  = ["Verde2","Amarelo1","Amarelo2","Amarelo3"]
    if isPersonal == true{
        if string == "postit1"{
            return colors[0]
        }
        else if string == "postit2"{
            return colors[1]
        }
        else if string == "postit3"{
            return colors[2]
        }
        else if string == "postit4"{
            return colors[3]
        }
        else{
            return colors[Int.random(in: 0..<colors.count)]
        }
    }
    else{
        return colors[Int.random(in: 0..<colors.count)]
    }
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

func setVersisculo(gratidao: String) -> String{
    ///array com as notificações do app
    var titulo = widgetsTitle
    var corpo = widgetsContent
    
    for _ in 0..<8{
        ///adicionando novos conteúdos ao corpo do widget
        titulo.append("")
        corpo.append(gratidao)
    }
    
    let index = Int.random(in: 0..<titulo.count)
    let content = "\(titulo[index])\n\(corpo[index])"
    return content
}
///funcao auxiliar que checa se o conteudo é diretamente do mural
func isPersonal(gratidao: String, nota: String) -> Bool{
    if gratidao == nota{
        return true
    }
    return false
}


struct MeuDevocionalWidgetEntryView : View {
    var entry: Provider.Entry

    
    var body: some View {
        let index = Int.random(in: 0..<entry.gratidao.count)
        let motivo = setVersisculo(gratidao: entry.gratidao[index])
        let color = entry.background[index]
        let isPersonal = isPersonal(gratidao: motivo, nota: entry.gratidao[index])
        let newColor = changeColor(string: color, isPersonal: isPersonal)
        let textColor = changeText(string: newColor)
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
                        .font(Font.system(size: 11, weight: .regular, design: .monospaced))
                        .multilineTextAlignment(.center)
                        .font(Font.system(.body))
                        .padding()
                    Spacer()
                    Text(entry.date, style: .time).padding()
                        .font(Font.system(size: 11, weight: .regular, design: .monospaced))
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
        
        MeuDevocionalWidgetEntryView(entry: SimpleEntry(date: Date(),gratidao: gratidao ?? ["Crie um novo motivo"], background: background ?? ["novaCor"]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
