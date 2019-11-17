//
//  TweetCell.swift
//  TwitterUISample
//

import UIKit

protocol TweetCellDelegate: AnyObject {
    func didTappedMoreButton(_ tweet: Tweet)
    func didTappedShareButton(_ tweet: Tweet)
    func didTappedLikeButton(_ tweet: Tweet)
    func didTappedReplyButton(_ tweet: Tweet)
    func didTappedRetweetButton(_ tweet: Tweet)
    func didTappedAnalyticsButton(_ tweet: Tweet)
}

extension TweetCellDelegate {
    func didTappedAnalyticsButton() {}
}

final class TweetCell: UITableViewCell {
    @IBOutlet private var iconButton: UIButton!
    
    @IBOutlet private var moreButton: UIButton!
    
    @IBOutlet private var contentLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var screenNameLabel: UILabel!
    @IBOutlet private var relativeTimeLabel: UILabel!
    
    @IBOutlet private var replyButton: UIButton!
    @IBOutlet private var retweetButton: UIButton!
    @IBOutlet private var shareButton: UIButton!
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var analyticsButton: UIButton!
    
    private var _tweet: Tweet?
    
    weak var delegate: TweetCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        [replyButton, retweetButton, shareButton, likeButton, analyticsButton]
            .compactMap({ $0 })
            .forEach { button in
                button.imageView?.contentMode = .scaleAspectFit
                button.titleLabel?.textColor = .black
            }
        replyButton.setImage(UIImage(named: "heart"), for: .normal)
        retweetButton.setImage(UIImage(named: "retweet"), for: .normal)
        likeButton.setImage(UIImage(named: "heart"), for: .normal)
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        
        replyButton.addTarget(self, action: #selector(replyButtonDidTapped(_:)), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(retweetButtonDidTapped(_:)), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(likeButtonDidTapped(_:)), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonDidTapped(_:)), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(moreButtonDidTapped(_:)), for: .touchUpInside)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconButton.setImage(nil, for: .normal)
        contentLabel.text = nil
        nameLabel.text = nil
        screenNameLabel.text = nil
        _tweet = nil
        
        delegate = nil
    }
    
    func setTweet(_ tweet: Tweet) {
        _tweet = tweet
//        self.iconButton.setImage(tweet., for: <#T##UIControl.State#>)
        contentLabel.text =  tweet.content
        nameLabel.text = tweet.name
        screenNameLabel.text = tweet.screenName
//        likeButton.setTitle("\(tweet.likeCount)", for: .normal)
//        replyButton.setTitle("\(tweet.replyCount)", for: .normal)
        iconButton.setImage(tweet.iconImage?.clippingToRound(width: iconButton.frame.width), for: .normal)
    }
    
    @objc
    func replyButtonDidTapped(_ sender: UIButton) {
        guard let tweet = _tweet else {
            return
        }
        delegate?.didTappedReplyButton(tweet)
    }
    
    @objc
    func likeButtonDidTapped(_ sender: UIButton) {
        guard let tweet = _tweet else {
            return
        }
        delegate?.didTappedLikeButton(tweet)
    }
    
    @objc
    func shareButtonDidTapped(_ sender: UIButton) {
        guard let tweet = _tweet else {
            return
        }
        delegate?.didTappedShareButton(tweet)
    }
    
    @objc
    func moreButtonDidTapped(_ sender: UIButton) {
        guard let tweet = _tweet else {
            return
        }
        delegate?.didTappedMoreButton(tweet)
    }
    
    @objc
    func retweetButtonDidTapped(_ sender: UIButton) {
        guard let tweet = _tweet else {
            return
        }
        delegate?.didTappedRetweetButton(tweet)
    }
    
    @objc
    func analyticsButtonDidTapped(_ sender: UIButton) {
        guard let tweet = _tweet else {
            return
        }
        delegate?.didTappedAnalyticsButton(tweet)
    }
}
