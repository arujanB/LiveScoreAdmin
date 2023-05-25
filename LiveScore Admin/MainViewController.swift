//
//  ViewController.swift
//  LiveScore Admin
//
//  Created by Aruzhan Boranbay on 10.05.2023.
//

import UIKit
import SnapKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1)
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .orange
        
        let vc1 = UINavigationController(rootViewController: MatchesViewController())
        let vc2 = UINavigationController(rootViewController: FavoritesViewController())
        let vc3 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "soccerball.inverse")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "soccerball.inverse")
        vc1.title = "Matches"
        
        vc2.tabBarItem.image = UIImage(systemName: "star")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        vc2.title = "Favorite"
        
        vc3.tabBarItem.image = UIImage(systemName: "person")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        vc3.title = "Profile"
        
        setViewControllers([vc1, vc2, vc3], animated: true)
    }


}

