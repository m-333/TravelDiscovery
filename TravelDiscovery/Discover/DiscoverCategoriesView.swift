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
        .init(name: "Sport"  , imageName: "sportscourt.fill"),
        .init(name: "Live Events"  , imageName: "music.mic"),
        .init(name: "Food"  , imageName: "tray.fill"),
        .init(name: "History"  , imageName: "books.vertical.fill")
        ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators:  false ){
            HStack(alignment: .top, spacing: 8){
                ForEach(categories, id: \.self) { category in
                    
                    NavigationLink(
                        
                        destination: CategoryDetailView()
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
struct Place: Decodable, Hashable{
    let name, thumbnail: String
}

class CategoryDetailViewModel: ObservableObject{
    
    @Published var isLoading = true
    @Published var places = [Place]()
    init(){
        
        if let path = Bundle.main.url(forResource: "user", withExtension: "json"){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            
            
                do {
                    let data = try Data(contentsOf: path)
                            
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch{
                    print("failed to decode JSON: ", error)
                    
                }
                self.isLoading = false
                //self.places = [1,2,3,4,5,6,7]
            
        }
    }
        }
}
  


struct ActivityIndicatorView: UIViewRepresentable{
    var style: UIActivityIndicatorView.Style
    var isLoading: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
   
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
         isLoading ? uiView.startAnimating() : uiView.startAnimating()
    }
}
struct CategoryDetailView : View{
    @State private var isLoading = false
    @ObservedObject var vm = CategoryDetailViewModel()
    var body: some View {
        ZStack{
            if vm.isLoading {
                VStack{
                    ActivityIndicatorView(style: .large, isLoading: isLoading)
                    Text(" Loading ")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        
                }.padding()
                .background(Color.gray)
                .cornerRadius(8)
                
                
            } else{
                ScrollView {
                    ForEach (vm.places, id: \.self){ place in
                        VStack(alignment: .leading, spacing: 0){
                            Image("art")
                                .resizable()
                                .scaledToFill()
                            Text(place.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                        }.asTile()
                            .padding()
                        
                    }.navigationBarTitle("Category", displayMode: .inline)
                }
            }
        }
     
    }
    struct DiscoverCategoriesView_Previews: PreviewProvider{
        static var previews: some View{
            NavigationView{
                CategoryDetailView()
            }
          DiscoverView()
        }
    }
}

