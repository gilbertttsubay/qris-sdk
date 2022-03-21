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

    static let AUTH_TOKEN_FOR_TEST = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiUkVGUkVTSCIsInVzZXJJZCI6MTk5OSwiZGV2aWNlSWQiOiIxMjMiLCJ0cmFuc2FjdGlvbklkIjoiIiwidHJhbnNhY3Rpb25UeXBlIjoiIiwibmJmIjoxNjQ3ODMyMjExLCJleHAiOjE2NDc5MTg2MTEsImlhdCI6MTY0NzgzMjIxMSwianRpIjoiNTU2OWZkZTMtZmRhNC00ODNmLWIxNDctNWQwNGQxNzMwNjMxIiwiZW1haWwiOlsiZ2lsYmVydEBnMmFjYWRlbXkuY28iXX0.HdxWxYqEvGX2TVAmDpCQYYSnY_Y3zkr4aeoNpK3aqkiu1WJ4XzrQE7Eiak5bftheQ1x6NM2vltP6J5vEsrxSIFl3hgKAtt4LVdSe41PqPbUoCEsZMs8dnzDzKMPYLwHB6yCg8fDveMGMbuPZ0CcaROlG-cNMpGbVkyz-xTfgHpHI9WvVzwdpS-lz7uUkG0qfs1oxRJOdxtSl2h66xed5mf2V7cUSdY1muSKD1Jaa6X2UXZ75ngADd2GFPU07Eo6tMywkpb102rYs-sfoFpbPkr1zo8u7ND5CnRH4zQYdvD88f8xIkNwO42fhrjb7SfNF6_mdGual-IbnILgIJZvxzw"
}