//
//  ViewController.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabs()
    }

    //MARK: Private
    private func setupTabs() {
        let vc1 = TodayViewController()
        vc1.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "t.square"), selectedImage: UIImage(systemName: "t.square.fill"))
        
        let vc2 = MedicationsViewController()
        let nav = UINavigationController(rootViewController: vc2)
        nav.tabBarItem = UITabBarItem(title: "Medication", image: UIImage(systemName: "m.square"), selectedImage: UIImage(systemName: "m.square.fill"))
        let vc3 = LogViewController()
        vc3.tabBarItem = UITabBarItem(title: "Log", image: UIImage(systemName: "l.square"), selectedImage: UIImage(systemName: "l.square.fill"))
        
        self.viewControllers = [vc1, nav, vc3]
    }
}

extension ViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: LogViewController.self) {
            let pullUpController = LogViewController()
            _ = pullUpController.view
            addPullUpController(pullUpController,
                                initialStickyPointOffset: pullUpController.initialPointOffset,
                                animated: true)
            return false
        } else  {
            return true
        }
    }

}
