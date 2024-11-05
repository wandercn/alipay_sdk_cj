package alipay_sdk.response

import serialization.serialization.{Serializable, DataModel, DataModelStruct, field}
import std.collection.ArrayList
import alipay_sdk.jsonhelper.JsonHelper

public class TradePageRefundResponse <: Serializable<TradePageRefundResponse> & JsonHelper {
    var response: PageRefundResponse = PageRefundResponse() // alipay_trade_page_refund_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("sign", sign))
            .add(bindOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<PageRefundResponse>("alipay_trade_page_refund_response", response))
    }

    public static func deserialize(dm: DataModel): TradePageRefundResponse {
        var res = TradePageRefundResponse()
        res.response = PageRefundResponse.deserialize(getDms(dm).get("alipay_trade_page_refund_response"))
        res.sign = optionStringGet("sign", dm)
        res.alipayCertSn = optionStringGet("alipay_cert_sn", dm)
        return res
    }
}

class PageRefundResponse <: Serializable<PageRefundResponse> & JsonHelper {
    var code: ?String = None // code
    var msg: ?String = None // msg
    var subCode: ?String = None // sub_code
    var subMsg: ?String = None // sub_msg
    var tradeNo: ?String = None // trade_no
    var outTradeNo: ?String = None // out_trade_no
    var outRequestNo: ?String = None // out_request_no
    var refundAmount: ?String = None // refund_amount

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("code", code))
            .add(bindOptionString("msg", msg))
            .add(bindOptionString("sub_code", subCode))
            .add(bindOptionString("sub_msg", subMsg))
            .add(bindOptionString("trade_no", tradeNo))
            .add(bindOptionString("out_trade_no", outTradeNo))
            .add(bindOptionString("out_request_no", outRequestNo))
            .add(bindOptionString("refund_amount", refundAmount))
    }

    public static func deserialize(dm: DataModel): PageRefundResponse {
        var res = PageRefundResponse()
        res.code = optionStringGet("code", dm)
        res.msg = optionStringGet("msg", dm)
        res.subCode = optionStringGet("sub_code", dm)
        res.subMsg = optionStringGet("sub_msg", dm)
        res.tradeNo = optionStringGet("trade_no", dm)
        res.outTradeNo = optionStringGet("out_trade_no", dm)
        res.outRequestNo = optionStringGet("out_request_no", dm)
        res.refundAmount = optionStringGet("refund_amount", dm)
        return res
    }
}
