//
//  RestaurantDetailsView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 2.12.2022.
//

import SwiftUI
import Kingfisher
struct RestaurantDetails: Decodable{
    let description: String
    let popularDishes: [Dish]
}
struct Dish: Decodable, Hashable {
    let name, price, photo : String
    let numPhotos : Int
}

class RestaurantDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var details: RestaurantDetails?
    
    init() {

        if let path = Bundle.main.url(forResource: "restaurant", withExtension: "json"){
            print("çalıştı")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            do {
                                let data = try Data(contentsOf: path)
                                 
                                self.details = try JSONDecoder().decode(RestaurantDetails.self, from: data)
                } catch{
                    print("failed to decode JSON: ", error)
                }
            }
        }
    }
       
}
struct RestaurantDetailsView: View {

    @ObservedObject var vm = RestaurantDetailsViewModel()
    
    let restaurant: Resturant
    var body: some View {
       // Text(vm.details?.description ?? "")
        ScrollView{
            ZStack(alignment: .bottomLeading){
                Image("susi")
                    .resizable()
                    .scaledToFill()
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                HStack{
                    VStack(alignment: .leading, spacing: 4){
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    
                    HStack{
                        ForEach(0..<5, id:\.self) { num in
                            Image(systemName: "star.fill")
                        }.foregroundColor(.orange)
                    }
                }
                    Spacer()
                    Text("see more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }.padding()
       }
            VStack(alignment: .leading, spacing: 8){
            Text("Location & Description")
            Text("Tokyo")
            HStack{
                ForEach(0..<5, id:\.self) { num in
                    Image(systemName: "dollarsign.circle.fill")
                }.foregroundColor(.orange)
            }
                Text(vm.details?.description ?? "")
                    .padding(.top, 8 )
                    .font(.system(size: 14, weight: .regular))
            }.padding()
            HStack{
                Text("Popular Dishes")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(vm.details?.popularDishes ?? [], id: \.self) { dish in
                        
                      DishCell(dish: dish)
                        
                    }
                }.padding(.horizontal)
            }
             
    }.navigationBarTitle("Restaurant Details", displayMode: .inline)
 }
}
struct DishCell: View {
    let dish: Dish
    var body: some View{
        VStack(alignment: .leading){
            ZStack(alignment: .bottomLeading){
                KFImage(URL(string: dish.photo))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 80)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    .shadow(radius: 2)
                    .padding(.vertical, 2 )
                LinearGradient(gradient: Gradient(colors: [ Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                Text(dish.price)
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .bold))
                    .padding(.horizontal, 6)
                    .padding(.bottom, 4)
            }.frame(height: 120)
                .cornerRadius(5)
          
            Text(dish.name)
                .font(.system(size: 14, weight: .bold))
            
            Text("\(dish.numPhotos) Photos")
                .foregroundColor(.gray)
                .font(.system(size: 12, weight: .regular))
        }
    }
}
struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RestaurantDetailsView(restaurant: .init(name: "Japan's Finest Tapas", imageName: "susi"))
        }
        
    }
}
