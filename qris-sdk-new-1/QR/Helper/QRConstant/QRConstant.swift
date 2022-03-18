//
//  QRConstant.swift
//  astrapay
//
//  Created by Gilbert on 01/11/21.
//  Copyright © 2021 Astra Digital Arta. All rights reserved.
//

import Foundation

struct QRConstant {
    static let qrStoryBoardName = "QRStoryboard"
    static let qrViewControllerIdentifier = "QRViewControllerIdentifier"

    static let qrPaymentRoute = "QRPayment"
    static let navigationTitle: String = "Scan"

    static let baseUrlMobileGatewaySIT = "https://frontend-sit.astrapay.com"
    static let QRIS_SIT_API = "https://frontend-sit.astrapay.com/qris-service"
    static let QRIS_UAT_API = "https://frontend-uat.astrapay.com/qris-service"
    static let QRIS_PROD_API = "https://frontend-.astrapay.com/qris-service"

    static let TRANSACTION_SIT_API = "https://frontend-sit.astrapay.com/transaction-service"

    //header
    static let HEADER_X_TRANSACTION_TOKEN = "X-Transaction-Token"
    static let HEADER_X_SDK_TOKEN = "X-SDK-Token"
    static let HEADER_USER_ID = "x-user-id"
    static let HEADER_X_APPLICATION_TOKEN = "X-Application-Token"

    static let XTOKEN = "XTOKEN"

    static let AUTH_TOKEN_FOR_TEST = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk5LCJkZXZpY2VJZCI6IjEyMyIsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJuYmYiOjE2NDc2MDk1MTgsImV4cCI6MTY0NzYxMzExOCwiaWF0IjoxNjQ3NjA5NTE4LCJqdGkiOiIxYjNiZmYzMi05NTQ4LTRlYTctYjcyNC0yZTg3NDg0MzM3MzYiLCJlbWFpbCI6WyJnaWxiZXJ0QGcyYWNhZGVteS5jbyJdfQ.iHSduIr3ACQ80xbb2oQN19EGOmQirWIXcvTUfbfFkQg7WlYVS1L7f5YghORRm2swe7AuFjJ2B9IFBz0HjbFV29xpp-IFKC9LnW3vTdazC3oHxYQ_mCTTfXIEYq4h3tDQLF5J1b6AaCgHNxV9_6z1rzDATuUFfihO3KGbsmVk9l_aT3vKwwhRQ3R9FcNnftuO05Wss1N5A7Ma6YDg4vn6Uaqi3lvScb1kCwDBetNW2assWlH0e8Ct37uVtl56WQta5HvFuNjkCxBAbZ3daFQB6d1azf3qgV4-l0S5MdXkydl-HGMiM9JjTQiYuqTOHC2ZituobGSGj7_FhOKL77oALg"
}