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
        guard let vcQR = UIStoryboard(name:QRConstant.qrStoryBoardName, bundle:nil).instantiateViewController(withIdentifier: QRConstant.qrViewControllerIdentifier) as? QRViewController else {
            //            print(HomeRouter.defaultIdentifierStoryboardMessage("MainQRVC"))
            return false
        }
        window?.rootViewController = vcQR
        window?.makeKeyAndVisible()
        return true
    }


}

