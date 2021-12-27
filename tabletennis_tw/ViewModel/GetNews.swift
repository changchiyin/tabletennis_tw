//
//  GetNews.swift
//  tabletennis_tw
//
//  Created by User15 on 2021/12/25.
//

import Foundation
//7625122232894070a75592db58c8393c
class NewsViewModel: ObservableObject {
    @Published var searchNews:[NewsItem] = []
    let networkReachability = NetworkReachability()
    init(){
        fetchItems()
    }
    func fetchItems() {
        searchNews = []
        var searchNews_temp = SearchNews(articles: [])
        if(networkReachability.reachable){
            let urlStr = "https://newsapi.org/v2/everything?qInTitle=(%22\("桌球".urlEncoded())%22)&sortBy=publishedAt&apiKey=7625122232894070a75592db58c8393c"
            print(urlStr)
            if let url = URL(string: urlStr) {
                URLSession.shared.dataTask(with: url) { data, response , error in
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    if let data = data {
                        do {
                            searchNews_temp = try decoder.decode(SearchNews.self, from: data)
                            print(searchNews_temp)
                            DispatchQueue.main.async {
                                self.searchNews.append(contentsOf: searchNews_temp.articles)
                            }
                        } catch {
                            print(error)
                        }
                    } else {
                        print("error")
                    }
                }.resume()
            }
        }
    }
}
