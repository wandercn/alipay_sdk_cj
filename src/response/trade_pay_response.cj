/*
   Copyright (c) 2024-present wander@rustpub.com
   hotbuild is licensed under Mulan PSL v2.
   You can use this software according to the terms and conditions of the Mulan PSL v2.
   You may obtain a copy of Mulan PSL v2 at:
            http://license.coscl.org.cn/MulanPSL2
   THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
   EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
   MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
   See the Mulan PSL v2 for more details.
 */
package alipay_sdk.response

import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, field}
import std.collection.ArrayList
import alipay_sdk.jsonhelper.JsonHelper

public class TradePayResponse <: Serializable<TradePayResponse> & JsonHelper {
    public var response: PayResponse = PayResponse() // alipay_trade_pay_response
    public var sign: ?String = None // sign
    public var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("sign", sign))
            .add(serSetOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<PayResponse>("alipay_trade_pay_response", response))
    }
    public static func deserialize(dm: DataModel): TradePayResponse {
        var res = TradePayResponse()
        res.sign = deGetOptionString("sign", dm)
        res.alipayCertSn = deGetOptionString("alipay_cert_sn", dm)
        res.response = PayResponse.deserialize(getDms(dm).get("alipay_trade_pay_response"))

        return res
    }
}

public class PayResponse <: Serializable<PayResponse> & JsonHelper {
    public var code: ?String = None // code
    public var msg: ?String = None // msg
    public var subCode: ?String = None // sub_code
    public var subMsg: ?String = None // sub_msg
    public var tradeNo: ?String = None // trade_no
    public var outTradeNo: ?String = None // out_trade_no
    public var buyerLogonId: ?String = None // buyer_logon_id
    public var settleAmount: ?String = None // settle_amount
    public var payCurrency: ?String = None // pay_currency
    public var payAmount: ?String = None // pay_amount
    public var settleTransRate: ?String = None // settle_trans_rate
    public var transPayRate: ?String = None // trans_pay_rate
    public var totalAmount: ?String = None // total_amount
    public var transCurrency: ?String = None // trans_currency
    public var settleCurrency: ?String = None // settle_currency
    public var receiptAmount: ?String = None // receipt_amount
    public var buyerPayAmount: ?String = None // buyer_pay_amount
    public var pointAmount: ?String = None // point_amount
    public var invoiceAmount: ?String = None // invoice_amount
    public var gmtPayment: ?String = None // gmt_payment
    public var cardBalance: ?String = None // card_balance
    public var storeName: ?String = None // store_name
    public var buyerUserId: ?String = None // buyer_user_id
    public var discountGoodsDetail: ?String = None // discount_goods_detail
    public var advanceAmount: ?String = None // advance_amount
    public var authTradePayMode: ?String = None // auth_trade_pay_mode
    public var chargeAmount: ?String = None // charge_amount
    public var chargeFlags: ?String = None // charge_flags
    public var settlementId: ?String = None // settlement_id
    public var businessParams: ?String = None // business_params
    public var buyerUserType: ?String = None // buyer_user_type
    public var mdiscountAmount: ?String = None // mdiscount_amount
    public var discountAmount: ?String = None // discount_amount
    public var buyerUserName: ?String = None // buyer_user_name

