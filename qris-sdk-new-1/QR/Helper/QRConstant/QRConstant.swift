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

    static let AUTH_TOKEN_FOR_TEST = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk5LCJkZXZpY2VJZCI6IjEyMyIsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJuYmYiOjE2NDgxOTYwMjIsImV4cCI6MTY0ODE5OTYyMiwiaWF0IjoxNjQ4MTk2MDIyLCJqdGkiOiI4NzJlZjM4Yy1lNDYzLTQ4YTEtYmYzNi1jMmI0MWM4MDA2ODEiLCJlbWFpbCI6WyJnaWxiZXJ0QGcyYWNhZGVteS5jbyJdfQ.h-Hj5xbwUGDfMp0co3BLURUTED_jEei_-8EoQ6UNHrlXiyH3XBs6CzwlyD_SETpqZDR5R4A-yNe-tWxD06hSPpnyrp3p8qKLpi_l3YB3OXV6BIbuyr9I247XhYH1LGVBlO6T3-_py1Ql8I5EY5nRgSDUwb11PMvX3wdF_oPU-wFSdH-Oj6Ppp7Bcq88unX8hvX3QpNA0GcOqGsowIVFF9A4eJXLx_amL6Oe8a7Jez2lgyZa63_fYqmhtSkGU-u034OsvaRIYxOJhG2Vv1EiolPcibIvW3KZQnkJoI60bST5BojQ54SUs_oWGmXFFgbSD1r0tXma2Zf8B8oFzrLAPiw"
}
