//
//  TabView.swift
//  mini-challenge-2
//
//  Created by William on 29/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ReviewView()
            ProfileView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
