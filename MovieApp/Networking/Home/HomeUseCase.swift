//
//  HomeUseCase.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import Foundation

protocol HomeUseCase {
    func getPopularMovies(page: Int, completion: @escaping ((Movie?, String?) -> Void))
    func getNowPlayingMovies(page: Int, completion: @escaping ((Movie?, String?) -> Void))
    func getTopRatedMovies(page: Int, completion: @escaping ((Movie?, String?) -> Void))
    func getUpcomingMovies(page: Int, completion: @escaping ((Movie?, String?) -> Void))
}


