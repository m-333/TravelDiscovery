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
        .init(name: "Paris", country: "France", imageName: "paris", latitude: 0, longitude: 0),
        .init(name: "Tokyo", country: "Japan", imageName: "japonya", latitude: 0, longitude: 0),
        .init(name: "New York", country: "US", imageName: "new-york", latitude: 0, longitude: 0)
        
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
import MapKit

struct PopularDestinationDetailView : View{
    let destination : Destination
//    @State var region = MKCoordinateRegion(center: .init(latitude: 48.859565, longitude: 2.353235), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @State var region : MKCoordinateRegion
    @State var isShowAttractions = false
   
    init(destination: Destination){
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
    var body: some View{
        ScrollView{
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
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
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
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
