//
//  Constants.swift
//  MakeMusic
//
//  Created by Alexandru Turcanu on 04/08/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    struct Music {
        static let songURL: String = "https://stream.svc.7digital.net/stream/catalogue?oauth_consumer_key=7d4vr6cgb392&oauth_nonce=461202404&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1533500426&oauth_version=1.0&shopId=2020&trackId=1271215&oauth_signature=v1PjPqe%2Bm6n4o2GsfN%2F68RBghso%3D"
        
        static let tags: [String] = []
        static let messages: [Message] = [Message(text: "I am so so hyped for this!!!!!", timeStamp: 0, username: "shushu88"),
                                        Message(text: "^^^ saaame", timeStamp: 1, username: "coffeebean8318"),
                                          Message(text: "sounds #futuristic", timeStamp: 2, username: "gabchang"),
                                          Message(text: "west is killing it omg", timeStamp: 4, username: "nooah2"),
                                          Message(text: "that #bass tho :0", timeStamp: 7, username: "al3x"),
                                          Message(text: "#sick", timeStamp: 8, username: "otherAl3x"),
                                          Message(text: "i like where this is going!", timeStamp: 10, username: "anon420"),
                                          Message(text: "work it!", timeStamp: 12, username: "matchaLver20"),
                                          Message(text: "#HARDER", timeStamp: 15, username: "masterc0d3r"),
                                        Message(text: "#BETTER", timeStamp: 17, username: "chicagoStyleHotdog"),
                                        Message(text: "#FASTER", timeStamp: 19, username: "iLoveKanye"),
                                        Message(text: "#STRONGER", timeStamp: 20, username: "sw0leAF"),
                                        Message(text: "#poof", timeStamp: 50, username: "88rising")]
    }
    
    static let countDown: Int = 15
    
    struct Tag {
        static let width: CGFloat = 100
        static let height: CGFloat = 35
        static let tappedBackgroundColor: UIColor = #colorLiteral(red: 0.3529411765, green: 0.8274509804, blue: 0.3607843137, alpha: 1)
    }
    
}
