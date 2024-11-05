package alipay_sdk.response

import serialization.serialization.{Serializable, DataModel, DataModelStruct, field}
import std.collection.ArrayList
import alipay_sdk.jsonhelper.JsonHelper

public class TradeRefundResponse <: Serializable<TradeRefundResponse> & JsonHelper {
    var response: RefundResponse = RefundResponse() // alipay_trade_refund_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("sign", sign))
            .add(bindOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<RefundResponse>("alipay_trade_refund_response", response))
    }

    public static func deserialize(dm: DataModel): TradeRefundResponse {
        var res = TradeRefundResponse()
        res.response = RefundResponse.deserialize(getDms(dm).get("alipay_trade_refund_response"))
        res.sign = optionStringGet("sign", dm)
        res.alipayCertSn = optionStringGet("alipay_cert_sn", dm)
        return res
    }
}

class RefundResponse <: Serializable<RefundResponse> & JsonHelper {
    var code: ?String = None // code
    var msg: ?String = None // msg
    var subCode: ?String = None // sub_code
    var subMsg: ?String = None // sub_msg
    var tradeNo: ?String = None // trade_no
    var outTradeNo: ?String = None // out_trade_no
    var buyerLogonId: ?String = None // buyer_logon_id
    var fundChange: ?String = None // fund_change
    var refundFee: ?String = None // refund_fee
    var refundCurrency: ?String = None // refund_currency
    var gmtRefundPay: ?String = None // gmt_refund_pay
    var refundDetailItemList: ?ArrayList<TradeFundBill> = None // refund_detail_item_list
    var storeName: ?String = None // store_name
    var buyerUserId: ?String = None // buyer_user_id
    var refundPresetPaytoolList: ?ArrayList<RefundPresetPaytool> = None // refund_preset_paytool_list
    var refundSettlementId: ?String = None // refund_settlement_id
    var presentRefundBuyerAmount: ?String = None // present_refund_buyer_amount
    var presentRefundDiscountAmount: ?String = None // present_refund_discount_amount
    var presentRefundMdiscountAmount: ?String = None // present_refund_mdiscount_amount

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("code", code))
            .add(bindOptionString("msg", msg))
            .add(bindOptionString("sub_code", subCode))
            .add(bindOptionString("sub_msg", subMsg))
            .add(bindOptionString("trade_no", tradeNo))
            .add(bindOptionString("out_trade_no", outTradeNo))
            .add(bindOptionString("buyer_logon_id", buyerLogonId))
            .add(bindOptionString("fund_change", fundChange))
            .add(bindOptionString("refund_fee", refundFee))
            .add(bindOptionString("refund_currency", refundCurrency))
            .add(bindOptionString("gmt_refund_pay", gmtRefundPay))
            .add(field<?ArrayList<TradeFundBill>>("refund_detail_item_list", refundDetailItemList))
            .add(bindOptionString("store_name", storeName))
            .add(bindOptionString("buyer_user_id", buyerUserId))
            .add(field<?ArrayList<RefundPresetPaytool>>("refund_preset_paytool_list", refundPresetPaytoolList))
            .add(bindOptionString("refund_settlement_id", refundSettlementId))
            .add(bindOptionString("present_refund_buyer_amount", presentRefundBuyerAmount))
            .add(bindOptionString("present_refund_discount_amount", presentRefundDiscountAmount))
            .add(bindOptionString("present_refund_mdiscount_amount", presentRefundMdiscountAmount))
    }

    public static func deserialize(dm: DataModel): RefundResponse {
        var res = RefundResponse()
        res.code = optionStringGet("code", dm)
        res.msg = optionStringGet("msg", dm)
        res.subCode = optionStringGet("sub_code", dm)
        res.subMsg = optionStringGet("sub_msg", dm)
        res.tradeNo = optionStringGet("trade_no", dm)
        res.outTradeNo = optionStringGet("out_trade_no", dm)
        res.buyerLogonId = optionStringGet("buyer_logon_id", dm)
        res.fundChange = optionStringGet("fund_change", dm)
        res.refundFee = optionStringGet("refund_fee", dm)
        res.refundCurrency = optionStringGet("refund_currency", dm)
        res.gmtRefundPay = optionStringGet("gmt_refund_pay", dm)
        res.refundDetailItemList = ArrayList<TradeFundBill>.deserialize(getDms(dm).get("refund_detail_item_list"))
        res.storeName = optionStringGet("store_name", dm)
        res.buyerUserId = optionStringGet("buyer_user_id", dm)
        res.refundPresetPaytoolList = ArrayList<RefundPresetPaytool>.deserialize(
            getDms(dm).get("refund_preset_paytool_list"))
        res.refundSettlementId = optionStringGet("refund_settlement_id", dm)
        res.presentRefundBuyerAmount = optionStringGet("present_refund_buyer_amount", dm)
        res.presentRefundDiscountAmount = optionStringGet("present_refund_discount_amount", dm)
        res.presentRefundMdiscountAmount = optionStringGet("present_refund_mdiscount_amount", dm)
        return res
    }
}

class TradeFundBill <: Serializable<TradeFundBill> & JsonHelper {
    var fundChannel: ?String = None // fund_channel
    var bankCode: ?String = None // bank_code
    var amount: ?String = None // amount
    var realAmount: ?String = None // real_amount
    var fundType: ?String = None // fund_type

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("fund_channel", fundChannel))
            .add(bindOptionString("bank_code", bankCode))
            .add(bindOptionString("amount", amount))
            .add(bindOptionString("real_amount", realAmount))
            .add(bindOptionString("fund_type", fundType))
    }

    public static func deserialize(dm: DataModel): TradeFundBill {
        var res = TradeFundBill()
        res.fundChannel = optionStringGet("fund_channel", dm)
        res.bankCode = optionStringGet("bank_code", dm)
        res.amount = optionStringGet("amount", dm)
        res.realAmount = optionStringGet("real_amount", dm)
        res.fundType = optionStringGet("fund_type", dm)
        return res
    }
}

class RefundPresetPaytool <: Serializable<RefundPresetPaytool> & JsonHelper {
    var amount: ?ArrayList<String> = None // amount
    var assertTypeCode: ?String = None // assert_type_code

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(field<?ArrayList<String>>("amount", amount))
            .add(bindOptionString("assert_type_code", assertTypeCode))
    }

    public static func deserialize(dm: DataModel): RefundPresetPaytool {
        var res = RefundPresetPaytool()
        res.amount = ArrayList<String>.deserialize(getDms(dm).get("amount"))
        res.assertTypeCode = optionStringGet("assert_type_code", dm)
        return res
    }
}
