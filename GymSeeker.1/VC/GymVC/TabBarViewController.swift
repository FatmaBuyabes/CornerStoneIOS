//
//  TabBarViewController.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 12/03/2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // Token
    var token: String?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        customizeTabBarAppearance()
        
        // Retrieve token from UserDefaults
        if let savedToken = UserDefaults.standard.string(forKey: "AuthToken") {
            token = savedToken
        }
        
        callGyms()
    }
    
    func setupViewControllers() {
        
        
        let bookingVC = UINavigationController(rootViewController: BookingTableViewController())
        bookingVC.tabBarItem = UITabBarItem(title: "Booking History", image: UIImage(systemName: "clock"), selectedImage:UIImage(systemName: "clock.fill"))
        bookingVC.navigationBar.prefersLargeTitles = true
        
        let gymListVC = GymListTableViewController() //UINavigationController(rootViewController: GymListTableViewController())
        gymListVC.tabBarItem = UITabBarItem(title: "Gyms", image: UIImage(systemName: "dumbbell"), selectedImage: UIImage(systemName: "dumbbell.fill"))
        gymListVC.token = token
        //gymListVC.navigationBar.prefersLargeTitles = true
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "profile.fill"))
        profileVC.navigationBar.prefersLargeTitles = true
        
        viewControllers = [gymListVC,bookingVC,profileVC]
        
//        // Pass token to each view controller
//        if let token = token {
//            (gymListVC.viewControllers.first as? GymListTableViewController)?.token = token
//            (bookingVC.viewControllers.first as? BookingTableViewController)?.token = token
//            (profileVC.viewControllers.first as? MainViewController)?.token = token
//        }
    }
    
    func customizeTabBarAppearance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor =  #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        tabBar.layer.cornerRadius = 10
        tabBar.barTintColor = .white
    }
    
    func callGyms() {
        let gymVC = GymListTableViewController()
        gymVC.token = token // Pass the token to GymListTableViewController
        gymVC.user = user
        self.navigationController?.pushViewController(gymVC, animated: true)
    }
}

