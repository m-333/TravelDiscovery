//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by melek türüdi on 30.11.2022.
//

import SwiftUI
import AVFoundation

struct DestinationHeaderContainer: UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> UIViewController {
//        let redVC = UIViewController()
//        redVC.view.backgroundColor = .red
    let pvc = CustomPageViewController()
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
    
    let firstVC = UIHostingController(rootView: Text("First View Controller"))
    let secondVC = UIHostingController(rootView: Text("Second "))
    let thirdVC = UIHostingController(rootView: Text("third"))
    lazy var allControllers : [UIViewController] = [firstVC, secondVC, thirdVC]
    init(){
        
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
//        view.backgroundColor = .orange
        
        setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
    }
    required init(coder: NSCoder){
        fatalError("init(cpder) har not been implemented")
    
}
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        
        
        DestinationHeaderContainer()
        NavigationView {
            PopularDestinationDetailView(destination: .init(name: "Paris", country:"France", imageName:"paris", latitude: 48.859565, longitude: 2.353235))
        }
    }
}
