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

import serialization.serialization.{Serializable, DataModel, DataModelStruct, field}
import std.collection.ArrayList
import alipay_sdk.jsonhelper.JsonHelper

public class TradePayResponse <: Serializable<TradePayResponse> & JsonHelper {
    var response: PayResponse = PayResponse() // alipay_trade_pay_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

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
    var code: ?String = None // code
    var msg: ?String = None // msg
    var subCode: ?String = None // sub_code
    var subMsg: ?String = None // sub_msg
    var tradeNo: ?String = None // trade_no
    var outTradeNo: ?String = None // out_trade_no
    var buyerLogonId: ?String = None // buyer_logon_id
    var settleAmount: ?String = None // settle_amount
    var payCurrency: ?String = None // pay_currency
    var payAmount: ?String = None // pay_amount
    var settleTransRate: ?String = None // settle_trans_rate
    var transPayRate: ?String = None // trans_pay_rate
    var totalAmount: ?String = None // total_amount
    var transCurrency: ?String = None // trans_currency
    var settleCurrency: ?String = None // settle_currency
    var receiptAmount: ?String = None // receipt_amount
    var buyerPayAmount: ?String = None // buyer_pay_amount
    var pointAmount: ?String = None // point_amount
    var invoiceAmount: ?String = None // invoice_amount
    var gmtPayment: ?String = None // gmt_payment
    var cardBalance: ?String = None // card_balance
    var storeName: ?String = None // store_name
    var buyerUserId: ?String = None // buyer_user_id
    var discountGoodsDetail: ?String = None // discount_goods_detail
    var advanceAmount: ?String = None // advance_amount
    var authTradePayMode: ?String = None // auth_trade_pay_mode
    var chargeAmount: ?String = None // charge_amount
    var chargeFlags: ?String = None // charge_flags
    var settlementId: ?String = None // settlement_id
    var businessParams: ?String = None // business_params
    var buyerUserType: ?String = None // buyer_user_type
    var mdiscountAmount: ?String = None // mdiscount_amount
    var discountAmount: ?String = None // discount_amount
    var buyerUserName: ?String = None // buyer_user_name

    var voucherDetailList: ?ArrayList<VoucherDetail> = ArrayList<VoucherDetail>() // voucher_detail_list
    var fundBillList: ?ArrayList<FundBill> = ArrayList<FundBill>() // fund_bill_list

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
    var fundChannel: ?String = None // fund_channel
    var bankCode: ?String = None // bank_code
    var amount: ?String = None // amount
    var realAmount: ?String = None // real_amount

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
    var id: ?String = None // id
    var name: ?String = None // name
    var `type`: ?String = None // type
    var amount: ?String = None // amount
    var merchantContribute: ?String = None // merchant_contribute
    var otherContribute: ?String = None // other_contribute
    var memo: ?String = None // memo
    var templateId: ?String = None // template_id
    var purchaseBuyerContribute: ?String = None // purchase_buyer_contribute
    var purchaseMerchantContribute: ?String = None // purchase_merchant_contribute
    var purchaseAntContribute: ?String = None // purchase_ant_contribute

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
