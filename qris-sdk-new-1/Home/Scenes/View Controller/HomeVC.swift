//
//  ViewController.swift
//  astrapay-qris-ios
//
//  Created by Asep on 14/03/22.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var buttonGoToQris: QRAPButtonAtom!
    struct VCProperty{
        static let storyboardIdentifier : String = "Main"
        static let identifier : String = "mainHomeVCIdentifier"
        static let astrapayV2URL : String = "https://www.astrapay.org/"
        static let titleAlert : String = "Info"
        static let heightOfHeader : CGFloat = 322
        static let heightOfMenuCell : CGFloat = 300
        static let heightOfInfoCell : CGFloat = 180
        static let heightOfProductCell : CGFloat = 500
        static let statusBarTag : Int = 20001
        static let heightOfPopUpBottom : CGFloat = 300
        static let constantHeightPopUp = 370
    }

    var router : HomeRouter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.router = HomeRouter(viewController: self)
        // Do any additional setup after loading the view.
    }

    @IBAction func scanQrisPressed(_ sender: UIButton) {
        let vcQR = QRViewController(nibName: "QRViewController", bundle: nil)

        let navigationController = UINavigationController(rootViewController: vcQR)
        self.present(navigationController, animated: true, completion: nil)

    }
    
}

