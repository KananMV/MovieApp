//
//  HomeManager.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import Foundation

class HomeManager: HomeUseCase {
    private let manager = NetworkManager()
    
    func getNowPlayingMovies(page: Int ,completion: @escaping ((Movie?, String?) -> Void)) {
        manager.request(url: HomeEndpoint.nowPlaying(page: page).path,
                        model: Movie.self,
                        completion: completion)
    }
    
    func getTopRatedMovies(page: Int,completion: @escaping ((Movie?, String?) -> Void)) {
        manager.request(url: HomeEndpoint.topRated(page: page).path,
                        model: Movie.self,
                        completion: completion)
    }
    
    func getUpcomingMovies(page: Int,completion: @escaping ((Movie?, String?) -> Void)) {
        manager.request(url: HomeEndpoint.upcoming(page: page).path,
                        model: Movie.self,
                        completion: completion)
    }
    
    
    func getPopularMovies(page: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        manager.request(url: HomeEndpoint.popularMovies(page: page).path,
                        model: Movie.self,
                        completion: completion)
    }
    
    
    
    
}
