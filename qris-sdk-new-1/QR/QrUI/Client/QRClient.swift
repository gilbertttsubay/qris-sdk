//
// Created by Gilbert on 04/11/21.
// Copyright (c) 2021 Astra Digital Arta. All rights reserved.
//

import Foundation
import Alamofire

public protocol QRClientProtocol{
    func getAuthToken() -> String
    func getUserToken() -> String
}
public struct QRClient {



    var userId = "1999"
    var urlBaseQrisService: String = QRConstant.QRIS_SIT_API

    struct ClientProperty{

        //MARK: Delegate
        static let AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk5LCJkZXZpY2VJZCI6IjEyMyIsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJuYmYiOjE2NDc0OTg1ODEsImV4cCI6MTY0NzUwMjE4MSwiaWF0IjoxNjQ3NDk4NTgxLCJqdGkiOiIwYTA3ZTQzYi03ODVjLTRiNzktYWZkMi01NDZjNjlmNzVjZTAiLCJlbWFpbCI6WyJnaWxiZXJ0QGcyYWNhZGVteS5jbyJdfQ.kLmGW49G18_nG0Vd01xezov2JdFwadM-unHAghafvgA0s7DPEc39-NmpXsNMRZ8-Fzr-wqZPZQ5Am_unBXtIv3qvTv7ry7L_85Hr2CHuKWyG-8AZpCt6bOQbQWXn4-6dgG3EqHP_OetTBsJno-EUek2qQiy2Qmv6MGTXt-LroDjKQOYn76WgKdbfJRUOUeuY23u-bf0nMsgZK78SKpo3OIbNyS8ERoZx5RMw439nHDBQ97FuxniM__JTPTPQ3osDAvBQPouCnSlTojxGF39lUMc-G1_c9tFUblgT5XOcTE6g1WVxccVJZZWyvcx4ls59ZFwUnThtkIkdrMjKY5idqg"
    }

    init(){

        //MARK: ini harus di delegate ke luar
//        switch (BuildModeEndpoint.buildMode){
//        case .cygnus:
//                urlBaseQrisService = QRConstant.QRIS_SIT_API
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

    let headerForMobileGateWay = ["Authorization":"Bearer \(ClientProperty.AUTH_TOKEN)",
                                  "Content-Type": "application/json"]


//    let urlBaseQrisService = "https://qris-sit-api.astrapay.com/qris-service"
//    let urlBaseQrisService = "http://bc3b-180-244-166-129.ngrok.io/qris-service"



    public func constructHeaderGeneral() -> HTTPHeaders {
        let header: HTTPHeaders = [
//            "X-Application-Token": "\(Prefs.getUser()!.token)",
            "Authorization": "Bearer \(ClientProperty.AUTH_TOKEN)",
            "Content-Type": "application/json"
        ]
        return header
    }

    public func constructHeaderForInquiryApi() -> HTTPHeaders {
        let header: HTTPHeaders = [
//            QRConstant.HEADER_X_APPLICATION_TOKEN: "\(Prefs.getUser()!.accessToken)" , //hardcode aja dulu nanti
            QRConstant.HEADER_X_SDK_TOKEN: QRConstant.XTOKEN,
            "Authorization": "Bearer \(ClientProperty.AUTH_TOKEN)",
            "Content-Type": "application/qris",

            //ini sebenernya user id udah ga perlu, cuma buat nge test aja kalo gateway lagi ga bisa
            QRConstant.HEADER_USER_ID:self.userId
        ]
        return header
    }


    func getQrisInquiry(requestQrText: String, completion: @escaping(_:QRResponse<QRInquiryResponse>) -> Void) -> DataRequest{
        var header = constructHeaderForInquiryApi()
        let urlInquiry: String = "\(urlBaseQrisService)/inquiries"

        let request = AF.request(urlInquiry, method: .post, parameters: [:], encoding: BodyStringEncoding(body: requestQrText), headers: header)
        {$0.timeoutInterval = 60}.responseJSON {
            response in

            debugPrint(response)

            switch response.result{
            case .success(let value):


                var responseResult = try? response.result.get()
                var resultDictionary = responseResult as! Dictionary<String, Any>
                var dictString = resultDictionary.jsonStringRepresentation


                if let dictString = dictString{
                    var responseJson = dictString.data(using: .utf8)
                    let responseSuccessPostOtp = try? JSONDecoder().decode(QRInquiryResponse.self, from: responseJson!)

                    // ini jika sukses
                    if let responseSuccessPostOtp = responseSuccessPostOtp{
                        completion(QRResponse(status: true, message: "OK", data:responseSuccessPostOtp, errorData: nil))
                        print("success resendOtp: \(responseSuccessPostOtp)")
                    }


                    // ini untuk error
                    let responseErrorPostOtp = try? JSONDecoder().decode(AstrapayErrorResponse.self, from: responseJson!)
                    print("Error resendOtp: \(responseErrorPostOtp)")
                    if let responseErrorPostOtp = responseErrorPostOtp{
                        completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: responseErrorPostOtp, isTimeOut: false,responseCode: response.response?.statusCode))
                    }
                }



//                let responseErrorPin =  try? JSONDecoder().decode(QRTransactionPinResponse.self, from: responseJson!)

//                print(responseErrorPin)

            case .failure(let error):
                var errorCode = error._code
                if errorCode == QRErrorConstant.TIMEOUT_ERROR_CODE {
                    completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data: nil, errorData: nil, isTimeOut: true))
                    break
                }

