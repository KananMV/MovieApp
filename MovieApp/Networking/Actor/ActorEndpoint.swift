//
//  ActorEndpoint.swift
//  MovieApp
//
//  Created by Shamkhal Guliyev on 07.10.25.
//

import Foundation

enum ActorEndpoint {
    case popularActors
    case actorMovie(actorId: Int)
    
    var path: String {
        switch self {
        case .popularActors:
            return NetworkingHelper.shared.configureURL(endpoint: "person/popular")
        case .actorMovie(let actorId):
            return NetworkingHelper.shared.configureURL(endpoint: "person/\(actorId)/movie_credits")
        }
    }
}
