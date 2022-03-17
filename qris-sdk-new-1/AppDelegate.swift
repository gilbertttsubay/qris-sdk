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
    var rootVC: UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
//        let controller = QRViewController()
        rootVC = UIStoryboard(name: HomeVC.VCProperty.storyboardIdentifier, bundle: nil)
                .instantiateViewController(withIdentifier: HomeVC.VCProperty.identifier)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }


}

