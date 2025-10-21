//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 19.10.25.
//

import Foundation

class SearchViewModel {
    var manager = SearchManager()
    var homeManager = HomeManager()
    
    
    var items = [MovieResult]()
    private var data: CoreModel<[MovieResult]>?
    var defaultItems = [MovieResult]()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getSearchedMovieData(query: String) {
        manager.getMovieByQuery(query: query) { data, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
                self.error?(errorMessage)
            } else if let data = data {
                self.items = data.results ?? []
                self.success?()
            }
        }
    }
    
    func getMovieData() {
        let page = (data?.page ?? 0) + 1
        
        homeManager.getPopularMovies(page: page) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.data = data
                self.defaultItems.append(contentsOf: data.results ?? [])
                self.success?()
            }
        }
    }
    
    func pagination(index: Int) {
        guard let page = data?.page else { return }
        guard let totalPages = data?.totalPages else { return }
        
        if index == defaultItems.count - 2 && page < totalPages {
            getMovieData()
        }
    }
}
