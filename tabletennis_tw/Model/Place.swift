//
//  Place.swift
//  tabletennis_tw
//
//  Created by User15 on 2021/12/25.
//

import Foundation

struct SearchPlace: Codable {
    var results: [PlaceItem]
    var next_page_token: String?
}

struct PlaceItem: Codable{
    let place_id: String
    let name: String
    let rating: Double
    let user_ratings_total: Int
}

