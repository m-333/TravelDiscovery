//
//  CategoryDetailView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 25.11.2022.
//

import SwiftUI
import Kingfisher
struct CategoryDetailView : View {
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
                ZStack{
                    Text(vm.errorMessage)
                         ScrollView {
                             ForEach (vm.places, id: \.self){ place in
                                 VStack(alignment: .leading, spacing: 0){
                                     KFImage(URL(string: place.thumbnail))
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
     
    }
}

struct CategoryDetailView_Previews: PreviewProvider{
    static var previews: some View{
        
                  CategoryDetailView()
            }
}
