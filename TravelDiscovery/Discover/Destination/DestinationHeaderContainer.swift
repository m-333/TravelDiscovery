//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 30.11.2022.
//

import SwiftUI
import AVFoundation

struct DestinationHeaderContainer: UIViewControllerRepresentable{
    let imageUrlStrings: [String]
    
    func makeUIViewController(context: Context) -> UIViewController {
//        let redVC = UIViewController()
//        redVC.view.backgroundColor = .red
    let pvc = CustomPageViewController(imageUrlStrings: imageUrlStrings)
        return pvc
    }
    typealias UIViewControllerType =  UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController ) else { return nil}
        if index == 0 { return nil }
        return allControllers[index - 1 ]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else
        { return nil }
        
        if index == allControllers.count - 1 { return nil}
        return allControllers[index + 1]
//        if viewController == thirdVC{ return nil }
//
//        return thirdVC 
    }
    
    var allControllers:  [UIViewController] = []
//    let firstVC = UIHostingController(rootView: Text("First View Controller"))
//    let secondVC = UIHostingController(rootView: Text("Second "))
//    let thirdVC = UIHostingController(rootView: Text("third"))
//    lazy var allControllers : [UIViewController] = [firstVC, secondVC, thirdVC]
    init(imageUrlStrings: [String]){
        
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
//        view.backgroundColor = .orange
        allControllers = imageUrlStrings.map({ imageName in
            let hostingController = UIHostingController(rootView:
                                                            KFImage(URL(string: imageName))
                .resizable()
                .scaledToFill()
            )
            hostingController.view.clipsToBounds = true
             return hostingController
        })
        setViewControllers([allControllers.first!], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
    }
    required init(coder: NSCoder){
        fatalError("init(cpder) har not been implemented")
    
}
}
import Kingfisher

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static let imageUrlStrings = [ "https://res.cloudinary.com/turna/image/upload/c_scale,w_648,h_405,dpr_2/f_jpg,q_auto:low/v1572614327/Paris_z0tgmv.jpg?_i=AA", "https://res.cloudinary.com/hello-tickets/image/upload/c_limit,f_auto,q_auto,w_1480/v1646040162/post_images/paris-125/sebastien-gabriel-O0zLR_lVt8I-unsplash_Cropped.jpg", "https://res.cloudinary.com/hello-tickets/image/upload/c_limit,f_auto,q_auto,w_1480/v1646041901/post_images/paris-125/Barrios/24007076426_df0131119d_o_Cropped.jpg"
    ]
    static var previews: some View {
        
        
        DestinationHeaderContainer(imageUrlStrings: imageUrlStrings)
        NavigationView {
            PopularDestinationDetailView(destination: .init(name: "Paris", country:"France", imageName:"paris", latitude: 48.859565, longitude: 2.353235))
        }
    }
}
