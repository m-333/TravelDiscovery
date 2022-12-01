//
//  PopularDestinationView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 24.11.2022.
//

import SwiftUI
import MapKit

struct PopularDestinationView : View{
    
    let detinations: [Destination] = [
        .init(name: "paris", country: "France", imageName: "paris", latitude: 48.855014 , longitude: 2.341231),
        .init(name: "tokyo", country: "Japan", imageName: "japonya", latitude: 35.67988, longitude: 139.7695),
        .init(name: "New York", country: "US", imageName: "new-york", latitude: 40.71592, longitude: -74.0055)
        
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
                    NavigationLink (
                        destination: PopularDestinationDetailView(destination: destination),
                    label: {
                        PopularDestinatonTile(destination: destination)
                        .padding(.bottom)
                        
                    })
                  }
               }.padding(.horizontal)
            }
        }
    }
}
struct DestinationDetails: Decodable{
    let description: String
    let photos: [String]
}

class DestinationDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var destinationDetails: DestinationDetails?
    
    init(name: String) {
        
        if let path = Bundle.main.url(forResource: "\(name)", withExtension: "json"){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            do {
                                let data = try Data(contentsOf: path)
                                 
                                self.destinationDetails = try JSONDecoder().decode(DestinationDetails.self, from: data)
                } catch{
                    print("failed to decode JSON: ", error)
                }
            }
        }
    }
       
}

import MapKit

struct PopularDestinationDetailView : View{
    @ObservedObject var vm: DestinationDetailsViewModel
    let destination : Destination

    @State var region : MKCoordinateRegion
    @State var isShowAttractions = false
   
    init(destination: Destination){
        
        
        
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
        
        self.vm = .init(name: destination.name)
        
    }
   let imageUrlStrings = [ "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5", "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702", "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531","https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"
                           
    ]
    var body: some View{
//        UIViewController()
       
        ScrollView{
            if let photos = vm.destinationDetails?.photos {
                DestinationHeaderContainer(imageUrlStrings: photos)
                    .frame(height: 250)
            }
//            Image(destination.imageName)
//                .resizable()
//                .scaledToFill()
//                .frame(height: 200)
//                .clipped()
            
            VStack(alignment: .leading){
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                HStack{
                    ForEach(0..<5, id: \.self){ num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                
                Text(vm.destinationDetails?.description ?? "")
                    .padding(.top, 4)
                    .font(.system(size: 14))
                    //.lineLimit(100)
                HStack{Spacer()}
            }.padding(.horizontal)
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Button(action: {isShowAttractions.toggle() }, label: {
                    Text("\(isShowAttractions ? "Hide" : "Show") Attractions")
                        .font(.system(size: 12, weight: .semibold))
                })
                
                Toggle("", isOn: $isShowAttractions)
                    .labelsHidden()
            }.padding(.horizontal)
//            HStack{
//                Map(coordinateRegion: $region)
//                    .frame(width: 400 , height: 400)
//            }
            Map(coordinateRegion: $region, annotationItems: isShowAttractions ?  attraction : []) { attraction in
//               MapMarker(coordinate:  .init(latitude: attraction.latitude, longitude: attraction.longitude), tint:  .red)
//
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)){
                    CustomMapAnnotation(attraction: attraction)
                  
                }
            }
            .frame(height:  300)
        
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
                let attraction: [Attraction] = [
                    .init(name: "Eiffel Tower",imageName: "paris" , latitude: 48.859565, longitude: 2.353235),
                    .init(name: "Champs-Elysees", imageName: "paris-1" ,latitude: 48.866867, longitude: 2.311780),
                    .init(name: "Louvre Museum",imageName: "paris-2" , latitude: 48.860288, longitude: 2.337789)]
   
}

struct CustomMapAnnotation: View{
    let attraction: Attraction
    var body: some View{
        VStack{
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(4)
            Text(attraction.name)
                .padding(.horizontal, 6)
                .padding(.vertical, 4 )
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
               .cornerRadius(4)
                .overlay(RoundedRectangle( cornerRadius: 4)
                    .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
//                .border(Color.black)
        }.shadow(radius: 5)
    }
   
}
struct Attraction: Identifiable {
    var id =  UUID().uuidString
    let name, imageName: String
     let latitude , longitude: Double
    }

struct PopularDestinatonTile: View {
    let destination : Destination
    var body: some View{
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
                .foregroundColor(.gray)
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
         .asTile()
    }
}

struct PopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
       
        NavigationView {
            PopularDestinationDetailView(destination: .init(name: "Paris", country:"France", imageName:"paris", latitude: 48.859565, longitude: 2.353235))
        }
        
        PopularDestinationView()
        DiscoverView()
        
    }
}
