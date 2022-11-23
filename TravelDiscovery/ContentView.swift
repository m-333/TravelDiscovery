//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 23.11.2022.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        NavigationView{
            
            ScrollView{
                
                DiscoverCategoriesView()
                
                PopularDestinationView()
                
                PopularRestaurantsView()
                
                TrendingCreatorsView()
                
                }.navigationTitle("Discover")
            }
                
        }
    }
struct Destination: Hashable{
    let name, country, imageName: String
}

struct PopularDestinationView : View{
    
    let detinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "paris"),
        .init(name: "Tokyo", country: "France", imageName: "japonya"),
        .init(name: "New York", country: "US", imageName: "new-york")
        
    ]
    
    var body: some View{
        VStack{
            HStack{
            Text("Popular destinations")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("see all")
                .font(.system(size: 12, weight: .semibold))
        }.padding(.horizontal )
            .padding(.top)
            
        ScrollView(.horizontal){
            HStack(spacing: 8.0 ){
                ForEach(detinations, id: \.self) { destination in
                    VStack(alignment: . leading, spacing: 0){
                        Image(destination.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .cornerRadius(4)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 6)
                        
                        Text(destination.name)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(.horizontal, 12)
                        
                        Text(destination.country)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(.horizontal, 12)
                            .padding(.bottom, 8)
                            .foregroundColor(.gray)
                    }
//                        .frame(width: 125)
                        .background(Color(.init(white: 0.9, alpha: 1 )))
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
            }
        }
    }
}
struct PopularRestaurantsView : View{
    
    var body: some View{
        VStack{
            HStack{
            Text("Popular destinations")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("see all")
                .font(.system(size: 14, weight: .semibold))
        }.padding(.horizontal)
            .padding(.top)
            
        ScrollView(.horizontal){
            HStack(spacing: 8.0 ){
                ForEach(0..<2, id: \.self) { num in
                    HStack(spacing: 8) {
                        Spacer()
                            .frame(width: 60, height: 60)
                            .background(Color.gray)
                            .padding(.leading, 6)
                            .padding(.vertical, 6)
                        
                        VStack(alignment : .leading, spacing: 6){
                            Text("Japan's Finest Tapas")
                            
                            HStack{
                                Image(systemName: "star.fill")
                                Text("4.7 · Sushi · $$" )
                            }
                            
                            Text("Tokyo, Japan")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        Spacer()
                           
                    }
                        .frame(width: 200)
                        .background(Color(.init(white: 0.9, alpha: 1)))
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
            }
        }
    }
}
struct TrendingCreatorsView : View{
    
    var body: some View{
        VStack{
            HStack{
            Text("Popular destinations")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("see all")
                .font(.system(size: 14, weight: .semibold))
        }.padding(.horizontal )
            .padding(.top)
        ScrollView(.horizontal){
            HStack(spacing: 8.0 ){
                ForEach(0..<5, id: \.self) { num in Spacer()
                    Spacer()
                        .frame(width: 50, height:50)
                        .background(Color.gray)
                        .cornerRadius(.infinity)
                        .shadow(color:.gray, radius: 4, x: 0.0, y:2)
                }
            }.padding(.horizontal)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Category: Hashable{
    let name, imageName: String
}


struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        .init(name: "art"  , imageName: "paintpalette.fill"),
        .init(name: "Sport"  , imageName: "sportscourt.fill"),
        .init(name: "Live Events"  , imageName: "music.mic"),
        .init(name: "Food"  , imageName: "music.mic"),
        .init(name: "History"  , imageName: "music.mic")
        ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators:  false ){
            HStack(alignment: .top, spacing: 8){
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 8){
                        //Spacer()
                        Image(systemName: category.imageName)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 64, height: 64)
                            .background(Color.gray)
                            .cornerRadius(64)
                            .shadow(color:.gray, radius: 4, x:0.0, y:2)
                        Text( category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.leading)
                    }.frame(width:68)
                }
            }.padding(.horizontal)
        }
    }
}
