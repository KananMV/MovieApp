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
        getPopularMovies {
            self.getUpcomingMovies {
                self.getTopRatedMovies {
                    self.getNowPlayingMovies {
                        print("All data fetched in order!")
                    }
                }
            }
        }
    }

    private func getPopularMovies(completion: @escaping () -> Void) {
        manager.getPopularMovies(page: 1) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Popular Movies", movies: data.results ?? []))
                self.success?()
            }
            completion()
        }
    }

    private func getUpcomingMovies(completion: @escaping () -> Void) {
        manager.getUpcomingMovies(page: 1) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Upcoming", movies: data.results ?? []))
                self.success?()
            }
            completion()
        }
    }

    private func getTopRatedMovies(completion: @escaping () -> Void) {
        manager.getTopRatedMovies(page: 1) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Top Rated", movies: data.results ?? []))
                self.success?()
            }
            completion()
        }
    }

    private func getNowPlayingMovies(completion: @escaping () -> Void) {
        manager.getNowPlayingMovies(page: 1) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: "Now Playing", movies: data.results ?? []))
                self.success?()
            }
            completion()
        }
    }
}
