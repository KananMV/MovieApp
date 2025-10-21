//
//  HomeUseCase.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import Foundation

protocol HomeUseCase {
    func getPopularMovies(page: Int, completion: @escaping ((CoreModel<[MovieResult]>?, String?) -> Void))
    func getNowPlayingMovies(page: Int, completion: @escaping ((CoreModel<[MovieResult]>?, String?) -> Void))
    func getTopRatedMovies(page: Int, completion: @escaping ((CoreModel<[MovieResult]>?, String?) -> Void))
    func getUpcomingMovies(page: Int, completion: @escaping ((CoreModel<[MovieResult]>?, String?) -> Void))
}


