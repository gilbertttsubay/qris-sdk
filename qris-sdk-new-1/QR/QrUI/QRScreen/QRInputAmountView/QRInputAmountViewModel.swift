//
// Created by Gilbert on 14/12/21.
// Copyright (c) 2021 Astra Digital Arta. All rights reserved.
//

import Foundation

struct QRInputAmountViewModelPayload{
    var qrInquiryResponse: QRInquiryResponse?
}


protocol QRInputAmountViewModelProtocol{
    func amountInputedValidationPassed()
    func amountInputedValidationFailed()
    func amountMoreThanMaximumAmountIsTrue()
}

struct QRInputAmountViewModel{
    var qrInquiryDtoViewData: QRInquiryDtoViewData?

    var userBalanceAstrapay: Int?

    var merchantName: String {
        return self.qrInquiryDtoViewData?.qrInquiryQrisDto?.merchant?.merchantName ?? "-"
    }

    var merchantCity: String {
        return self.qrInquiryDtoViewData?.qrInquiryQrisDto?.merchant?.merchantCity ?? "-"
    }

    var createdAt: String {
        return dateFormatter(self.qrInquiryDtoViewData?.createdAt ?? "-")
    }


    var maximumAmount : Int? {
        return Int(self.qrInquiryDtoViewData?.maximumAmount ?? 0)
    }

    var delegate: QRInputAmountViewModelProtocol?


    var qrInputAmountViewModelPayload: QRInputAmountViewModelPayload = QRInputAmountViewModelPayload()


    func amountInputedValidation(amountInputed: Double, maximumAmount: Int?){
        guard let maximumAmount = maximumAmount else {
            return
        }
        if (amountInputed >= 10000 || amountInputed > 0) && (Int(amountInputed) <= maximumAmount) { // 10 Ribu
//            self.viewButton.setAtomic(type: .filled, title: "LANJUTKAN")
                self.delegate?.amountInputedValidationPassed()
        } else {
//            self.viewButton.setAtomic(type: .disabled, title: "LANJUTKAN")
                self.delegate?.amountInputedValidationFailed()
        }
    }

    func amountMoreThanMaximumAmount(amountInputed: Double, maximumAmount: Int?){
        if Int(amountInputed) > maximumAmount! {
            self.delegate?.amountMoreThanMaximumAmountIsTrue()
        }
    }
    
    func dateFormatter(_ initialDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "dd MMMM YYYY - HH:mm:ss"
        let newFormatter = ISO8601DateFormatter()
        return "\(dateFormatter.string(from: newFormatter.date(from: initialDate) ?? Date())) WIB"
    }
}
