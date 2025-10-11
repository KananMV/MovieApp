//
//  ActorMovieListViewModel.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import Foundation

class ActorMovieListViewModel {
    
    var items = [MovieResult]()
    let manager = ActorManager()
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getMovies() {
        manager.getActorMovieById(id: id) { data, error in
            if let error {
                print(error)
            } else if let data {
                self.items = data.cast ?? []
                self.success?()
            }
        }
    }
    
}
