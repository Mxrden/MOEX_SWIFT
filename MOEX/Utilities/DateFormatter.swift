//
//  DateFormatters.swift
//  MOEX
//
//  Created by Юра Потапович on 28.07.2026.
//

import Foundation

extension DateFormatter {
    static let moexDateTime: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        df.locale = Locale(identifier: "en_US_POSIX")
        return df
    }()
}
