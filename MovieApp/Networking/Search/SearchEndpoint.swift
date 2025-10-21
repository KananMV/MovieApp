//
//  SearchEndpoint.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 20.10.25.
//

import Foundation

enum SearchEndpoint {
    case movieSearch(query: String, page: Int)
    
    var path: String {
        switch self {
        case .movieSearch(let query, let page):
            return NetworkingHelper.shared.configureURL(endpoint: "search/movie?query=\(query)&page=\(page)")
        }
        
    }
}
