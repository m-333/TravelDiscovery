//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 23.11.2022.
//

import SwiftUI
extension Color {
    static let discoverbackgorund = Color(.init(white: 0.95, alpha: 1))
}
struct DiscoverView: View {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
   
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.teal, Color.clear]), startPoint: .leading, endPoint: .trailing).ignoresSafeArea()
                
                Color.discoverbackgorund
                    .offset(y: 400)
                
                
                ScrollView{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go ?")
                        Spacer()
                            
                    }.font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(10)
                        .padding(16)
                    DiscoverCategoriesView()
                    
                    VStack{
                        PopularDestinationView()
                        
                        PopularRestaurantsView()
                        
                        TrendingCreatorsView()
                    }.background(Color.discoverbackgorund)
                        .cornerRadius(16)
                        .padding(.top, 32)
                    }
            }
           .navigationTitle("Geziyoz")
            }
        }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
