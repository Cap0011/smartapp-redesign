//
//  MainTabBarController.swift
//  SmartDesign
//
//  Created by Jiyoung Park on 2022/07/10.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNC = UINavigationController(rootViewController: MainViewController())
        let searchNC = UINavigationController(rootViewController: SearchViewController())
        let profileNC = UINavigationController(rootViewController: ProfileViewController())
        
        self.viewControllers = [homeNC, searchNC, profileNC]
        
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        let searchTabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        let profileTabBarItem = UITabBarItem(title: "My Page", image: UIImage(systemName: "person.fill"), tag: 2)
        
        
        homeNC.tabBarItem = homeTabBarItem
        searchNC.tabBarItem = searchTabBarItem
        profileNC.tabBarItem = profileTabBarItem
    }
}
