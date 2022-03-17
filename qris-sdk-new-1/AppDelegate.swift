//
//  AppDelegate.swift
//  qris-sdk-new-1
//
//  Created by Gilbert on 3/16/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let controller = QRViewController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        return true
    }


}

