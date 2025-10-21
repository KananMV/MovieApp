//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 12.10.25.
//

import Foundation

class MovieDetailsViewModel {
    
    let manager = MovieDetailsManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    var items: AllMovieDetails?
    
    var similarItems = [SimilarItemProtocol]()
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func getMovieData() {
        manager.getMovieDetailsById(id: id) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items = data
                self.success?()
            }
        }
    }
    
    func getSimilarMovies() {
        manager.getSimilarMovieById(id: id) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.similarItems = data.results ?? []
                self.success?()
            }
            
        }
    }
}
