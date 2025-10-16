//
//  MovieDetailsEndpoint.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 12.10.25.
//

import Foundation

enum MovieDetailsEndpoint {
    case movieById(id: Int)
    case similarsById(id: Int)
    
    var path: String {
        switch self {
        case .movieById(let id):
            return NetworkingHelper.shared.configureURL(endpoint: "movie/\(id)")
        case .similarsById(id: let id):
            return NetworkingHelper.shared.configureURL(endpoint: "movie/\(id)/similar")
        }
        
    }
}
