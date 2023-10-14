//
//  PageViewController.swift
//  Inspire_Challenge
//
//  Created by Akanksha Malwade on 14/10/23.
//

import SwiftUI
import UIKit

/**
 `PageViewController` is a SwiftUI representation of a `UIPageViewController`.
 */
struct PageViewController: UIViewControllerRepresentable {
    
    // Array of view controllers to be displayed
    var controllers: [UIViewController]
    
    // Binding for the current page index
    @Binding var currentPage: Int
    
    // Create the `UIPageViewController` with the provided view controllers.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    // Update the `UIPageViewController` with the current page.
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    // Create the coordinator for managing the `UIPageViewController`.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Coordinator is responsible for data source and delegate methods.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        // MARK: UIPageViewControllerDataSource
        
        // Provide the view controller before the given view controller.
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return nil
            }
            return parent.controllers[index - 1]
        }
        
        // Provide the view controller after the given view controller.
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == parent.controllers.count - 1 {
                return nil
            }
            return parent.controllers[index + 1]
        }
        
        // MARK: UIPageViewControllerDelegate
        
        // Called when a page transition is completed to update the current page.
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = parent.controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
