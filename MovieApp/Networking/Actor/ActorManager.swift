//
//  ActorManager.swift
//  MovieApp
//
//  Created by Shamkhal Guliyev on 07.10.25.
//

import Foundation

class ActorManager: ActorUseCase {
    
    private let manager = NetworkManager()
    
    func getActorMovieById(id: Int,completion: @escaping ((MovieCredit?, String?) -> Void)) {
        manager.request(url: ActorEndpoint.actorMovie(actorId: id).path, completion: completion)
    }
    
    func getPopularActors(page: Int, completion: @escaping ((CoreModel<[ActorResult]>?, String?) -> Void)) {
        manager.request(url: ActorEndpoint.popularActors(page: page).path, completion: completion)
    }
}
