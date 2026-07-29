//
//  MOEXService.swift
//  MOEX
//
//  Created by Юра Потапович on 28.07.2026.
//

import Foundation

class MOEXService {
    private let baseURL = "https://iss.moex.com/iss"
    private let session = URLSession.shared
    
    
    func fetchShares(lang: String = "ru",
                     sortColumn: String = "SHORTNAME", sortOrder: String = "asc") async throws -> [Share] {
        //Построение URL
        var components = URLComponents(string: baseURL + "/engines/stock/markets/shares/boardgroups/57/securities.json")!
        
        components.queryItems = [
            URLQueryItem(name: "lang", value: lang),
            URLQueryItem(name: "sort_column", value: sortColumn),
            URLQueryItem(name: "sort_order", value: sortOrder)
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        //Выполнение запроса
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        //Парсинг JSON
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let securities = json["securities"] as? [String: Any],
              let columns = securities["columns"] as? [String],
              let dataRows = securities["data"] as? [[Any]] else {
            throw URLError(.cannotParseResponse)
        }
        
        //Преобразование в массив
        var shares: [Share] = []
        
        for row in dataRows {
            var dict = [String: Any]()
            for (index, value) in row.enumerated() {
                let key = columns[index]
                if !(value is NSNull) {
                    dict[key] = value
                }
            }
            if let share = Share(dictionary: dict) {
                shares.append(share)
            }
        }
        return shares
    }
    
    func fetchIndexes(lang: String = "ru",
                     sortColumn: String = "SHORTNAME", sortOrder: String = "asc") async throws -> [Index] {
        //Построение URL
        var components = URLComponents(string: baseURL + "/engines/stock/markets/index/boardgroups/9/securities.json")!
        
        components.queryItems = [
            URLQueryItem(name: "lang", value: lang),
            URLQueryItem(name: "sort_column", value: sortColumn),
            URLQueryItem(name: "sort_order", value: sortOrder)
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        //Выполнение запроса
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        //Парсинг JSON
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let securities = json["securities"] as? [String: Any],
              let columns = securities["columns"] as? [String],
              let dataRows = securities["data"] as? [[Any]] else {
            throw URLError(.cannotParseResponse)
        }
        
        //Преобразование в массив
        var indexes: [Index] = []
        
        for row in dataRows {
            var dict = [String: Any]()
            for (index, value) in row.enumerated() {
                let key = columns[index]
                if !(value is NSNull) {
                    dict[key] = value
                }
            }
            if let index = Index(dictionary: dict) {
                indexes.append(index)
            }
        }
        return indexes
    }
    
}
