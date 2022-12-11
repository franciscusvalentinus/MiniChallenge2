//
//  ContentView.swift
//  Onboarding
//
//  Created by Putu Denisa Florence Satriani on 14/07/2022.
//  Copyright © 2022 Putu Denisa Florence Satriani. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @State private var onboardinDone = false
    var data = OnboardingDataModel.data
    
    var body: some View {
        Group {
            if !onboardinDone {
                OnboardingViewPure(data: data, doneFunction: {
                    /// Update your state here
                    self.onboardinDone = true
                    print("done onboarding")
                })
            } else {
                Text("Hello world")
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
