//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Shamkhal Guliyev on 02.10.25.
//

import Foundation

struct HomeModel: Codable, HomeCellProtocol {
    var titleLabelText: String { title }
    var movieResult: [MovieResult] { movies }
    
    let title: String
    let movies: [MovieResult]
}

final class HomeViewModel {
    private let manager = HomeManager()
    
    var items = [HomeModel]()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getMovieData() {
        getPopularMovies()
        getUpcomingMovies()
        getTopRatedMovies()
        getNowPlayingMovies()
    }
    
    func getPopularMovies() {
        manager.getPopularMovies { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Popular Movies", movies: data.results ?? []))
                self.success?()
            }
        }
    }
    
    func getNowPlayingMovies() {
        manager.getNowPlayingMovies { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Now Playing", movies: data.results ?? []))
                self.success?()
            }
        }
    }
    
    func getTopRatedMovies() {
        manager.getTopRatedMovies { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Top Rated", movies: data.results ?? []))
                self.success?()
            }
        }
    }
    
    func getUpcomingMovies() {
        manager.getUpcomingMovies { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Upcoming", movies: data.results ?? []))
                self.success?()
            }
        }
    }
}
