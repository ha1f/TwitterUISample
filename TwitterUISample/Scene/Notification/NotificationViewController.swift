//
//  NotificationViewController.swift
//  TwitterUISample
//


import UIKit

final class NotificationViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "notification")?.resized(to: CGSize(width: 24, height: 24)),
            tag: HomeTabBarController._tabBarItemTag(for: self)
        )
        title = "通知"
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
