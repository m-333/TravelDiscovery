//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 25.11.2022.
//

import SwiftUI
struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct DiscoverCategoriesView : View {
    let categories: [Category] = [
        .init(name: "art"  , imageName: "art-1"),
        .init(name: "sports"  , imageName: "sport-1"),
        .init(name: "Live Events"  , imageName: "live_event-1"),
        .init(name: "Food"  , imageName: "food-1"),
        .init(name: "History"  , imageName: "history-1")
        ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators:  false ){
            HStack(alignment: .top, spacing: 8) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: NavigationLazyView(CategoryDetailView(name:category.name)),
                          label:{
                            VStack(spacing: 0){
                                //Spacer()
                                Image(category.imageName)
                                    .resizable()
                                   .scaledToFill()
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.mint)
                                    .frame(width: 64, height: 64)
                                    .background(Color.white)
                                    .cornerRadius(64)
                                    
//                                    .shadow(color:.blue, radius: 5, x:0.0, y:2)
                                    .overlay(Circle().stroke(Color.indigo, lineWidth: 3))
                                Text( category.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                            }.frame(width:68)

                        }
                    )
                }.padding(.top)
            }.padding(.horizontal)
        }
    }
}


    struct DiscoverCategoriesView_Previews: PreviewProvider{
        static var previews: some View{
            
                DiscoverView()
            

        }
}
