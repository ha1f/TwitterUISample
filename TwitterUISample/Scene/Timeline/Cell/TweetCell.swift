//
//  TweetCell.swift
//  TwitterUISample
//

import UIKit

final class TweetCell: UITableViewCell {
    @IBOutlet var iconButton: UIButton!
    
    @IBOutlet var moreButton: UIButton!
    
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var screenNameLabel: UILabel!
    @IBOutlet var relativeTimeLabel: UILabel!
    
    func setTweet(_ tweet: Tweet) {
//        self.iconButton.setImage(tweet., for: <#T##UIControl.State#>)
        contentLabel.text =  tweet.content
        nameLabel.text = tweet.name
        screenNameLabel.text = tweet.screenName
    }
}
