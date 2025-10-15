//
//  HomeEndpoint.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import Foundation

enum HomeEndpoint {
    case popularMovies(page: Int)
    case nowPlaying(page: Int)
    case topRated(page: Int)
    case upcoming(page: Int)
    
    var path: String {
        switch self {
        case .popularMovies(let page):
            return NetworkingHelper.shared.configureURL(endpoint: "movie/popular?page=\(page)")
        case .nowPlaying(let page):
            return NetworkingHelper.shared.configureURL(endpoint: "movie/now_playing?page=\(page)")
        case .topRated(let page):
            return NetworkingHelper.shared.configureURL(endpoint: "movie/top_rated?page=\(page)")
        case .upcoming(let page):
            return NetworkingHelper.shared.configureURL(endpoint: "movie/upcoming?page=\(page)")
        }
    }
}
