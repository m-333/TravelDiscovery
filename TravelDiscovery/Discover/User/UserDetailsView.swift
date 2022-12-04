//
//  UserDetailsView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 4.12.2022.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User

    var body: some View{
        ScrollView{
            VStack{
                Image(user.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)
                Text(user.name)
                    .font(.system(size: 16, weight: .semibold))
                
                HStack{
                    Text("@\(user.name)94    *  ")
                        .font(.system(size: 12, weight: .semibold))
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 12, weight: .semibold))
                    Text("5111994" )
                }
                   Text("Travel Creator, Vlogger")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(.lightGray))
                HStack(spacing: 12 ){
                    VStack{
                        Text("304.30")
                            .font(.system(size: 13, weight: .bold))
                        Text("Fllowers")
                            .font(.system(size: 9, weight: .regular))
                    }
                    VStack{
                        Text("263.30")
                            .font(.system(size: 13, weight: .bold))
                        Text("Fllowing")
                            .font(.system(size: 9, weight: .regular))
                    }
                    
                }
               
            }.navigationBarTitle(user.name, displayMode: .inline)
            
            }
    }
}
struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            UserDetailsView(user: .init(name: "Oğuzhan", imageName: "profil-1"))
        }
        
    }
}
