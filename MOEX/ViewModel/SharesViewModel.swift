//
//  SharesViewModel.swift
//  MOEX
//
//  Created by Юра Потапович on 30.07.2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class SharesViewModel: ObservableObject {
    @Published var shares: [Share] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = MOEXService()

    func loadShares() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let result = try await service.fetchShares()
            shares = result
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
