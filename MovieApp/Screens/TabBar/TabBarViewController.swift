//
//  TabBarControllerViewController.swift
//  CarRent
//
//  Created by Kenan Memmedov on 08.09.25.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    private func setupAppearance() {
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .gray
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        setupVC()
    }
    
    private func setupVC() {
        let homeVC = HomeController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let actorVC = ActorController()
        let actorNav = UINavigationController(rootViewController: actorVC)
        actorNav.tabBarItem = UITabBarItem(title: "Actors", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
      
        
        viewControllers = [homeNav, actorNav]
        
        
    }

}
