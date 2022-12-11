//
//  ImageExistence.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 24/06/22.
//

import SwiftUI

enum ListReviewImageExistence {
    case doesNotExist
    case doesExist(imageString: String)
}

enum detailReviewImageExistence {
    case doesNotExist
    case doesExist(imageString: [String])
}
