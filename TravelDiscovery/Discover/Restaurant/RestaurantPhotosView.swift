//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 3.12.2022.
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: proxy.size.width / 3 - 4, maximum: 300), spacing: 0)
                              ], spacing: 4, content: {
                    ForEach(0..<15, id: \.self) { num in
                        Image("susi")
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width / 3 - 3 , height: proxy.size.width / 3 - 3)
                            .clipped()
                    }
                }).padding(.horizontal, 2)
        }
    }.navigationBarTitle("All Photos", displayMode: .inline )
       
}
}
struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RestaurantPhotosView()
                .previewLayout( .fixed(width: 100, height: 400))
        }
    }
}
