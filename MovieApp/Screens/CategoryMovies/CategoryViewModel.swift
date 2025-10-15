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
    var data: Movie?
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func fetchCategory(type: CategoryType) {
        let page = data?.page ?? 0
        switch type {
        case .popular:
            manager.getPopularMovies(page: page + 1) { data, errorMessage in
                self.handleResponse(data: data, errorMessage: errorMessage)
            }
        case .nowPlaying:
            manager.getNowPlayingMovies(page: page + 1) { data, errorMessage in
                self.handleResponse(data: data, errorMessage: errorMessage)
            }
        case .topRated:
            manager.getTopRatedMovies(page: page + 1) { data, errorMessage in
                self.handleResponse(data: data, errorMessage: errorMessage)
            }
        case .upcoming:
            manager.getUpcomingMovies(page: page + 1) { data, errorMessage in
                self.handleResponse(data: data, errorMessage: errorMessage)
            }
        }
    }
    
    private func handleResponse(data: Movie?, errorMessage: String?) {
        if let errorMessage {
            error?(errorMessage)
        } else if let data {
            self.data = data
            movies.append(contentsOf: data.results ?? [])
            success?()
        }
    }
    
    func pagination(index: Int, category: CategoryType) {
        guard let page = data?.page else { return }
        guard let totalPages = data?.totalPages else { return }
        
        if index == movies.count - 2 && page < totalPages {
            fetchCategory(type: category)
        }
    }
    
    func reset() {
        data = nil
        movies = []
    }
}