                switch response.response?.statusCode {
                case 401:
                    completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: nil, isTimeOut: false,responseCode: response.response?.statusCode))
                    break
                case .none:
                    completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                    break
                case .some(_):
                    completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                    break
                }
            }

        }
        return request
    }
}


//MARK: Transaction Pin and Otp
extension QRClient{

    //MARK: Transaction pin client
    func postToTransactionPin(request: QRTransactionPinRequest, qrInquiryDtoViewData: QRInquiryDtoViewData, completion: @escaping(_:QRResponse<QRTransactionPinResponse>) -> Void) -> DataRequest {
        var header = self.constructHeaderGeneral()
        header[QRConstant.HEADER_X_TRANSACTION_TOKEN] = qrInquiryDtoViewData.transactionToken
        header[QRConstant.HEADER_X_SDK_TOKEN] = QRConstant.XTOKEN
        header[QRConstant.HEADER_USER_ID] = self.userId
        let transactionPinUrl: String = "\(urlBaseQrisService)/transactions"


        //this how to make request from dto to become param/dictionay
        var requestToDictionary : [String: Any]? {
            guard let data = try? JSONEncoder().encode(request) else { return nil }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return nil }
            return json
        }

        print(requestToDictionary)
         let requestBody = requestToDictionary ?? [:]



        let request = AF.request(transactionPinUrl, method: .post, parameters: requestBody, encoding: JSONEncoding.default, headers: header){$0.timeoutInterval = 60}
                .responseJSON {
                response in

                    debugPrint(response)

                    switch response.result {
                    case .success (let value):

                        var responseResult = try? response.result.get()
                        var resultDictionary = responseResult as! Dictionary<String, Any>
                        print(resultDictionary.jsonStringRepresentation)
                        var dictString = resultDictionary.jsonStringRepresentation


                        if let dictString = dictString{
                            var responseJson = dictString.data(using: .utf8)

                            let responseSuccessPin = try? JSONDecoder().decode(QRTransactionPinResponse.self, from: responseJson!)
                            print("success pin: \(responseSuccessPin)")


                            if let responseSuccessPin = responseSuccessPin{
                                completion(QRResponse(status: true, message: "OK", data:responseSuccessPin, errorData: nil))
                            }

                            let responseErrorPin = try? JSONDecoder().decode(AstrapayErrorResponse.self, from: responseJson!)
                            print("Error pin: \(responseErrorPin)")

                            if let responseErrorPin = responseErrorPin{
                                completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: responseErrorPin, isTimeOut: false, responseCode: response.response?.statusCode))
                            }
                        }
                    case .failure(let error):
                        var errorCode = error._code
                        if errorCode == QRErrorConstant.TIMEOUT_ERROR_CODE {
                            completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data: nil, errorData: nil, isTimeOut: true))
                            break
                        }

                        switch response.response?.statusCode {
                        case 401:
                            completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: nil, isTimeOut: false,responseCode: response.response?.statusCode))
                            break
                        case .none:
                            completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                            break
                        case .some(_):
                            completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                            break
                        }

                    }
            }
        return request
    }



    //MARK: Transaksi otp client
    func postToTransactionOtpAfterInputPin(request: QRTransactionOtpRequest, requestForPathAndHeader: QRTransactionOtpRequestForPathAndHeader, completion: @escaping(_:QRResponse<QRTransactionOtpResponse>) -> Void) -> DataRequest {
        var header = self.constructHeaderGeneral()
        header[QRConstant.HEADER_X_SDK_TOKEN] = "XTOKEN"
        header[QRConstant.HEADER_USER_ID] = self.userId
        header[QRConstant.HEADER_X_TRANSACTION_TOKEN] = requestForPathAndHeader.transactionToken ?? "-"
        let transactionUrlOtp = "\(urlBaseQrisService)/transactions/otps/\(requestForPathAndHeader.otpId ?? "-")"
        var requestToDictionary : [String: Any]? {
            guard let data = try? JSONEncoder().encode(request) else { return nil }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return nil }
            return json
        }
        print(requestToDictionary)
        let requestBody = requestToDictionary ?? [:]
        let request = AF.request(transactionUrlOtp, method: .post, parameters: requestBody, encoding: JSONEncoding.default, headers: header){$0.timeoutInterval = 60}
        .responseJSON { response in
            debugPrint(response)
            switch response.result{
            case .success(let value):

                var responseResult = try? response.result.get()
                var resultDictionary = responseResult as! Dictionary<String, Any>
                print(resultDictionary.jsonStringRepresentation)
                var dictString = resultDictionary.jsonStringRepresentation


                if let dictString = dictString{
                    var responseJson = dictString.data(using: .utf8)
                    let responseSuccessPostOtp = try? JSONDecoder().decode(QRTransactionOtpResponse.self, from: responseJson!)
                    if let responseSuccessPostOtp = responseSuccessPostOtp{
                        if responseSuccessPostOtp.id != nil {
                            completion(QRResponse(status: true, message: "OK", data:responseSuccessPostOtp, errorData: nil))
                            print("success resendOtp: \(responseSuccessPostOtp)")
                        }
                    }
                    let responseErrorPostOtp = try? JSONDecoder().decode(AstrapayErrorResponse.self, from: responseJson!)
                    print("Error resendOtp: \(responseErrorPostOtp)")
                    if let responseErrorPostOtp = responseErrorPostOtp{
                        completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: responseErrorPostOtp))
                    }
            }
            case .failure(let error):
                var errorCode = error._code
                if errorCode == QRErrorConstant.TIMEOUT_ERROR_CODE {
                    completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data: nil, errorData: nil, isTimeOut: true))
                    break
                }

                switch response.response?.statusCode {
                case 401:
                    completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: nil, isTimeOut: false,responseCode: response.response?.statusCode))
                    break
                case .none:
                    completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                    break
                case .some(_):
                    completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                    break
                }
            }
        }
        return request
    }
}

