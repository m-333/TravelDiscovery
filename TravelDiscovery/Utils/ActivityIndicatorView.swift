//
//  ActivityIndicatorView.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 25.11.2022.
//

import SwiftUI


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


//struct ActivityIndicatorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityIndicatorView()
//    }
//}
