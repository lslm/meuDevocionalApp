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
        SimpleEntry(date: Date(),gratidao: "",background: "")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),gratidao: "",background: "")
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
                                    gratidao: gratidao ?? "Crie um novo motivo",
                                    background: background ?? "postit1")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let gratidao: String
    let background: String
}

func changeColor(string: String) -> String{
    let colors  = ["Verde2","Amarelo1","Amarelo2","Amarelo3"]
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

func changeText(string: String) -> String{
    if string == "Verde2"{
        return "Amarelo3"
    }
    else if string == "Amarelo1"{
        return "Amarelo3"
    }
    else if string == "Amarelo2"{
        return "Verde2"
    }
    else if string == "Amarelo3"{
        return "Amarelo1"
    }
    else{
        let path = string
        return "Amarelo3"
    }
}

func setVersisculo(gratidao: String) -> String{
    if gratidao != ""{
        return gratidao
    }
    ///array com as notificações do app
    let notfTitles: [String] = ["Meu Devocional","Gratidão","Worship Time!","Salmo 37:5","Mateus 6:34","João 3:16","Colossenses 3:4","Momento de oração","Mateus 11:21","Mateus 22:37", "Romanos 8:38"]
    let notfContents: [String] = ["Não esqueça de anotar e compartilhar a devocional de hoje!","Já adicionou um motivo para ser grato no Mural hoje?","Que tal escolher uma devocional para leitura e louvor hoje?","'Entrega o teu caminho ao Senhor; confia nele, e ele tudo fará.'","Portanto, não vos inquieteis com o dia de amanhã, pois o amanhã trará os seus cuidados...","'Porque Deus tanto amou o mundo que deu o seu Filho Unigênito, para que todo o que nele crer não pereça, mas tenha a vida eterna.'","'Acima de tudo, porém, revistam-se do amor, que é o elo perfeito.'","Conta pra Ele, conte com Ele!","'Vinde a mim todos os que estais cansados e oprimidos, e eu vos aliviarei.'","'E Jesus disse-lhe: Amarás o Senhor, teu Deus, de todo o teu coração, e de toda a tua alma, e de todo o teu pensamento.'","'Nem a altura, nem a profundidade, nem alguma outra criatura nos poderá separar do amor de Deus, que está em Cristo Jesus, nosso Senhor!'"]
    let index = Int.random(in: 0..<notfTitles.count)
    let content = "\(notfTitles[index])\n\(notfContents[index])"
    return content
}

struct MeuDevocionalWidgetEntryView : View {
    var entry: Provider.Entry
    
    
    var body: some View {
        let motivo = setVersisculo(gratidao: entry.gratidao)
        let color = entry.background
        let newColor = changeColor(string: color)
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
                        .frame(maxWidth: .infinity ,maxHeight: geometry.size.height/5,alignment: .center)
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
        
        MeuDevocionalWidgetEntryView(entry: SimpleEntry(date: Date(),gratidao: gratidao ?? "Crie um novo motivo", background: background ?? "novaCor"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
