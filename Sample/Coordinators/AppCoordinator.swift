//
//  AppCoordinator.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let coordinator = ViewCoordinator(window: window)
        coordinator.start()
    }
}