//MARK: Get transaction detail by id
extension QRClient{
    func getDetailTransaksiById(requestIdTransaksi: String, completion: @escaping(_:QRResponse<QRGetDetailTransaksiByIdResponse>) -> Void) -> DataRequest {


        let getDetailUrl: String = "\(urlBaseQrisService)/me/transactions/\(requestIdTransaksi)"
        var headers: HTTPHeaders = self.constructHeaderGeneral()
        headers[QRConstant.HEADER_USER_ID] = self.userId

        let request = AF.request(getDetailUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
        .responseDecodable(of: QRGetDetailTransaksiByIdResponse.self) {
            response in

            debugPrint(response)

            switch response.result {
            case .failure(let error):
                var errorCode = error._code
                if errorCode == QRErrorConstant.TIMEOUT_ERROR_CODE {
                    completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data: nil, errorData: nil, isTimeOut: true))
                    break
                }

                switch response.response?.statusCode {
                case 401:
                    completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: nil, isTimeOut: false,responseCode: response.response?.statusCode))
                    break
                case .none:
                    completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                    break
                case .some(_):
                    completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                    break
                }
            case .success(let data):
                completion(QRResponse(status: true, message: "OK", data: data))
                break
            }
        }
        return request
    }

    func getDetailTransaksiByToken(requestTokenTransaksi: String, completion: @escaping(_:QRResponse<QRGetDetailTransaksiByIdResponseDto>) -> Void) -> DataRequest {

        let getDetailUrl: String = "\(urlBaseQrisService)/me/transactions?token=\(requestTokenTransaksi)"
        var headers: HTTPHeaders = self.constructHeaderGeneral()
        headers[QRConstant.HEADER_USER_ID] = self.userId


        let request = AF.request(getDetailUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
        {$0.timeoutInterval = 60}.responseJSON {
                    response in
                    debugPrint(response)
                    switch response.result{
                    case .success(let value):
                        print("Ini adalah \(try? response.result.get())")

                        var responseResult = try? response.result.get()

                        var resultDictionary = responseResult as! Dictionary<String, Any>


                        print(resultDictionary.jsonStringRepresentation)
                        var dictString = resultDictionary.jsonStringRepresentation


                        if let dictString = dictString{
                            var responseJson = dictString.data(using: .utf8)
                            let responseSuccessPostOtp = try? JSONDecoder().decode(QRGetDetailTransaksiByIdResponseDto.self, from: responseJson!)
                            if let responseSuccessPostOtp = responseSuccessPostOtp{
                                completion(QRResponse(status: true, message: "OK", data:responseSuccessPostOtp, errorData: nil))
                                    print("success resendOtp: \(responseSuccessPostOtp)")
                                break
                            }



                            let responseErrorPostOtp = try? JSONDecoder().decode(AstrapayErrorResponse.self, from: responseJson!)
                            print("Error resendOtp: \(responseErrorPostOtp)")
                            if let responseErrorPostOtp = responseErrorPostOtp{
                                completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: responseErrorPostOtp))
                                break
                            }
                        }



//                let responseErrorPin =  try? JSONDecoder().decode(QRTransactionPinResponse.self, from: responseJson!)

//                print(responseErrorPin)

                    case .failure(let error):
                        var errorCode = error._code
                        if errorCode == QRErrorConstant.TIMEOUT_ERROR_CODE {
                            completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data: nil, errorData: nil, isTimeOut: true))
                            break
                        }

                        switch response.response?.statusCode {
                        case 401:
                            completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: nil, isTimeOut: false,responseCode: response.response?.statusCode))
                            break
                        case .none:
                            completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                            break
                        case .some(_):
                            completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                            break
                        }
                    }
                }
        return request
    }

}

