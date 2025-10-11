//
//  HomeEndpoint.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import Foundation

enum HomeEndpoint: String {
    case popularMovies = "movie/popular"
    case nowPlaying = "movie/now_playing"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    
    var path: String {
        return NetworkingHelper.shared.configureURL(endpoint: self.rawValue)
    }
}
