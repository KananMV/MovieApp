//
//  CoreModel.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 16.10.25.
//

import Foundation

struct CoreModel <T: Codable>: Codable {
    
    
    let page: Int?
    let results: T?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
