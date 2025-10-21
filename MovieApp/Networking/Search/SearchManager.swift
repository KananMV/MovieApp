//
//  SearchManager.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 20.10.25.
//

import Foundation

class SearchManager: SearchUseCase {
    
    let manager = NetworkManager()
    
    func getMovieByQuery(query: String, completion: @escaping ((CoreModel<[MovieResult]>?, String?) -> Void)) {
        manager.request(url: SearchEndpoint.movieSearch(query: query).path, completion: completion)
    }
    
}
