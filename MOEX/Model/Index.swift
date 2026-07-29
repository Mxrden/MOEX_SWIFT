//
//  Index.swift
//  MOEX
//
//  Created by Юра Потапович on 28.07.2026.
//

import Foundation

struct Index {
    let secid: String
    let shortName: String?
    let last: Double?
    let changePrcnt: Double?
    let open: Double?
    let low: Double?
    let high: Double?
    let value: Double?
    let time: Date?

    init?(dictionary: [String: Any]) {
        guard let secid = dictionary["SECID"] as? String else { return nil }
        self.secid = secid
        self.shortName = dictionary["SHORTNAME"] as? String
        self.last = dictionary["LAST"] as? Double
        self.changePrcnt = dictionary["CHANGEPRCNT"] as? Double
        self.open = dictionary["OPEN"] as? Double
        self.low = dictionary["LOW"] as? Double
        self.high = dictionary["HIGH"] as? Double
        self.value = dictionary["VALUE"] as? Double

        //Парсинг
        if let timeStr = dictionary["TIME"] as? String {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            self.time = formatter.date(from: timeStr)
        } else {
            self.time = nil
        }
    }
}
