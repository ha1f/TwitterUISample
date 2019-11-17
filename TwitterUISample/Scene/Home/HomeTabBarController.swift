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
    
    static func _tabBarItemTag(for viewController: UIViewController) -> Int {
        if viewController is TimelineViewController {
            return 1
        }
        if viewController is SearchViewController {
            return 2
        }
        if viewController is NotificationViewController {
            return 3
        }
        if viewController is DirectMessageViewController {
            return 4
        }
        assertionFailure("Invalid view controller passed for \(#function)")
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
