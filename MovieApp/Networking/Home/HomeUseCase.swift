//
//  HomeUseCase.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import Foundation

protocol HomeUseCase {
    func getPopularMovies(completion: @escaping ((Movie?, String?) -> Void))
    func getNowPlayingMovies(completion: @escaping ((Movie?, String?) -> Void))
    func getTopRatedMovies(completion: @escaping ((Movie?, String?) -> Void))
    func getUpcomingMovies(completion: @escaping ((Movie?, String?) -> Void))
}
