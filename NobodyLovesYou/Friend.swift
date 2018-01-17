//
//  Lover.swift
//  AddData
//
//  Created by SHIH-YING PAN on 22/12/2017.
//  Copyright © 2017 SHIH-YING PAN. All rights reserved.
//

import Foundation
import UIKit

struct Friend: Codable {
    var name: String
    var star: String
    var interest: String
    var birth: String
    var innerBeauty: Bool
    var imageName: String?
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func saveToFile(friends: [Friend]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(friends) {
            let url = Friend.documentsDirectory.appendingPathComponent("friend")
            try? data.write(to: url)
        }
    }
    
    static func readFriendsFromFile() -> [Friend]? {
        let propertyDecoder = PropertyListDecoder()
        let url = Friend.documentsDirectory.appendingPathComponent("friend")
        if let data = try? Data(contentsOf: url), let friends = try? propertyDecoder.decode([Friend].self, from: data) {
            return friends
        } else {
            return nil
        }
    }
    
    
    var image: UIImage? {
        if let imageName = imageName {
            let url = Friend.documentsDirectory.appendingPathComponent(imageName)
            return UIImage(contentsOfFile: url.path)
        } else {
            return  #imageLiteral(resourceName: "自己跟自己傳簡訊")
        }
    }
}

