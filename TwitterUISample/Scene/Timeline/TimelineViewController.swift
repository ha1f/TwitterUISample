//
//  TimelineViewController.swift
//  TwitterUISample
//

import UIKit

final class TimelineViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var postTweertButton: UIButton!
    
    private let dataSource = TimelineTableViewDataSource()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "home")?.resized(to: CGSize(width: 24, height: 24)),
            tag: HomeTabBarController._tabBarItemTag(for: self)
        )
         title = "ホーム"
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.delegate = self
        
        let penImage = UIImage(named: "pen")?.resized(to: CGSize(width: 20, height: 20)).withRenderingMode(.alwaysTemplate)
        postTweertButton.setImage(penImage, for: .normal)
        postTweertButton.imageView?.contentMode = .scaleAspectFit
        postTweertButton.layer.cornerRadius = 25
        
        tableView.register(UINib(nibName: "TweetCell", bundle: nil), forCellReuseIdentifier: "TweetCell")
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        
        postTweertButton.addTarget(self, action: #selector(postTweetButtonDidTapped(_:)), for: .touchUpInside)
    }
    
    @objc
    func postTweetButtonDidTapped(_ sender: UIButton) {
        let postTweetViewController = PostTweetViewController()
        let navigationController = UINavigationController(rootViewController: postTweetViewController)
        present(navigationController, animated: true, completion: nil)
    }
}

extension TimelineViewController: TweetCellDelegate {
    func didTappedAnalyticsButton(_ tweet: Tweet) {
        print("analytics: \(tweet.tweetId)")
    }
    
    func didTappedMoreButton(_ tweet: Tweet) {
        print("more: \(tweet.tweetId)")
    }
    
    func didTappedShareButton(_ tweet: Tweet) {
        print("share: \(tweet.tweetId)")
    }
    
    func didTappedLikeButton(_ tweet: Tweet) {
        print("like: \(tweet.tweetId)")
    }
    
    func didTappedReplyButton(_ tweet: Tweet) {
        print("reply: \(tweet.tweetId)")
    }
    
    func didTappedRetweetButton(_ tweet: Tweet) {
        print("retweet: \(tweet.tweetId)")
    }
}
