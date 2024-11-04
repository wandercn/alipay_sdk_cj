package alipay_sdk

import serialization.serialization.{Serializable, DataModel, DataModelStruct, field}
import std.collection.ArrayList
import alipay_sdk.jsonhelper.JsonHelper


public class TradeCreateResponse <: Serializable<TradeCreateResponse> & JsonHelper {
    var response: CreateResponse = CreateResponse() // alipay_trade_create_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("sign", sign))
            .add(bindOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<CreateResponse>("alipay_trade_create_response", response))
    }

    public static func deserialize(dm: DataModel): TradeCreateResponse {
        var res = TradeCreateResponse()
        res.response = CreateResponse.deserialize(getDms(dm).get("alipay_trade_create_response"))
        res.sign = optionStringGet("sign", dm)
        res.alipayCertSn = optionStringGet("alipay_cert_sn", dm)
        return res
    }
}

class CreateResponse <: Serializable<CreateResponse> & JsonHelper {
    var code: ?String = None // code,
    var msg: ?String = None // msg,
    var subCode: ?String = None // sub_code,
    var subMsg: ?String = None // sub_msg
    var tradeNo: ?String = None // trade_no,omitempty
    var outTradeNo: ?String = None // out_trade_no
    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("code", code))
            .add(bindOptionString("msg", msg))
            .add(bindOptionString("sub_code", subCode))
            .add(bindOptionString("sub_msg", subMsg))
            .add(bindOptionString("trade_no", tradeNo))
            .add(bindOptionString("out_trade_no", outTradeNo))
    }

    public static func deserialize(dm: DataModel): CreateResponse {
        var res = CreateResponse()
        res.code = optionStringGet("code", dm)
        res.msg = optionStringGet("msg", dm)
        res.subCode = optionStringGet("sub_code", dm)
        res.subMsg = optionStringGet("sub_msg", dm)
        res.tradeNo = optionStringGet("trade_no", dm)
        res.outTradeNo = optionStringGet("out_trade_no", dm)
        return res
    }
}

