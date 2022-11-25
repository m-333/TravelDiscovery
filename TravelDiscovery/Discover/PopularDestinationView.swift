//
//  PopularDestinationView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 24.11.2022.
//

import SwiftUI

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
                .font(.system(size: 24, weight: .semibold))
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
                     .asTile()
                        .padding(.bottom)
                  }
               }.padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        
        PopularDestinationView()
        DiscoverView()
        
    }
}
