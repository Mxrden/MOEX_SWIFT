//
//  MOEXApp.swift
//  MOEX
//
//  Created by Юра Потапович on 27.07.2026.
//

import SwiftUI

@main
struct MOEXApp: App {
    @StateObject private var settings = AppSettings()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(settings)
                .environment(\.locale, Locale(identifier: settings.selectedLanguage))
        }
    }
}
