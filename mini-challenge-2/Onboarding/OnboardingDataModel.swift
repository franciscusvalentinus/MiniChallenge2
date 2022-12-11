//
//  OnboardingModel.swift
//  Onboarding
//
//  Created by Putu Denisa Florence Satriani on 14/07/2022.
//  Copyright © 2022 Putu Denisa Florence Satriani. All rights reserved.
//

import Foundation

struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(image: "logo", heading: "Welcome to Cakuy", text: "The best place to see people’s review of their favorite food"),
        OnboardingDataModel(image: "1", heading: "Meet people who inspired you", text: "Find out how people’s give some reviews of their recommended food and order yours"),
        OnboardingDataModel(image: "2", heading: "Give your own review", text: "Give reviews of your recommended food and share to everyone"),
    ]
}
