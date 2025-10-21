//
//  Cordinator.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 16.10.25.
//

import UIKit

protocol Cordinator {
    var navigation: UINavigationController { get }
    func start()
}
