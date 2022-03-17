//
// Created by Gilbert on 01/01/22.
// Copyright (c) 2022 Astra Digital Arta. All rights reserved.
//

import Foundation
import Alamofire


//public protocol QRClientProtocol{
//    func getAuthToken() -> String
//    func getUserToken() -> String
//}

enum BuildMode {
    case sit
    case uat
    case prod
}

protocol QRPaylaterClientProtocol{
    func buildMode() -> BuildMode
}
public struct QRPaylaterClient {
    var delegateSdk: QRPaylaterClientProtocol?


    var jasonToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk5LCJkZXZpY2VJZCI6IjEyMyIsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJuYmYiOjE2NDc0OTg1ODEsImV4cCI6MTY0NzUwMjE4MSwiaWF0IjoxNjQ3NDk4NTgxLCJqdGkiOiIwYTA3ZTQzYi03ODVjLTRiNzktYWZkMi01NDZjNjlmNzVjZTAiLCJlbWFpbCI6WyJnaWxiZXJ0QGcyYWNhZGVteS5jbyJdfQ.kLmGW49G18_nG0Vd01xezov2JdFwadM-unHAghafvgA0s7DPEc39-NmpXsNMRZ8-Fzr-wqZPZQ5Am_unBXtIv3qvTv7ry7L_85Hr2CHuKWyG-8AZpCt6bOQbQWXn4-6dgG3EqHP_OetTBsJno-EUek2qQiy2Qmv6MGTXt-LroDjKQOYn76WgKdbfJRUOUeuY23u-bf0nMsgZK78SKpo3OIbNyS8ERoZx5RMw439nHDBQ97FuxniM__JTPTPQ3osDAvBQPouCnSlTojxGF39lUMc-G1_c9tFUblgT5XOcTE6g1WVxccVJZZWyvcx4ls59ZFwUnThtkIkdrMjKY5idqg"

    //baseUrlMobileGatewayQr kalo sudah siap gateway sementara pake biasa aja dulu

//    let urlBaseQrisService = "https://qris-sit-api.astrapay.com/qris-service"
    var urlBaseQrisService = QRConstant.QRIS_SIT_API


    //MARK: How to make delegate with this?
    init(){

        // delegate
//        switch (BuildModeEndpoint.buildMode){
//        case .cygnus:
//            urlBaseQrisService = QRConstant.QRIS_SIT_API
//            break
//        case .vega:
//            urlBaseQrisService = QRConstant.QRIS_UAT_API
//            break
//        case .orion:
//            urlBaseQrisService = "https://frontend-.astrapay.com/qris-service"
//            break
//
//        }

//        switch (self){
//        case .cygnus:
//            urlBaseQrisService = QRConstant.QRIS_SIT_API
//            break
//        case .vega:
//            urlBaseQrisService = QRConstant.QRIS_UAT_API
//            break
//        case .orion:
//            urlBaseQrisService = "https://frontend-.astrapay.com/qris-service"
//            break
//
//        }


    }

    struct ClientProperty{
        static let AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk5LCJkZXZpY2VJZCI6IjEyMyIsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJuYmYiOjE2NDc1MDIxMzksImV4cCI6MTY0NzUwNTczOSwiaWF0IjoxNjQ3NTAyMTM5LCJqdGkiOiJhODc0ZmRjYi1lY2YyLTQ5MmEtYjJkYi1iZGIzZDRlZTIzN2MiLCJlbWFpbCI6WyJnaWxiZXJ0QGcyYWNhZGVteS5jbyJdfQ.aIpfWSfrVQsbdt6lEtg4uHdlxyfHjhcpFKsen__zTSH1U7nqgO-Uc07tZVgcsfOU5s-nV1pF7ekiLV_RbdD2yQ_9QYVLBh0DlOm2A8GZ9r6XBB392qFRxWFJoTklJgf9bH2p26fHl9MY6Q8H1Z09I6kiuiO-1idQ0SMud08AdTDWXuaqw2t3E1XGSDq-tfobUd8ZcKhsc8IxU3f9SOvI2pGYIieBaSbOX1fpIfiuyj47QTkmZBEVMMsjNOskGc3amnlFuaYg8h0BicdJRA3dV3kS_WziRkjeZYS25MBpPeAhmecfbE62_fVSM1qNnPiX7JjXwukJ6U_iVEzee2LGig"
    }

    var urlTenorTrxQrisTPLMC : String = "\(QRConstant.baseUrlMobileGatewaySIT)/paylater-service/partners/maucash/tenor?merchantCode="


    public func constructHeaderGeneral() -> HTTPHeaders {
        let header: HTTPHeaders = [
//            QRConstant.HEADER_X_APPLICATION_TOKEN: "\(Prefs.getUser()!.accessToken)", //hardcode aja dulu nanti
            "Authorization": "Bearer \(ClientProperty.AUTH_TOKEN)",
            "Content-Type": "application/json"
        ]
        return header
    }
}
extension QRPaylaterClient{
func getInquiryPaylater(requestTransactionToken: String, requestBasicAmount: String, completion: @escaping(_:QRResponse<QRPaylaterResponseDto>) -> Void) -> DataRequest {

        let getInquiryPaylaterUrl: String = "\(urlBaseQrisService)/inquiries/\(requestTransactionToken)/paymentMethods/payLater?amount=\(requestBasicAmount)"
        var header = self.constructHeaderGeneral()

        let request = AF.request(getInquiryPaylaterUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header)
                .responseDecodable(of: QRPaylaterResponseDto.self) {
                    response in

                    debugPrint(response)

                    switch response.result {
                    case .failure(let error):
                        completion(QRResponse(status: false, message: error.localizedDescription, data: nil))
                    case .success(let data):
                        completion(QRResponse(status: true, message: "OK", data: data))
                    }
                }
        return request
    }
}

extension QRPaylaterClient{
    func getQrisTenorTrxPLMC(merchantCode: String,goodsCode: String,mobile: String,amount:String,transType:String, completion:@escaping(_:QRResponse<QRTenorQrisTrxPLMCResp>) -> Void) -> DataRequest {
        let goodsCodeUrl : String = "&goodsCode=" + goodsCode
        let mobileUrl : String = "&mobile=" + mobile
        let amountUrl : String = "&amount=" + amount
        let transTypeUrl : String = "&transType=" + transType

        var urlRequest = urlTenorTrxQrisTPLMC + merchantCode + goodsCodeUrl + mobileUrl + amountUrl + transTypeUrl
        let request = AF.request(urlRequest, method: .get, parameters: nil, encoding: URLEncoding.default, headers: self.constructHeaderGeneral())
        {$0.timeoutInterval = 60}.responseDecodable(of: QRTenorQrisTrxPLMCResp.self) {
            response in

            debugPrint(response)

            switch response.result {
            case .failure(let error):
                switch error._code{
                case QRErrorConstant.TIMEOUT_ERROR_CODE:
                    completion(QRResponse(status: false, message: error.localizedDescription, data: nil, errorData: nil, isTimeOut: true, responseCode: response.response?.statusCode))
                    break
                default:
                    completion(QRResponse(status: false, message: error.localizedDescription, data: nil, errorData: nil, isTimeOut: false, responseCode: response.response?.statusCode))
                    break

                }
            case .success(let data):
                completion(QRResponse(status: true, message: "OK", data: data))
            }
        }
        return request
    }
}



