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

    static let AUTH_TOKEN_FOR_TEST = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk5LCJkZXZpY2VJZCI6IjEyMyIsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJuYmYiOjE2NDc2MDU4MDgsImV4cCI6MTY0NzYwOTQwOCwiaWF0IjoxNjQ3NjA1ODA4LCJqdGkiOiI5ZDE1Y2Q2My03YjI5LTQzMzYtYjBmZC0yNDhlYjViNGNmZWQiLCJlbWFpbCI6WyJnaWxiZXJ0QGcyYWNhZGVteS5jbyJdfQ.WUjG8q4F_78gx-z7DbN3hIfZM7u5LUvzutMZS-T30l4Ig03ehrNFJxvJaUhQvPGHIwCU6lGSPvbBJfPywgUUzOkR0JkIhH1VpzNt7buejsLVgRuKqJ6__RgmgMzjRyjb0_CW-SC0u4CvKyJRott4k9PDG_CaLhajxlgL974wVTGRowERMrJbOrkNKzvXx9RK-7EtKprqsq0o0SiOI65cNrKEXs2H6dcMycJKMLdImd4K2sI2veIVBHBskWzoGFVZf810VeYVUIvcxSr30MumzUdLmXPoJO3ZvS9X1_4nV8LCCLHkHgKxKDH8fNNmd8oHIAf1iwx-hcsiti88Ryhl7Q"
}