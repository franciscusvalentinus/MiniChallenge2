//
//  BesarPorsiEnum.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

enum BesarPorsi {
    case pelit
    case baja
    case pas
    case kuli
}

class Portion {
    func getPortionSizeConvertedString(portionSize: BesarPorsi) -> String {
        switch portionSize {
        case .pelit:
            return "Pelit 😡"
        case .baja:
            return "B aja 🤐"
        case .pas:
            return "Pas 🙂"
        case .kuli:
            return "Kuli 😀"
        }
    }

    func getPortionString(portion: String) -> String {
        let portionString: String = portion.lowercased()
        switch portionString {
        case "pelit":
            return getPortionSizeConvertedString(portionSize: BesarPorsi.pelit)
        case "baja":
            return getPortionSizeConvertedString(portionSize: BesarPorsi.baja)
        case "pas":
            return getPortionSizeConvertedString(portionSize: BesarPorsi.pas)
        case "kuli":
            return getPortionSizeConvertedString(portionSize: BesarPorsi.kuli)
        default:
            return "Tidak ada informasi"
        }
    }
}
