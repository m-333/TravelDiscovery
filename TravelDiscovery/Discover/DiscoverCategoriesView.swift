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
class CategoryDetailViewModel: ObservableObject{
    
    @Published var isLoading = true
    @Published var places = [Int]()
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.isLoading = false
            self.places = [1,2,3,4,5,6,7]
        }
  }
}

struct ActivityIndicatorView: UIViewRepresentable{
    typealias UIViewType = UIActivityIndicatorView
    
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        return aiv
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        <#code#>
    }
}
struct CategoryDetailView : View{
    
    @ObservedObject var vm = CategoryDetailViewModel()
    var body: some View {
        ZStack{
            if vm.isLoading {
                VStack{
                   ActivityIndicatorView()
                    Text("Curently Loading ")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                
            } else{
                ScrollView {
                    ForEach (0..<5, id: \.self){ num in
                        VStack(alignment: .leading, spacing: 0){
                            Image("art")
                                .resizable()
                                .scaledToFill()
                            Text("Dem0123")
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

