//
//  CategoryViewModel.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 11.10.25.
//

import Foundation

enum CategoryType {
    case popular
    case nowPlaying
    case topRated
    case upcoming
    
    var title: String {
        switch self {
        case .popular: return "Popular Movies"
        case .nowPlaying: return "Now Playing"
        case .topRated: return "Top Rated"
        case .upcoming: return "Upcoming"
        }
    }
}

final class CategoryViewModel {
    private let manager = HomeManager()
    var movies = [MovieResult]()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func fetchCategory(_ type: CategoryType) {
        switch type {
        case .popular:
            manager.getPopularMovies { data, errorMessage in
                self.handleResponse(data: data, errorMessage: errorMessage)
            }
        case .nowPlaying:
            manager.getNowPlayingMovies { data, errorMessage in
                self.handleResponse(data: data, errorMessage: errorMessage)
            }
        case .topRated:
            manager.getTopRatedMovies { data, errorMessage in
                self.handleResponse(data: data, errorMessage: errorMessage)
            }
        case .upcoming:
            manager.getUpcomingMovies { data, errorMessage in
                self.handleResponse(data: data, errorMessage: errorMessage)
            }
        }
    }
    
    private func handleResponse(data: Movie?, errorMessage: String?) {
        if let errorMessage {
            error?(errorMessage)
        } else if let data {
            movies = data.results ?? []
            success?()
        }
    }
}
