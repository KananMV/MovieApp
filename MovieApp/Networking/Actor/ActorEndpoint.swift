//
//  ActorEndpoint.swift
//  MovieApp
//
//  Created by Shamkhal Guliyev on 07.10.25.
//

import Foundation

enum ActorEndpoint {
    case popularActors(page: Int)
    case actorMovie(actorId: Int)
    
    var path: String {
        switch self {
        case .popularActors(let page):
            return NetworkingHelper.shared.configureURL(endpoint: "person/popular?page=\(page)")
        case .actorMovie(let actorId):
            return NetworkingHelper.shared.configureURL(endpoint: "person/\(actorId)/movie_credits")
        }
    }
}
