//
//  AppDelegate.swift
//  SwiftUICalculator
//
//  Created by r.n. hermann on 14/08/2021.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISceneDelegate {
    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            window = UIWindow()
            window?.rootViewController = UIHostingController(rootView: CalculatorView())
            window?.makeKeyAndVisible()
            
            return true
        }
}
