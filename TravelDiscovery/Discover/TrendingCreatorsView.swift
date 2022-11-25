//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 24.11.2022.
//

import SwiftUI

struct TrendingCreatorsView : View{
    
    let users: [User] = [
        .init(name: "Oguzhan", imageName: "profil-1"),
        .init(name: "Bugra Utku", imageName: "profil-2"),
        .init(name: "Batuhan", imageName: "profil-3"),
        .init(name: "Melisa", imageName: "profil-5"),
        .init(name: "Melek", imageName: "profil-4")
    ]
    
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
            HStack(alignment: .top, spacing: 12){
                ForEach(users, id: \.self) { user in Spacer()
                    VStack{
                        Image(user.imageName)
                            .resizable()
                           // .scaledToFill()
                            .frame(width: 60, height: 60)
                            .cornerRadius(60)
                        Text(user.name)
                            .font(.system(size: 11, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                    }.frame(width: 60)
                    .shadow(color:.gray, radius: 8, x: 0.0, y:8)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
            }
        }
    }
}

struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
