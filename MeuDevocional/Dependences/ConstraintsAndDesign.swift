//
//  ConstraintsAndDesign.swift
//  MeuDevocional
//  Arquivo utilizado para criar funcoes de personalizacao
//  Created by Beatriz Duque on 15/07/21.
//
import UIKit

////configurando titulos
public func editaTituloAmarelo(titulo: UILabel){
    titulo.textColor = amarelo
}

public func editaTituloVerde(titulo: UILabel){
    titulo.textColor = verde
}

///configurando a textField para receber apenas uma quantidade máxima de letras
private var kAssociationKeyMaxLength: Int = 0
extension UITextField {
        @IBInspectable var maxLength: Int {
            get {
                if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                    return length
                } else {
                    return Int.max
                }
            }
            set {
                objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
                addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
            }
        }

        @objc func checkMaxLength(textField: UITextField) {
            guard let prospectiveText = self.text,
                prospectiveText.count > maxLength
                else {
                    return
            }

            let selection = selectedTextRange
            let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
            let substring = prospectiveText[..<indexEndOfText]
            text = String(substring)
            selectedTextRange = selection
        }
}

///classe para validar os inputs do YouTube, Deezer, Spotify e Apple Music
class Validation {
    public func validateYoutube(name: String) ->Bool {
      // Length be 18 characters max and 3 characters minimum, you can always modify.
        let youtubeRegex = "(http(s)?:\\/\\/)?(www\\.|m\\.)?youtu(be\\.com|\\.be)(\\/watch\\?([&=a-z]{0,})(v=[\\d\\w]{1,}).+|\\/[\\d\\w]{1,})"
        let youtubeCheckResult = NSPredicate(format: "SELF MATCHES %@", youtubeRegex)
        return youtubeCheckResult.evaluate(with: name)
    }
    ///https://open.spotify.com/album/6BU9l5h76Oei7yb2lmZIDf?si=Qx0JvzDMTHKDMPSwugXHvA&dl_branch=1
    ///https://open.spotify.com/track/0fhDEhYbDjmcbuFPcwvPCH?si=6607dbc471774973
    ///https://open.spotify.com/playlist/4M2ZG2z8OlsgVd5OvWuqX7?si=739077540ddd41c9
    public func validateSpotify(name: String) ->Bool {
        if name.contains("youtube"){return true}
        else if name.contains("youtu.be"){return true}
        else if name.contains("spotify.com"){return true}
        else if name.contains("https://deezer"){return true}
        else if name.contains ("https://music.apple"){return true}
        return false
    }
}
