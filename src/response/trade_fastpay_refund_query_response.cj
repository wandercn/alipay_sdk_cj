package alipay_sdk.response

import serialization.serialization.{Serializable, DataModel, DataModelStruct, field}
import std.collection.ArrayList
import alipay_sdk.jsonhelper.JsonHelper

public class TradeFastpayRefundQueryResponse <: Serializable<TradeFastpayRefundQueryResponse> & JsonHelper {
    var response: RefundQueryResponse = RefundQueryResponse() // alipay_trade_fastpay_refund_query_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("sign", sign))
            .add(bindOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<RefundQueryResponse>("alipay_trade_fastpay_refund_query_response", response))
    }

    public static func deserialize(dm: DataModel): TradeFastpayRefundQueryResponse {
        var res = TradeFastpayRefundQueryResponse()
        res.response = RefundQueryResponse.deserialize(getDms(dm).get("alipay_trade_fastpay_refund_query_response"))
        res.sign = optionStringGet("sign", dm)
        res.alipayCertSn = optionStringGet("alipay_cert_sn", dm)
        return res
    }
}

class RefundQueryResponse <: Serializable<RefundQueryResponse> & JsonHelper {
    var code: ?String = None // code
    var msg: ?String = None // msg
    var subCode: ?String = None // sub_code
    var subMsg: ?String = None // sub_msg
    var tradeNo: ?String = None // trade_no
    var outTradeNo: ?String = None // out_trade_no
    var outRequestNo: ?String = None // out_request_no
    var refundReason: ?String = None // refund_reason
    var totalAmount: ?String = None // total_amount
    var refundAmount: ?String = None // refund_amount
    var refundRoyaltys: ?ArrayList<RefundRoyalty> = None // refund_royaltys
    var gmtRefundPay: ?String = None // gmt_refund_pay
    var refundDetailItemList: ?ArrayList<TradeFundBill> = None // refund_detail_item_list
    var sendBackFee: ?String = None // send_back_fee
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
            .add(bindOptionString("out_request_no", outRequestNo))
            .add(bindOptionString("refund_reason", refundReason))
            .add(bindOptionString("total_amount", totalAmount))
            .add(bindOptionString("refund_amount", refundAmount))
            .add(field<?ArrayList<RefundRoyalty>>("refund_royaltys", refundRoyaltys))
            .add(bindOptionString("gmt_refund_pay", gmtRefundPay))
            .add(field<?ArrayList<TradeFundBill>>("refund_detail_item_list", refundDetailItemList))
            .add(bindOptionString("send_back_fee", sendBackFee))
            .add(bindOptionString("refund_settlement_id", refundSettlementId))
            .add(bindOptionString("present_refund_buyer_amount", presentRefundBuyerAmount))
            .add(bindOptionString("present_refund_discount_amount", presentRefundDiscountAmount))
            .add(bindOptionString("present_refund_mdiscount_amount", presentRefundMdiscountAmount))
    }

    public static func deserialize(dm: DataModel): RefundQueryResponse {
        var res = RefundQueryResponse()
        res.code = optionStringGet("code", dm)
        res.msg = optionStringGet("msg", dm)
        res.subCode = optionStringGet("sub_code", dm)
        res.subMsg = optionStringGet("sub_msg", dm)
        res.tradeNo = optionStringGet("trade_no", dm)
        res.outTradeNo = optionStringGet("out_trade_no", dm)
        res.outRequestNo = optionStringGet("out_request_no", dm)
        res.refundReason = optionStringGet("refund_reason", dm)
        res.totalAmount = optionStringGet("total_amount", dm)
        res.refundAmount = optionStringGet("refund_amount", dm)
        res.refundRoyaltys = ArrayList<RefundRoyalty>.deserialize(getDms(dm).get("refund_royaltys"))
        res.gmtRefundPay = optionStringGet("gmt_refund_pay", dm)
        res.refundDetailItemList = ArrayList<TradeFundBill>.deserialize(getDms(dm).get("refund_detail_item_list"))
        res.sendBackFee = optionStringGet("send_back_fee", dm)
        res.refundSettlementId = optionStringGet("refund_settlement_id", dm)
        res.presentRefundBuyerAmount = optionStringGet("present_refund_buyer_amount", dm)
        res.presentRefundDiscountAmount = optionStringGet("present_refund_discount_amount", dm)
        res.presentRefundMdiscountAmount = optionStringGet("present_refund_mdiscount_amount", dm)
        return res
    }
}

class RefundRoyalty <: Serializable<RefundRoyalty> & JsonHelper {
    var refundAmount: ?String = None // refund_amount
    var royaltyType: ?String = None // royalty_type
    var resultCode: ?String = None // result_code
    var transOut: ?String = None // trans_out
    var transOutEmail: ?String = None // trans_out_email
    var transIn: ?String = None // trans_in
    var transInEmail: ?String = None // trans_in_email

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("refund_amount", refundAmount))
            .add(bindOptionString("royalty_type", royaltyType))
            .add(bindOptionString("result_code", resultCode))
            .add(bindOptionString("trans_out", transOut))
            .add(bindOptionString("trans_out_email", transOutEmail))
            .add(bindOptionString("trans_in", transIn))
            .add(bindOptionString("trans_in_email", transInEmail))
    }

    public static func deserialize(dm: DataModel): RefundRoyalty {
        var res = RefundRoyalty()
        res.refundAmount = optionStringGet("refund_amount", dm)
        res.royaltyType = optionStringGet("royalty_type", dm)
        res.resultCode = optionStringGet("result_code", dm)
        res.transOut = optionStringGet("trans_out", dm)
        res.transOutEmail = optionStringGet("trans_out_email", dm)
        res.transIn = optionStringGet("trans_in", dm)
        res.transInEmail = optionStringGet("trans_in_email", dm)
        return res
    }
}
