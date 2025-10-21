//
//  SearchManager.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 20.10.25.
//

import Foundation

class SearchManager: SearchUseCase {
    
    let manager = NetworkManager()
    
    func getMovieByQuery(page: Int,query: String, completion: @escaping ((CoreModel<[MovieResult]>?, String?) -> Void)) {
        manager.request(url: SearchEndpoint.movieSearch(query: query, page: page).path, completion: completion)
    }
    
}
