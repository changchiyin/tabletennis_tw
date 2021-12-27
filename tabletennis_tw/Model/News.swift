//
//  News.swift
//  tabletennis_tw
//
//  Created by User15 on 2021/12/25.
//

import Foundation

struct SearchNews: Codable {
    var articles: [NewsItem]
}

struct NewsItem: Codable{
    let title: String
    //let author: String
    let description: String
}
