//
//  OnboardingStepView.swift
//  Onboarding
//
//  Created by Putu Denisa Florence Satriani on 14/07/2022.
//  Copyright © 2022 Putu Denisa Florence Satriani. All rights reserved.
//

import SwiftUI

struct OnboardingStepView: View {
    var data: OnboardingDataModel
    
    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 50)
            
            Text(data.heading)
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text(data.text)
                .font(.system(size: 17, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.bottom,90)
            HStack {
                
                //Text("skip")
                  //  .font(.system(size: 17, design: .default))
                
                    
                Spacer()
                    
                
            }
        }
        .padding()
        .contentShape(Rectangle())
        
    }
                      }

struct OnboardingStepView_Previews: PreviewProvider {
    static var data = OnboardingDataModel.data[0]
    static var previews: some View {
        OnboardingStepView(data: data)
    }
}
