//
//  AppView.swift
//  iDine
//
//  Created by Luis Francisco Piura Mejia on 8/13/20.
//  Copyright © 2020 Luis Francisco Piura Mejia. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(Order())
    }
}
