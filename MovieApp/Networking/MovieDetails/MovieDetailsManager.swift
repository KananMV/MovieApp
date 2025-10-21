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
        manager.request(url: MovieDetailsEndpoint.movieById(id: id).path, completion: completion)
    }
    
    func getSimilarMovieById(id: Int, completion: @escaping ((CoreModel<[MovieResult]>?, String?) -> Void)) {
        manager.request(url: MovieDetailsEndpoint.similarsById(id: id).path, completion: completion)
    }
    
}
