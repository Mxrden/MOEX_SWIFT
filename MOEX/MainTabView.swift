//
//  MainTabView.swift
//  MOEX
//
//  Created by Юра Потапович on 28.07.2026.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SharesView()
                .tabItem{
                    Text("Shares")
                }
                .tag(0)
            IndexesView()
                .tabItem{
                    Text("Indexes")
                }
                .tag(1)
            SettingsVIew()
                .tabItem{
                    Text("Settings")
                }
                .tag(2)
        }
    }
}

