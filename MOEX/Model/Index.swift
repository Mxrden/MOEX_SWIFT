//
//  Share.swift
//  MOEX
//
//  Created by Юра Потапович on 28.07.2026.
//

import Foundation

struct Index {
    let secid: String
    let shortName: String?
    let prevPrice: Double?
    let lastChangePrcnt: Double?
    let open: Double?
    let low: Double?
    let high: Double?
    let volToday: Int?
    let sysTime: Date?
    
    init?(dictionary: [String: Any]) {
        guard let secid = dictionary["SECID"] as? String else { return nil }
        self.secid = secid
        self.shortName = dictionary["SHORTNAME"] as? String
        self.prevPrice = dictionary["PREVPRICE"] as? Double
        self.lastChangePrcnt = dictionary["LASTCHANGEPRCNT"] as? Double
        self.open = dictionary["OPEN"] as? Double
        self.low = dictionary["LOW"] as? Double
        self.high = dictionary["HIGH"] as? Double
        
        if let vol = dictionary["VOLTODAY"] as? Int {
            self.volToday = vol
        } else if let volStr = dictionary["VOLTODAY"] as? String, let vol = Int(volStr) {
            self.volToday = vol
        } else {
            self.volToday = nil
        }
        
        //Парсинг
        if let sysStr = dictionary["SYSTIME"] as? String {
            self.sysTime = DateFormatter.moexDateTime.date(from: sysStr)
        } else {
            self.sysTime = nil
        }

    }
}