    public var voucherDetailList: ?ArrayList<VoucherDetail> = ArrayList<VoucherDetail>() // voucher_detail_list
    public var fundBillList: ?ArrayList<FundBill> = ArrayList<FundBill>() // fund_bill_list

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("code", code))
            .add(serSetOptionString("msg", msg))
            .add(serSetOptionString("sub_code", subCode))
            .add(serSetOptionString("sub_msg", subMsg))
            .add(serSetOptionString("trade_no", tradeNo))
            .add(serSetOptionString("out_trade_no", outTradeNo))
            .add(serSetOptionString("buyer_logon_id", buyerLogonId))
            .add(serSetOptionString("settle_amount", settleAmount))
            .add(serSetOptionString("pay_currency", payCurrency))
            .add(serSetOptionString("pay_amount", payAmount))
            .add(serSetOptionString("settle_trans_rate", settleTransRate))
            .add(serSetOptionString("trans_pay_rate", transPayRate))
            .add(serSetOptionString("total_amount", totalAmount))
            .add(serSetOptionString("trans_currency", transCurrency))
            .add(serSetOptionString("settle_currency", settleCurrency))
            .add(serSetOptionString("receipt_amount", receiptAmount))
            .add(serSetOptionString("buyer_pay_amount", buyerPayAmount))
            .add(serSetOptionString("point_amount", pointAmount))
            .add(serSetOptionString("invoice_amount", invoiceAmount))
            .add(serSetOptionString("gmt_payment", gmtPayment))
            .add(serSetOptionString("card_balance", cardBalance))
            .add(serSetOptionString("store_name", storeName))
            .add(serSetOptionString("buyer_user_id", buyerUserId))
            .add(serSetOptionString("discount_goods_detail", discountGoodsDetail))
            .add(serSetOptionString("advance_amount", advanceAmount))
            .add(serSetOptionString("auth_trade_pay_mode", authTradePayMode))
            .add(serSetOptionString("charge_amount", chargeAmount))
            .add(serSetOptionString("charge_flags", chargeFlags))
            .add(serSetOptionString("settlement_id", settlementId))
            .add(serSetOptionString("business_params", businessParams))
            .add(serSetOptionString("buyer_user_type", buyerUserType))
            .add(serSetOptionString("mdiscount_amount", mdiscountAmount))
            .add(serSetOptionString("discount_amount", discountAmount))
            .add(serSetOptionString("buyer_user_name", buyerUserName))
            .add(field<?ArrayList<FundBill>>("fund_bill_list", fundBillList))
            .add(field<?ArrayList<VoucherDetail>>("voucher_detail_list", voucherDetailList))
    }
    public static func deserialize(dm: DataModel): PayResponse {
        var res = PayResponse()
        res.code = deGetOptionString("code", dm)
        res.msg = deGetOptionString("msg", dm)
        res.subCode = deGetOptionString("sub_code", dm)
        res.subMsg = deGetOptionString("sub_msg", dm)
        res.tradeNo = deGetOptionString("trade_no", dm)
        res.outTradeNo = deGetOptionString("out_trade_no", dm)
        res.buyerLogonId = deGetOptionString("buyer_logon_id", dm)
        res.settleAmount = deGetOptionString("settle_amount", dm)
        res.payCurrency = deGetOptionString("pay_currency", dm)
        res.payAmount = deGetOptionString("pay_amount", dm)
        res.settleTransRate = deGetOptionString("settle_trans_rate", dm)
        res.transPayRate = deGetOptionString("trans_pay_rate", dm)
        res.totalAmount = deGetOptionString("total_amount", dm)
        res.transCurrency = deGetOptionString("trans_currency", dm)
        res.settleCurrency = deGetOptionString("settle_currency", dm)
        res.receiptAmount = deGetOptionString("receipt_amount", dm)
        res.buyerPayAmount = deGetOptionString("buyer_pay_amount", dm)
        res.pointAmount = deGetOptionString("point_amount", dm)
        res.invoiceAmount = deGetOptionString("invoice_amount", dm)
        res.gmtPayment = deGetOptionString("gmt_payment", dm)
        res.cardBalance = deGetOptionString("card_balance", dm)
        res.storeName = deGetOptionString("store_name", dm)
        res.buyerUserId = deGetOptionString("buyer_user_id", dm)
        res.discountGoodsDetail = deGetOptionString("discount_goods_detail", dm)
        res.advanceAmount = deGetOptionString("advance_amount", dm)
        res.authTradePayMode = deGetOptionString("auth_trade_pay_mode", dm)
        res.chargeAmount = deGetOptionString("charge_amount", dm)
        res.chargeFlags = deGetOptionString("charge_flags", dm)
        res.settlementId = deGetOptionString("settlement_id", dm)
        res.businessParams = deGetOptionString("business_params", dm)
        res.buyerUserType = deGetOptionString("buyer_user_type", dm)
        res.mdiscountAmount = deGetOptionString("mdiscount_amount", dm)
        res.discountAmount = deGetOptionString("discount_amount", dm)
        res.buyerUserName = deGetOptionString("buyer_user_name", dm)
        res.voucherDetailList = ArrayList<VoucherDetail>.deserialize(getDms(dm).get("voucher_detail_list"))
        res.fundBillList = ArrayList<FundBill>.deserialize(getDms(dm).get("fund_bill_list"))

        return res
    }
}

