//
//  TodayViewCoordinator.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import Foundation
import UIKit

class ViewCoordinator {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController()
        window?.rootViewController = viewController
    }
}
