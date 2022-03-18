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
    static let navigationTitle : String = "Scan"

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

    static let AUTH_TOKEN_FOR_TEST = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk5LCJkZXZpY2VJZCI6IjEyMyIsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJuYmYiOjE2NDc2MDE5OTMsImV4cCI6MTY0NzYwNTU5MywiaWF0IjoxNjQ3NjAxOTkzLCJqdGkiOiI4ZDY0ZWE3OC04MWE3LTQzZDItOGFhNy1mNmRjOTU3MDUzMjYiLCJlbWFpbCI6WyJnaWxiZXJ0QGcyYWNhZGVteS5jbyJdfQ.bjvW1NNpRLawSHFfGYU2LWA2X7HPqgXwH1XvJeXfpBkhHVElexmYellxb8tiryLRyTy-VTy22xnxvq_y7o9bdndDSaIFQeNNMNKVspwSN14OsujS0qY-SruAQnUhSwuFQWXzqWmc9K4p4oXreCzM1mfERMvkMZ4bLCrVngWwU7hc3m_4laeqOGpkEHIRuqDTZJy1V1bi3Cj13lFsKhWG7LbRWYmP4ETDG-RMjBzhNTrmx1eDof2ZWBhqQGideCrMQwpoGwh_zGqqGMy1oliSxAg9TZfErahU40LyLjNA90QXxtslFpoudU0LWRH3LUoM7OX9Tjj1YH76SCOoUxmySA"
}
