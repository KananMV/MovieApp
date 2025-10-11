//
//  HomeManager.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import Foundation

class HomeManager: HomeUseCase {
    private let manager = NetworkManager()
    
    func getNowPlayingMovies(completion: @escaping ((Movie?, String?) -> Void)) {
        manager.request(url: HomeEndpoint.nowPlaying.path,
                        model: Movie.self,
                        completion: completion)
    }
    
    func getTopRatedMovies(completion: @escaping ((Movie?, String?) -> Void)) {
        manager.request(url: HomeEndpoint.topRated.path,
                        model: Movie.self,
                        completion: completion)
    }
    
    func getUpcomingMovies(completion: @escaping ((Movie?, String?) -> Void)) {
        manager.request(url: HomeEndpoint.upcoming.path,
                        model: Movie.self,
                        completion: completion)
    }
    
    
    func getPopularMovies(completion: @escaping ((Movie?, String?) -> Void)) {
        manager.request(url: HomeEndpoint.popularMovies.path,
                        model: Movie.self,
                        completion: completion)
    }
    
    
    
    
}
