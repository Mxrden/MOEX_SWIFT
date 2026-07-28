//
//  ContentView.swift
//  MOEX
//
//  Created by Юра Потапович on 27.07.2026.
//

import SwiftUI

struct SharesView: View {
    @EnvironmentObject var settings: AppSettings
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    SharesView()
}
