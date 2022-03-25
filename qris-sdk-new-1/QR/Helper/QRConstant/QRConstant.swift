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

    static let AUTH_TOKEN_FOR_TEST = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk5LCJkZXZpY2VJZCI6IjEyMyIsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJuYmYiOjE2NDgwMDc1NTgsImV4cCI6MTY0ODAxMTE1OCwiaWF0IjoxNjQ4MDA3NTU4LCJqdGkiOiI2NjlkNzlhOS04NzQ2LTQxZTQtOGQxZS0zZDkyZTU3NDY1YWIiLCJlbWFpbCI6WyJnaWxiZXJ0QGcyYWNhZGVteS5jbyJdfQ.FEeJFmsT1lhN2aFs54Xqf0tIpgHjH9Fg8P4EcknEcfVYmkZgAPSrA4qyotTZN5b7lU54l9Cjv36gfMiAflVKXGiMZO8_sr7xZnaakV-USY5SiaGirY4dk_uGpug0278HGD9iRsNPhTmDns53Bh47nSxAgBtmiNQINWqBZz2uaP1tdHy5ciPZBJIv77ISXCHsajT-nh2_0mf4WV7DEbx-ETqEL6cHLn-GF8ukFx7U66HubPuNzm5X0QAODADhCKxQTwKiu-0YrY7F1ITvFw-73IKmJe-ovsd8mym3RQcRP4mnkDrQ_AFMU7BX6lacy-dESbSeo2iMQuPGyeN-pVl-tg"
}