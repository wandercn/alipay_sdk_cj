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

public class TradeFastpayRefundQueryResponse <: Serializable<TradeFastpayRefundQueryResponse> & JsonHelper {
    public var response: RefundQueryResponse = RefundQueryResponse() // alipay_trade_fastpay_refund_query_response
    public var sign: ?String = None // sign
    public var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("sign", sign))
            .add(serSetOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<RefundQueryResponse>("alipay_trade_fastpay_refund_query_response", response))
    }

    public static func deserialize(dm: DataModel): TradeFastpayRefundQueryResponse {
        var res = TradeFastpayRefundQueryResponse()
        res.response = RefundQueryResponse.deserialize(getDms(dm).get("alipay_trade_fastpay_refund_query_response"))
        res.sign = deGetOptionString("sign", dm)
        res.alipayCertSn = deGetOptionString("alipay_cert_sn", dm)
        return res
    }
}

public class RefundQueryResponse <: Serializable<RefundQueryResponse> & JsonHelper {
    public var code: ?String = None // code
    public var msg: ?String = None // msg
    public var subCode: ?String = None // sub_code
    public var subMsg: ?String = None // sub_msg
    public var tradeNo: ?String = None // trade_no
    public var outTradeNo: ?String = None // out_trade_no
    public var outRequestNo: ?String = None // out_request_no
    public var refundReason: ?String = None // refund_reason
    public var totalAmount: ?String = None // total_amount
    public var refundAmount: ?String = None // refund_amount
    public var refundRoyaltys: ?ArrayList<RefundRoyalty> = None // refund_royaltys
    public var gmtRefundPay: ?String = None // gmt_refund_pay
    public var refundDetailItemList: ?ArrayList<TradeFundBill> = None // refund_detail_item_list
    public var sendBackFee: ?String = None // send_back_fee
    public var refundSettlementId: ?String = None // refund_settlement_id
    public var presentRefundBuyerAmount: ?String = None // present_refund_buyer_amount
    public var presentRefundDiscountAmount: ?String = None // present_refund_discount_amount
    public var presentRefundMdiscountAmount: ?String = None // present_refund_mdiscount_amount

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("code", code))
            .add(serSetOptionString("msg", msg))
            .add(serSetOptionString("sub_code", subCode))
            .add(serSetOptionString("sub_msg", subMsg))
            .add(serSetOptionString("trade_no", tradeNo))
            .add(serSetOptionString("out_trade_no", outTradeNo))
            .add(serSetOptionString("out_request_no", outRequestNo))
            .add(serSetOptionString("refund_reason", refundReason))
            .add(serSetOptionString("total_amount", totalAmount))
            .add(serSetOptionString("refund_amount", refundAmount))
            .add(field<?ArrayList<RefundRoyalty>>("refund_royaltys", refundRoyaltys))
            .add(serSetOptionString("gmt_refund_pay", gmtRefundPay))
            .add(field<?ArrayList<TradeFundBill>>("refund_detail_item_list", refundDetailItemList))
            .add(serSetOptionString("send_back_fee", sendBackFee))
            .add(serSetOptionString("refund_settlement_id", refundSettlementId))
            .add(serSetOptionString("present_refund_buyer_amount", presentRefundBuyerAmount))
            .add(serSetOptionString("present_refund_discount_amount", presentRefundDiscountAmount))
            .add(serSetOptionString("present_refund_mdiscount_amount", presentRefundMdiscountAmount))
    }

    public static func deserialize(dm: DataModel): RefundQueryResponse {
        var res = RefundQueryResponse()
        res.code = deGetOptionString("code", dm)
        res.msg = deGetOptionString("msg", dm)
        res.subCode = deGetOptionString("sub_code", dm)
        res.subMsg = deGetOptionString("sub_msg", dm)
        res.tradeNo = deGetOptionString("trade_no", dm)
        res.outTradeNo = deGetOptionString("out_trade_no", dm)
        res.outRequestNo = deGetOptionString("out_request_no", dm)
        res.refundReason = deGetOptionString("refund_reason", dm)
        res.totalAmount = deGetOptionString("total_amount", dm)
        res.refundAmount = deGetOptionString("refund_amount", dm)
        res.refundRoyaltys = ArrayList<RefundRoyalty>.deserialize(getDms(dm).get("refund_royaltys"))
        res.gmtRefundPay = deGetOptionString("gmt_refund_pay", dm)
        res.refundDetailItemList = ArrayList<TradeFundBill>.deserialize(getDms(dm).get("refund_detail_item_list"))
        res.sendBackFee = deGetOptionString("send_back_fee", dm)
        res.refundSettlementId = deGetOptionString("refund_settlement_id", dm)
        res.presentRefundBuyerAmount = deGetOptionString("present_refund_buyer_amount", dm)
        res.presentRefundDiscountAmount = deGetOptionString("present_refund_discount_amount", dm)
        res.presentRefundMdiscountAmount = deGetOptionString("present_refund_mdiscount_amount", dm)
        return res
    }
}

public class RefundRoyalty <: Serializable<RefundRoyalty> & JsonHelper {
    public var refundAmount: ?String = None // refund_amount
    public var royaltyType: ?String = None // royalty_type
    public var resultCode: ?String = None // result_code
    public var transOut: ?String = None // trans_out
    public var transOutEmail: ?String = None // trans_out_email
    public var transIn: ?String = None // trans_in
    public var transInEmail: ?String = None // trans_in_email

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("refund_amount", refundAmount))
            .add(serSetOptionString("royalty_type", royaltyType))
            .add(serSetOptionString("result_code", resultCode))
            .add(serSetOptionString("trans_out", transOut))
            .add(serSetOptionString("trans_out_email", transOutEmail))
            .add(serSetOptionString("trans_in", transIn))
            .add(serSetOptionString("trans_in_email", transInEmail))
    }

    public static func deserialize(dm: DataModel): RefundRoyalty {
        var res = RefundRoyalty()
        res.refundAmount = deGetOptionString("refund_amount", dm)
        res.royaltyType = deGetOptionString("royalty_type", dm)
        res.resultCode = deGetOptionString("result_code", dm)
        res.transOut = deGetOptionString("trans_out", dm)
        res.transOutEmail = deGetOptionString("trans_out_email", dm)
        res.transIn = deGetOptionString("trans_in", dm)
        res.transInEmail = deGetOptionString("trans_in_email", dm)
        return res
    }
}
