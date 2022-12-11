//
//  NumberHandler.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI
class NumberFormatting {
    func integerToRupiahString(numberToConvert: Int) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.groupingSeparator = "."
        let numberConverted: String = nf.string(from: numberToConvert as NSNumber) ?? "Tidak ada harga"
        return "Rp. " + numberConverted
    }
}
