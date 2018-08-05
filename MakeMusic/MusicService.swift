//
//  MusicService.swift
//  MakeMusic
//
//  Created by Alexandru Turcanu on 04/08/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AVFoundation

struct MusicService {
    static func requestSong(for stringURL: String, completion: @escaping () -> ()) {
        guard let url = URL(string: stringURL) else { return }
        let requestURL = URLRequest(url: url)
        
        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        Alamofire.request(stringURL, headers: headers).responseJSON { response in
            debugPrint(response)
        }
        
//        Alamofire.request(requestURL, headers: headers).validate().responseJSON { (response) in
//            switch response.result {
//            case .success:
//                //return song
//                if let value = response.result.value {
//                    let json = JSON(value)
//                    print(json)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
}
