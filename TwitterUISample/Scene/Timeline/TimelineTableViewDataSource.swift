//
//  TimelineTableViewDataSource.swift
//  TwitterUISample
//

import UIKit

final class TimelineTableViewDataSource: NSObject, UITableViewDataSource {
    var tweets: [Tweet] = [
        Tweet(screenName: "_ha1f", name: "はるふ", content: "今日は目黒川沿いを走ってみた」\nが、10分で完全にしんで、体調悪くなって、帰ってから15分ぐらい死んでる…距離的には1.6kmぐらいだったっぽい\nとりあえずウーバーイーツ注文した", images: [], likeCount: 1, tweetId: "", replyCount: 2),
        Tweet(screenName: "_ha1f", name: "はるふ", content: "マジで一瞬ですごい", images: [], likeCount: 3, tweetId: "", replyCount: 4)
    ]
    
    weak var delegate: TweetCellDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as? TweetCell else {
            fatalError("dequeuing TweetCell error")
        }
        cell.setTweet(tweets[indexPath.row])
        cell.delegate = delegate
        return cell
    }
}
