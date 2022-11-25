//
//  HomeViewController.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import UIKit

class TabBarHomeViewController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        delegate = self
        
        let countryOn = UIImage(named: "super_filled")
        let countryOff = UIImage(named: "super_outline")
        
        // Create Tab one
        let tabOne = HomeViewController()
        let tabOneBarItem = UITabBarItem(title: "Characters", image: countryOff, selectedImage: countryOn)
        tabOne.tabBarItem = tabOneBarItem
        
        let bleOn = UIImage(named: "user_filled")
        let bleOff = UIImage(named: "user_outline")
        
        // Create Tab two
        let tabTwo = UserViewController(viewModel: UserViewModel())
        let tabTwoBarItem2 = UITabBarItem(title: "User", image: bleOff, selectedImage: bleOn)
        tabTwo.tabBarItem = tabTwoBarItem2
        
        viewControllers = [tabOne, tabTwo]
        
        self.tabBar.tintColor = nil
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}