public class TradePayResponse <: Serializable<TradePayResponse> & JsonHelper {
    var response: PayResponse = PayResponse() // alipay_trade_pay_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("sign", sign))
            .add(bindOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<PayResponse>("alipay_trade_pay_response", response))
    }
    public static func deserialize(dm: DataModel): TradePayResponse {
        var res = TradePayResponse()
        res.sign = optionStringGet("sign", dm)
        res.alipayCertSn = optionStringGet("alipay_cert_sn", dm)
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
            .add(bindOptionString("code", code))
            .add(bindOptionString("msg", msg))
            .add(bindOptionString("sub_code", subCode))
            .add(bindOptionString("sub_msg", subMsg))
            .add(bindOptionString("trade_no", tradeNo))
            .add(bindOptionString("out_trade_no", outTradeNo))
            .add(bindOptionString("buyer_logon_id", buyerLogonId))
            .add(bindOptionString("settle_amount", settleAmount))
            .add(bindOptionString("pay_currency", payCurrency))
            .add(bindOptionString("pay_amount", payAmount))
            .add(bindOptionString("settle_trans_rate", settleTransRate))
            .add(bindOptionString("trans_pay_rate", transPayRate))
            .add(bindOptionString("total_amount", totalAmount))
            .add(bindOptionString("trans_currency", transCurrency))
            .add(bindOptionString("settle_currency", settleCurrency))
            .add(bindOptionString("receipt_amount", receiptAmount))
            .add(bindOptionString("buyer_pay_amount", buyerPayAmount))
            .add(bindOptionString("point_amount", pointAmount))
            .add(bindOptionString("invoice_amount", invoiceAmount))
            .add(bindOptionString("gmt_payment", gmtPayment))
            .add(bindOptionString("card_balance", cardBalance))
            .add(bindOptionString("store_name", storeName))
            .add(bindOptionString("buyer_user_id", buyerUserId))
            .add(bindOptionString("discount_goods_detail", discountGoodsDetail))
            .add(bindOptionString("advance_amount", advanceAmount))
            .add(bindOptionString("auth_trade_pay_mode", authTradePayMode))
            .add(bindOptionString("charge_amount", chargeAmount))
            .add(bindOptionString("charge_flags", chargeFlags))
            .add(bindOptionString("settlement_id", settlementId))
            .add(bindOptionString("business_params", businessParams))
            .add(bindOptionString("buyer_user_type", buyerUserType))
            .add(bindOptionString("mdiscount_amount", mdiscountAmount))
            .add(bindOptionString("discount_amount", discountAmount))
            .add(bindOptionString("buyer_user_name", buyerUserName))
            .add(field<?ArrayList<FundBill>>("fund_bill_list", fundBillList))
            .add(field<?ArrayList<VoucherDetail>>("voucher_detail_list", voucherDetailList))
    }
    public static func deserialize(dm: DataModel): PayResponse {
        var res = PayResponse()
        res.code = optionStringGet("code", dm)
        res.msg = optionStringGet("msg", dm)
        res.subCode = optionStringGet("sub_code", dm)
        res.subMsg = optionStringGet("sub_msg", dm)
        res.tradeNo = optionStringGet("trade_no", dm)
        res.outTradeNo = optionStringGet("out_trade_no", dm)
        res.buyerLogonId = optionStringGet("buyer_logon_id", dm)
        res.settleAmount = optionStringGet("settle_amount", dm)
        res.payCurrency = optionStringGet("pay_currency", dm)
        res.payAmount = optionStringGet("pay_amount", dm)
        res.settleTransRate = optionStringGet("settle_trans_rate", dm)
        res.transPayRate = optionStringGet("trans_pay_rate", dm)
        res.totalAmount = optionStringGet("total_amount", dm)
        res.transCurrency = optionStringGet("trans_currency", dm)
        res.settleCurrency = optionStringGet("settle_currency", dm)
        res.receiptAmount = optionStringGet("receipt_amount", dm)
        res.buyerPayAmount = optionStringGet("buyer_pay_amount", dm)
        res.pointAmount = optionStringGet("point_amount", dm)
        res.invoiceAmount = optionStringGet("invoice_amount", dm)
        res.gmtPayment = optionStringGet("gmt_payment", dm)
        res.cardBalance = optionStringGet("card_balance", dm)
        res.storeName = optionStringGet("store_name", dm)
        res.buyerUserId = optionStringGet("buyer_user_id", dm)
        res.discountGoodsDetail = optionStringGet("discount_goods_detail", dm)
        res.advanceAmount = optionStringGet("advance_amount", dm)
        res.authTradePayMode = optionStringGet("auth_trade_pay_mode", dm)
        res.chargeAmount = optionStringGet("charge_amount", dm)
        res.chargeFlags = optionStringGet("charge_flags", dm)
        res.settlementId = optionStringGet("settlement_id", dm)
        res.businessParams = optionStringGet("business_params", dm)
        res.buyerUserType = optionStringGet("buyer_user_type", dm)
        res.mdiscountAmount = optionStringGet("mdiscount_amount", dm)
        res.discountAmount = optionStringGet("discount_amount", dm)
        res.buyerUserName = optionStringGet("buyer_user_name", dm)
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
            .add(bindOptionString("fund_channel", fundChannel))
            .add(bindOptionString("bank_code", bankCode))
            .add(bindOptionString("amount", amount))
            .add(bindOptionString("real_amount", realAmount))
    }

    public static func deserialize(dm: DataModel): FundBill {
        var res = FundBill()
        res.fundChannel = optionStringGet("fund_channel", dm)
        res.bankCode = optionStringGet("bank_code", dm)
        res.amount = optionStringGet("amount", dm)
        res.realAmount = optionStringGet("real_amount", dm)

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
            .add(bindOptionString("id", id))
            .add(bindOptionString("name", name))
            .add(bindOptionString("type", `type`))
            .add(bindOptionString("amount", amount))
            .add(bindOptionString("merchant_contribute", merchantContribute))
            .add(bindOptionString("other_contribute", otherContribute))
            .add(bindOptionString("memo", memo))
            .add(bindOptionString("template_id", templateId))
            .add(bindOptionString("purchase_buyer_contribute", purchaseBuyerContribute))
            .add(bindOptionString("purchase_merchant_contribute", purchaseMerchantContribute))
            .add(bindOptionString("purchase_ant_contribute", purchaseAntContribute))
    }

    public static func deserialize(dm: DataModel): VoucherDetail {
        var res = VoucherDetail()
        res.id = optionStringGet("id", dm)
        res.name = optionStringGet("name", dm)
        res.`type` = optionStringGet("type", dm)
        res.amount = optionStringGet("amount", dm)
        res.merchantContribute = optionStringGet("merchant_contribute", dm)
        res.otherContribute = optionStringGet("other_contribute", dm)
        res.memo = optionStringGet("memo", dm)
        res.templateId = optionStringGet("template_id", dm)
        res.purchaseBuyerContribute = optionStringGet("purchase_buyer_contribute", dm)
        res.purchaseMerchantContribute = optionStringGet("purchase_merchant_contribute", dm)
        res.purchaseAntContribute = optionStringGet("purchase_ant_contribute", dm)

        return res
    }
}
