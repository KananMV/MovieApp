//
//  ActorUseCase.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 09.10.25.
//

import Foundation

protocol ActorUseCase {
    func getPopularActors(completion: @escaping ((Actor?, String?) -> Void))
    
    func getActorMovieById(id: Int,completion: @escaping ((MovieCredit?, String?) -> Void ))
}
