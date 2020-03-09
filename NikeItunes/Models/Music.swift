//
//  Music.swift
//  NikeItunes
//
//  Created by hui liu on 3/6/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import Foundation

struct Music: Codable {
    let artistName: String
    let name: String
    let artworkUrl100: String
    let copyright: String
    let releaseDate: String
    let genres: [Genre]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case name = "name"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case copyright = "copyright"
        case releaseDate = "releaseDate"
        case url = "url"
    }
}

struct Genre: Codable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
