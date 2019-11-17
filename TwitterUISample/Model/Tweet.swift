//
//  Tweet.swift
//  TwitterUISample
//

import UIKit

struct Tweet {
    /// @つくidの方
    var screenName: String
    
    /// 名前
    var name: String
    
    /// 本文
    var content: String
    
    /// ホントはURLかも
    var images: [UIImage]
    
    var likeCount: Int
    
    var tweetId: String
    
    var replyCount: Int
}
