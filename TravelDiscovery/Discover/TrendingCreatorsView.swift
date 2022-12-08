//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 24.11.2022.
//

import SwiftUI

struct TrendingCreatorsView : View{
    
    let users: [User] = [
        .init( id: 0, name: "Oğuzhan", imageName: "profil-1"),
        .init( id: 1, name: "Buğra Utku", imageName: "profil-2"),
        .init( id: 2, name: "Batuhan", imageName: "profil-3"),
        .init(id: 3,  name: "Melisa", imageName: "profil-5"),
        .init(id: 4, name: "Ayşe", imageName: "profil-4")
    ]
    
    var body: some View{
        VStack{
            HStack{
            Text("Popular creators")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("see all")
                .font(.system(size: 14, weight: .semibold))
        }.padding(.horizontal )
            .padding(.top)
        ScrollView(.horizontal){
            HStack(alignment: .top, spacing: 12){
                ForEach(users, id: \.self) { user in
                    NavigationLink(
                        destination: UserDetailsView(user: user), label: {DiscoverUserView(user: user)
                    .padding(.bottom)
                        })
                }
            }.padding(.horizontal)
            }
        }
    }
}
struct DiscoverUserView: View{
    let user: User
    var body: some View{
        VStack{
            Image(user.imageName)
                .resizable()
               // .scaledToFill()
                .frame(width: 60, height: 60)
                .cornerRadius(60)
            Text(user.name)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
        }.frame(width: 60)
        .shadow(color:.gray, radius: 8, x: 0.0, y:8)
            .padding(.bottom)
    }
}
struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
