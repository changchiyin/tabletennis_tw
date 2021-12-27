//
//  PlaceNavView.swift
//  tabletennis_tw
//
//  Created by ljy on 2021/12/25.
//

import SwiftUI

struct PlaceNavView: View {
    let name: String
    let rating: Double
    let user_ratings_total: Int
    var body: some View {
        VStack{
            Text(name).bold()
            Text(" ")
            //Text(author)
            Text("評分：\(rating, specifier: "%.1f")")
            Text("評分人數：\(user_ratings_total)")
        }
    }
}

/*struct PlaceNavView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceNavView()
    }
}*/
