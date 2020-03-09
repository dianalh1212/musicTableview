//
//  ResponseModel.swift
//  NikeItunes
//
//  Created by hui liu on 3/6/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import Foundation

struct ResponseModel: Codable {
    let feed: Feed
    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

struct Feed: Codable {
    let results: [Music]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
