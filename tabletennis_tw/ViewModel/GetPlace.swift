//
//  GetPlace.swift
//  tabletennis_tw
//
//  Created by User15 on 2021/12/25.
//

import Foundation

class PlaceViewModel: ObservableObject {
    @Published var searchPlace:[PlaceItem] = []
    let networkReachability = NetworkReachability()
    init(){
        fetchItems()
    }
    func fetchItems(lat: Double = 25.09108, long: Double = 121.5598, radius: Int = 100000, keyword: String = "桌球") {
        searchPlace = []
        if(networkReachability.reachable){
            var searchPlace_temp = SearchPlace(results: [], next_page_token: nil)
            var urlStr = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat),\(long)&radius=\(radius)&keyword=\(keyword.urlEncoded())&language=zh-TW&key=AIzaSyDjTuloTVXVo48gVmEY9O5pAGVkWKdjyiY"
            if searchPlace_temp.next_page_token != nil{
                urlStr+="&pagetoken=\(searchPlace_temp.next_page_token!)"
            }
            if let url = URL(string: urlStr) {
                URLSession.shared.dataTask(with: url) { data, response , error in
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    if let data = data {
                        do {
                            searchPlace_temp = try decoder.decode(SearchPlace.self, from: data)
                            print(searchPlace_temp)
                            DispatchQueue.main.async {
                                self.searchPlace.append(contentsOf: searchPlace_temp.results)
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

extension String {
     
    //將原始的url編碼轉為合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
     
    //將編碼後的url轉換回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}


