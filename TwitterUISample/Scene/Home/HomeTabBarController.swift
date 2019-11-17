//
//  HomeTabBarController.swift
//  TwitterUISample
//

import UIKit

final class HomeTabBarController: UITabBarController {
    let timelineViewController = TimelineViewController()
    let searchViewController = SearchViewController()
    let notificationViewController = NotificationViewController()
    let directMessageViewController = DirectMessageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timelineViewController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .contacts,
            tag: 1
        )
        searchViewController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .search,
            tag: 2
        )
        notificationViewController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .mostViewed,
            tag: 3
        )
        directMessageViewController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .contacts,
            tag: 4
        )
        
        setViewControllers([
            timelineViewController.wrappingWithNavigationController(),
            searchViewController.wrappingWithNavigationController(),
            notificationViewController.wrappingWithNavigationController(),
            directMessageViewController.wrappingWithNavigationController()
        ], animated: true)
    }
}

private extension UIViewController {
    func wrappingWithNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
