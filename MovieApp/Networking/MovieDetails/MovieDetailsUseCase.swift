//
//  MovieDetailsUseCase.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 12.10.25.
//

import Foundation

protocol MovieDetailsUseCase {
    func getMovieDetailsById(id: Int, completion: @escaping ((AllMovieDetails?, String?) -> Void))
    func getSimilarMovieById(id: Int, completion: @escaping ((CoreModel<[MovieResult]>?, String?) -> Void))
}
