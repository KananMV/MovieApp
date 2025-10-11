//
//  ActorViewModel.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import Foundation

class ActorViewModel {
    var items = [ActorResult]()
    let manager = ActorManager()
    
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPopularActors() {
        manager.getPopularActors { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items = data.results ?? []
                self.success?()
            }
        }
    }
}
