//
//  Review.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

class ReviewHandler {
    func getReviewConvertedString(review: Int) -> String {
        switch review {
        case 5:
            return "Gila Banget 😱"
        case 4:
            return "Maknyus 🤤"
        case 3:
            return "B aja 😗"
        case 2:
            return "Gak enak 🤢"
        case 1:
            return "Nyesel beli 😤"
        default:
            return "Tidak ada informasi"
        }
    }
    func getReviewEmoji(review: Int) -> String{
        switch review {
        case 5:
            return "😱"
        case 4:
            return "🤤"
        case 3:
            return "😗"
        case 2:
            return "🤢"
        case 1:
            return "😤"
        default:
            return "Tidak ada informasi"
        }
    }
    func getReviewConvertedStringOnly(review: Int) -> String {
        switch review {
        case 5:
            return "Gila Banget"
        case 4:
            return "Maknyus"
        case 3:
            return "B aja"
        case 2:
            return "Gak enak"
        case 1:
            return "Nyesel beli"
        default:
            return "Tidak ada informasi"
        }
    }
}
