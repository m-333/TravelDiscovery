//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 25.11.2022.
//

import SwiftUI

struct DiscoverCategoriesView : View {
    let categories: [Category] = [
        .init(name: "art"  , imageName: "paintpalette.fill"),
        .init(name: "sports"  , imageName: "sportscourt.fill"),
        .init(name: "Live Events"  , imageName: "music.mic"),
        .init(name: "Food"  , imageName: "tray.fill"),
        .init(name: "History"  , imageName: "books.vertical.fill")
        ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators:  false ){
            HStack(alignment: .top, spacing: 8){
                ForEach(categories, id: \.self) { category in
                    
                    NavigationLink(
                        
                        destination: CategoryDetailView(name: category.name)
                        , label:{
                            VStack(spacing: 0){
                                //Spacer()
                                Image(systemName: category.imageName)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.mint)
                                    .frame(width: 64, height: 64)
                                    .background(Color.white)
                                    .cornerRadius(64)
                                    //.shadow(color:.gray, radius: 4, x:0.0, y:2)
                                Text( category.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                            }.frame(width:68)
                            
                        })
                }
            }.padding(.horizontal)
        }
    }
}


    struct DiscoverCategoriesView_Previews: PreviewProvider{
        static var previews: some View{
            
                DiscoverView()
            

        }
}
