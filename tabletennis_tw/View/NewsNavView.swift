//
//  NewsNavView.swift
//  tabletennis_tw
//
//  Created by ljy on 2021/12/25.
//

import SwiftUI

struct NewsNavView: View {
    //let author: String
    let title: String
    let description: String
    var body: some View {
        VStack{
            Text(title).bold()
            Text(" ")
            //Text(author)
            Text(description)
        }
    }
}

/*struct NewsNavView_Previews: PreviewProvider {
    static var previews: some View {
        NewsNavView()
    }
}*/