//MARK: Resend Otp
extension QRClient{
    func getResendOtp(requestIdInquiry: String, completion: @escaping(_:QRResponse<QRResendOtpDto>) -> Void) -> DataRequest {


        let getResendOtpUrl: String = "\(urlBaseQrisService)/inquiries/\(requestIdInquiry)/otps"
        var headers: HTTPHeaders = self.constructHeaderGeneral()
        headers[QRConstant.HEADER_X_SDK_TOKEN] = QRConstant.XTOKEN


        let request = AF.request(getResendOtpUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
                .responseJSON {
                    response in

                    debugPrint(response)

                    switch response.result{
                    case .success:


                        var responseResult = try! response.result.get()
                        var resultDictionary = responseResult as! Dictionary<String, Any>
                        print(resultDictionary.jsonStringRepresentation)
                        var dictString = resultDictionary.jsonStringRepresentation


                        if let dictString = dictString{
                            var responseJson = dictString.data(using: .utf8)
                            let responseSuccessResendOtp = try? JSONDecoder().decode(QRResendOtpDto.self, from: responseJson!)
                            if let responseSuccessResendOtp = responseSuccessResendOtp{
                                completion(QRResponse(status: true, message: "OK", data:responseSuccessResendOtp, errorData: nil))
                                print("success resendOtp: \(responseSuccessResendOtp)")
                                return
                            }

                            let responseErrorResendOtp = try? JSONDecoder().decode(AstrapayErrorResponse.self, from: responseJson!)
                            print("Error resendOtp: \(responseErrorResendOtp)")
                            if let responseErrorResendOtp = responseErrorResendOtp{
                                completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: responseErrorResendOtp))
                                return
                            }

                        }
                    case .failure(let error):
                        var errorCode = error._code
                        if errorCode == QRErrorConstant.TIMEOUT_ERROR_CODE {
                            completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data: nil, errorData: nil, isTimeOut: true))
                            break
                        }

                        switch response.response?.statusCode {
                        case 401:
                            completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: nil, isTimeOut: false,responseCode: response.response?.statusCode))
                            break
                        case .none:
                            completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                            break
                        case .some(_):
                            completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                            break
                        }
                    }
                }
        return request
    }
}

//MARK: patch transaction paylater
extension QRClient {
    func patchQrisTrxPLMC(id: Int, completion:@escaping(QRResponse<PatchTrxQrisPLMC>) -> Void) -> DataRequest {
        var urlPatchTrxQrisPLMC : String = "\(urlBaseQrisService)/paylater-service/transactions/\(id)/paylater"

        let request = AF.request(urlPatchTrxQrisPLMC,method: .patch, parameters: nil, encoding: URLEncoding.default, headers: self.constructHeaderGeneral())
        .responseDecodable(of: PatchTrxQrisPLMC.self, completionHandler: {
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

        })
        return request
    }
}



struct BodyStringEncoding: ParameterEncoding {

    private let body: String

    init(body: String) { self.body = body }

    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        guard var urlRequest = urlRequest.urlRequest else { throw Errors.emptyURLRequest }
        guard let data = body.data(using: .utf8) else { throw Errors.encodingProblem }
        urlRequest.httpBody = data
        return urlRequest
    }
}

extension BodyStringEncoding {
    enum Errors: Error {
        case emptyURLRequest
        case encodingProblem
    }
}

extension BodyStringEncoding.Errors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyURLRequest: return "Empty url request"
        case .encodingProblem: return "Encoding problem"
        }
    }
}

//
