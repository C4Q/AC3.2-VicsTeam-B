//
//  APIManager.swift
//  Xkcd
//
//  Created by Eric Chang on 12/1/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    func getData(index: Int, completionHandler: @escaping (Comic?) -> Void) {
        Alamofire.request("http://xkcd.com/\(String(index))/info.0.json").validate().responseJSON { response in
            
            if let data = response.result.value {
                let json = JSON(data)
                if let image = json["img"].string {
                    let validComic = Comic(image: image)
                    completionHandler(validComic)
                }
            }
        }
    }
    
}
