//
//  HomeRouter.swift
//  astrapay-qris-ios
//
//  Created by Asep on 14/03/22.
//

import Foundation
import UIKit

class HomeRouter {
    
    let vc : UIViewController?
    let storyboard =
    UIStoryboard(name: HomeVC.VCProperty.storyboardIdentifier, bundle: nil)
    
    init(viewController : UIViewController) {
        self.vc = viewController
    }
//
    func navigateToQR(){
        guard let vcQR = UIStoryboard(name:QRConstant.qrStoryBoardName, bundle:nil).instantiateViewController(withIdentifier: QRConstant.qrViewControllerIdentifier) as? QRViewController else {
            print("gagal")
            return
        }

        self.vc?.navigationController?.popToViewController(vcQR, animated: true)
    }
}
