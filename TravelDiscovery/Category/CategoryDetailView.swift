//
//  CategoryDetailView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 25.11.2022.
//

import SwiftUI
import Kingfisher
class CategoryDetailViewModel: ObservableObject{
    
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    
    init(name : String) {
        /*
         if let statusCode = (resp as? HTTPURLResponse)?.statusCode,
         statusCode>= 400{
         self.isLoading = false,
         self.errorMessage = "Bad status: \(statusCode)"
         return
         }
         
         */
        
        if let path = Bundle.main.url(forResource: "\(name)", withExtension: "json"){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            
            
                do {
                    let data = try Data(contentsOf: path)
                            
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                    //self.isLoading = false
                } catch{
                    print("failed to decode JSON: ", error)
                    self.errorMessage = error.localizedDescription
                    
                }
                self.isLoading = false
                //self.places = [1,2,3,4,5,6,7]
            
        }
    }
        }
}
struct CategoryDetailView : View {
    
    @State private var isLoading = false
    @ObservedObject var vm : CategoryDetailViewModel
     let name :String
    
    init(name: String){
        self.name = name
        self.vm =  .init(name: name)
    }
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
                    
                    if !vm.errorMessage.isEmpty{
                     VStack{
                     Image(systemName: "xmark.octagon.fill")
                            .font(.system(size: 64, weight: .semibold))
                            .foregroundColor(.red)
                     Text(vm.errorMessage)
                       }
                     }
                     
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
                                 
                             }.navigationBarTitle( name, displayMode: .inline)
                         }
                }
            }
        }
     
    }
}

struct CategoryDetailView_Previews: PreviewProvider{
    static var previews: some View {
        
        CategoryDetailView(name: "name")
        DiscoverView()
            }
}
