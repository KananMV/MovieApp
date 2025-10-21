//
//  SearchUseCase.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 20.10.25.
//

import Foundation
protocol SearchUseCase {
    func getMovieByQuery(page: Int, query: String, completion: @escaping ((CoreModel<[MovieResult]>?, String?) -> Void))
}
