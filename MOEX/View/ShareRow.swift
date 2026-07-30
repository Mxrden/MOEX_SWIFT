//
//  ShareRow.swift
//  MOEX
//
//  Created by Юра Потапович on 30.07.2026.
//

import Foundation
import SwiftUI

struct ShareRow: View {
    let share: Share
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(share.shortName ?? share.secid).font(.headline)
                Text(share.secid).font(.caption).foregroundStyle(.secondary)
            }
            
            Spacer()
            
            VStack (alignment: .trailing){
                if let price = share.prevPrice {
                    Text(String(format: "%.2f", price)).font(.headline)
                }
                if let change = share.lastChangePrcnt {
                    Text(String(format: "%.2f", change)).foregroundColor(change >= 0 ? .green : .red)
                }
            }
        }
        .padding(.vertical, 4)
    }
}
