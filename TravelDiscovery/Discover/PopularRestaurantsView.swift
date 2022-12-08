//
//  PopularRestaurantsView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 24.11.2022.
//

import SwiftUI

struct PopularRestaurantsView : View{
    let resturants: [Resturant] = [
        .init(name: "Japan's  Finest Tapas", imageName: "susi", country: "Japan", category: "sushi"),
        .init(name: "Bar & Grill", imageName: "food", country: "US", category: "grill")
    ]
    
    var body: some View{
        VStack{
            HStack{
            Text("Popular restaurants")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("see all")
                .font(.system(size: 14, weight: .semibold))
        }.padding(.horizontal)
        .padding(.top)
            
        ScrollView(.horizontal){
            HStack(spacing: 8.0 ){
                ForEach(resturants, id: \.self) { restaurant in
                    
                    NavigationLink(
                        destination: RestaurantDetailsView(restaurant: restaurant),
                    label: {
                        RestaurantTile(restaurant: restaurant)
                            .foregroundColor(Color(.label))
                    })
                      
                }
            }.padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}
struct RestaurantTile : View{
    let restaurant: Resturant
    var body: some View{
        HStack(spacing: 8) {
            Image(restaurant.imageName )
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(5)
                .padding(.leading, 6)
                .padding(.vertical, 6)
            
            VStack(alignment : .leading, spacing: 6){
                HStack{
                    Text(restaurant.name)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    })
                    
                }
                HStack{
                    Image(systemName: "star.fill")
                    Text("4.7 ·\(restaurant.category) · $$" )
                }
                
                Text(restaurant.country)
            } .font(.system(size: 12, weight: .semibold))
           
            Spacer()
               
        }
            .frame(width: 240)
            .asTile()
    }
}
struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
        PopularRestaurantsView()
    }
}
