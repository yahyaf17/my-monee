//
//  MainTabBarController.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = .white
        
        let home = HomeViewController(nibName: String(describing: HomeViewController.self), bundle: nil)
        let homeTab = UINavigationController(rootViewController: home)
        homeTab.setNavigationBarHidden(true, animated: false)
        let homeImage = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        let homeImageSelected = UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal)
        homeTab.tabBarItem = UITabBarItem(title: "Home", image: homeImage, selectedImage: homeImageSelected)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 80/255, green: 105/255, blue: 183/255, alpha: 1)], for: .selected)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 130)], for: .normal)
        homeTab.tabBarItem.tag = 0
        
        let dream = DreamViewController(nibName: String(describing: DreamViewController.self), bundle: nil)
        let dreamTab = UINavigationController(rootViewController: dream)
        dreamTab.setNavigationBarHidden(true, animated: false)
        let dreamImage = UIImage(named: "dream")?.withRenderingMode(.alwaysOriginal)
        let dreamImageSelected = UIImage(named: "dream_selected")?.withRenderingMode(.alwaysOriginal)
        dreamTab.tabBarItem = UITabBarItem(title: "Impian", image: dreamImage, selectedImage: dreamImageSelected)
        dreamTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 80/255, green: 105/255, blue: 183/255, alpha: 1)], for: .selected)
        dreamTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 130)], for: .normal)
        dreamTab.tabBarItem.tag = 1

        let profile = ProfileViewController(nibName: String(describing: ProfileViewController.self), bundle: nil)
        let profileTab = UINavigationController(rootViewController: profile)
        profileTab.setNavigationBarHidden(true, animated: false)
        let profileImage = UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal)
        let profileImageSelected = UIImage(named: "profile_selected")?.withRenderingMode(.alwaysOriginal)
        profileTab.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, selectedImage: profileImageSelected)
        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 80/255, green: 105/255, blue: 183/255, alpha: 1)], for: .selected)
        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 130)], for: .normal)
        profileTab.tabBarItem.tag = 2
        
        self.viewControllers = [homeTab, dreamTab, profileTab]

    }


}