public class FundBill <: Serializable<FundBill> & JsonHelper {
    public var fundChannel: ?String = None // fund_channel
    public var bankCode: ?String = None // bank_code
    public var amount: ?String = None // amount
    public var realAmount: ?String = None // real_amount

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("fund_channel", fundChannel))
            .add(serSetOptionString("bank_code", bankCode))
            .add(serSetOptionString("amount", amount))
            .add(serSetOptionString("real_amount", realAmount))
    }

    public static func deserialize(dm: DataModel): FundBill {
        var res = FundBill()
        res.fundChannel = deGetOptionString("fund_channel", dm)
        res.bankCode = deGetOptionString("bank_code", dm)
        res.amount = deGetOptionString("amount", dm)
        res.realAmount = deGetOptionString("real_amount", dm)

        return res
    }
}

public class VoucherDetail <: Serializable<VoucherDetail> & JsonHelper {
    public var id: ?String = None // id
    public var name: ?String = None // name
    public var `type`: ?String = None // type
    public var amount: ?String = None // amount
    public var merchantContribute: ?String = None // merchant_contribute
    public var otherContribute: ?String = None // other_contribute
    public var memo: ?String = None // memo
    public var templateId: ?String = None // template_id
    public var purchaseBuyerContribute: ?String = None // purchase_buyer_contribute
    public var purchaseMerchantContribute: ?String = None // purchase_merchant_contribute
    public var purchaseAntContribute: ?String = None // purchase_ant_contribute

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("id", id))
            .add(serSetOptionString("name", name))
            .add(serSetOptionString("type", `type`))
            .add(serSetOptionString("amount", amount))
            .add(serSetOptionString("merchant_contribute", merchantContribute))
            .add(serSetOptionString("other_contribute", otherContribute))
            .add(serSetOptionString("memo", memo))
            .add(serSetOptionString("template_id", templateId))
            .add(serSetOptionString("purchase_buyer_contribute", purchaseBuyerContribute))
            .add(serSetOptionString("purchase_merchant_contribute", purchaseMerchantContribute))
            .add(serSetOptionString("purchase_ant_contribute", purchaseAntContribute))
    }

    public static func deserialize(dm: DataModel): VoucherDetail {
        var res = VoucherDetail()
        res.id = deGetOptionString("id", dm)
        res.name = deGetOptionString("name", dm)
        res.`type` = deGetOptionString("type", dm)
        res.amount = deGetOptionString("amount", dm)
        res.merchantContribute = deGetOptionString("merchant_contribute", dm)
        res.otherContribute = deGetOptionString("other_contribute", dm)
        res.memo = deGetOptionString("memo", dm)
        res.templateId = deGetOptionString("template_id", dm)
        res.purchaseBuyerContribute = deGetOptionString("purchase_buyer_contribute", dm)
        res.purchaseMerchantContribute = deGetOptionString("purchase_merchant_contribute", dm)
        res.purchaseAntContribute = deGetOptionString("purchase_ant_contribute", dm)

        return res
    }
}
