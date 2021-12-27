//
//  NewsView.swift
//  tabletennis_tw
//
//  Created by User15 on 2021/12/25.
//

import SwiftUI
import SwiftUIPullToRefresh

struct NewsView: View {
    @StateObject var newsViewModel = NewsViewModel()
    @Binding var showAlertSheet: Bool
    let networkReachability = NetworkReachability()
    var body: some View {
        NavigationView{
            List{
                ForEach(newsViewModel.searchNews,id: \.title){
                    item in
                    NavigationLink(destination: NewsNavView(title: item.title,description: item.description), label: {Text(item.title)})
                    //Text(item.title)
                }
            }.navigationTitle("新聞")
        }
        .onAppear(perform: {
            if(!networkReachability.reachable){
                showAlertSheet = true;
            }
        })
        .refreshable
        {
            newsViewModel.fetchItems()
        }
        .overlay{
            if(!networkReachability.reachable){
                Text("無法連線")
            }
            else if(newsViewModel.searchNews.isEmpty){
                ProgressView("資料下載中...")
            }
        }
    }
}

/*struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}*/
