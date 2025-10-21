//
//  SearchEndpoint.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 20.10.25.
//

import Foundation

enum SearchEndpoint {
    case movieSearch(query: String)
    
    var path: String {
        switch self {
        case .movieSearch(let query):
            return NetworkingHelper.shared.configureURL(endpoint: "search/movie?query=\(query)")
        }
        
    }
}
