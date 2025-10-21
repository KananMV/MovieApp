//
//  MovieDetailsCordinator.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 16.10.25.
//

import UIKit

class MovieDetailsCordinator: Cordinator {
    
    var navigation: UINavigationController
    var movieId: Int
    
    init(navigation: UINavigationController, movieId: Int) {
        self.navigation = navigation
        self.movieId = movieId
    }
    
    func start() {
        let controller = MovieDetailsController(viewModel: .init(id: movieId))
        navigation.show(controller, sender: nil)
    }
    
    
}
