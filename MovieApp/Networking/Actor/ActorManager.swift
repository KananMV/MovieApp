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
        manager.request(url: ActorEndpoint.actorMovie(actorId: id).path, model: MovieCredit.self, completion: completion)
    }
    
    func getPopularActors(page: Int, completion: @escaping ((Actor?, String?) -> Void)) {
        manager.request(url: ActorEndpoint.popularActors(page: page).path, model: Actor.self, completion: completion)
    }
}
