//
//  SearchViewController.swift
//  TwitterUISample
//

import UIKit

final class SearchViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "search")?.resized(to: CGSize(width: 24, height: 24)),
            tag: HomeTabBarController._tabBarItemTag(for: self)
        )
        title = "検索"
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
