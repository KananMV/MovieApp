//
//  MovieDetailsManager.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 12.10.25.
//

import Foundation

class MovieDetailsManager: MovieDetailsUseCase {
    
    
    let manager = NetworkManager()
    
    func getMovieDetailsById(id: Int, completion: @escaping ((AllMovieDetails?, String?) -> Void)) {
        manager.request(url: MovieDetailsEndpoint.movieById(id: id).path, model: AllMovieDetails.self, completion: completion)
    }
    
    func getSimilarMovieById(id: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        manager.request(url: MovieDetailsEndpoint.similarsById(id: id).path, model: Movie.self, completion: completion)
    }
    
}
