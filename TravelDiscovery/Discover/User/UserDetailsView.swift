//
//  UserDetailsView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 4.12.2022.
//

import SwiftUI
import Kingfisher
struct UserDetails: Decodable{
    let username, firstName, lastName, profileImage: String
    let followers, following: Int
    let posts: [Post]
//    let photos: [String]
 
}
struct Post: Decodable, Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}
class UsersDetailsViewModel: ObservableObject {

    @Published var userDetails: UserDetails?
    
    init() {

        if let path = Bundle.main.url(forResource: "users", withExtension: "json"){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            do {
                                let data = try Data(contentsOf: path)
                                 
                                self.userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                } catch{
                    print("failed to decode JSON: ", error)
                }
            }
        }
    }
       
}
struct UserDetailsView: View {
    let user: User
    @ObservedObject var vm = UsersDetailsViewModel()
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
                    Text("115.1994" )
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
                HStack(spacing: 12){
                    Button(action: {}, label: {
                        Spacer()
                        Text("Follow")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                    }).padding(.vertical, 8)
                        .background(Color.orange)
                        .cornerRadius(100)
                    Button(action: {}, label: {
                               Spacer()
                               Text("Contact")
                                 
                                   .foregroundColor(.black)
                               Spacer()
                               
                           }).padding(.vertical, 8)
                        .background(Color(white: 0.9))
                            .cornerRadius(100)
                }.font(.system(size: 12, weight: .semibold))
                
                ForEach(vm.userDetails?.posts ?? [], id:\.self){ post in
//                ForEach(0..<5, id: \.self){
//                    num in
                    VStack(alignment: .leading, spacing: 12){
                        KFImage(URL(string: post.imageUrl))
//                        Image("japonya")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        HStack{
                            Image("profil-1")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading)
                            {
                                Text("Here is my post title")
                                    .font(.system(size: 14, weight: .semibold))
                                Text("ben bu dünyayı kılına takmayan adamım")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                            
                        }.padding(.horizontal, 8)
                        HStack{
                            ForEach(0..<3, id: \.self) { num in
                        Text("#Traveling")
                            .foregroundColor(Color(.blue))
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color(white: 1))
                            .cornerRadius(20)
                            }
                        }.padding(.bottom)
                        
                    }
                    .background(Color(white: 1))
                        .cornerRadius(12)
                        .shadow(color: .init(white: 0.9), radius: 5, x: 0, y: 4)
                }
            }.padding(.horizontal)
            
            }.navigationBarTitle(user.name, displayMode: .inline)
    }
}
struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            UserDetailsView(user: .init(name: "Oğuzhan", imageName: "profil-1"))
        }
        
    }
}
