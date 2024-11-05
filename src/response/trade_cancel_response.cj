package alipay_sdk.response

import serialization.serialization.{Serializable, DataModel, DataModelStruct, field}
import std.collection.ArrayList
import alipay_sdk.jsonhelper.JsonHelper

public class TradeCancelResponse <: Serializable<TradeCancelResponse> & JsonHelper {
    var response: CancelResponse = CancelResponse() // alipay_trade_cancel_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("sign", sign))
            .add(bindOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<CancelResponse>("alipay_trade_cancel_response", response))
    }

    public static func deserialize(dm: DataModel): TradeCancelResponse {
        var res = TradeCancelResponse()
        res.response = CancelResponse.deserialize(getDms(dm).get("alipay_trade_cancel_response"))
        res.sign = optionStringGet("sign", dm)
        res.alipayCertSn = optionStringGet("alipay_cert_sn", dm)
        return res
    }
}

class CancelResponse <: Serializable<CancelResponse> & JsonHelper {
    var code: ?String = None // code
    var msg: ?String = None // msg
    var subCode: ?String = None // sub_code
    var subMsg: ?String = None // sub_msg
    var tradeNo: ?String = None // trade_no
    var outTradeNo: ?String = None // out_trade_no
    var retryFlag: ?String = None // retry_flag
    var action: ?String = None // action
    var gmtRefundPay: ?String = None // gmt_refund_pay
    var refundSettlementId: ?String = None // refund_settlement_id

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("code", code))
            .add(bindOptionString("msg", msg))
            .add(bindOptionString("sub_code", subCode))
            .add(bindOptionString("sub_msg", subMsg))
            .add(bindOptionString("trade_no", tradeNo))
            .add(bindOptionString("out_trade_no", outTradeNo))
            .add(bindOptionString("retry_flag", retryFlag))
            .add(bindOptionString("action", action))
            .add(bindOptionString("gmt_refund_pay", gmtRefundPay))
            .add(bindOptionString("refund_settlement_id", refundSettlementId))
    }

    public static func deserialize(dm: DataModel): CancelResponse {
        var res = CancelResponse()
        res.code = optionStringGet("code", dm)
        res.msg = optionStringGet("msg", dm)
        res.subCode = optionStringGet("sub_code", dm)
        res.subMsg = optionStringGet("sub_msg", dm)
        res.tradeNo = optionStringGet("trade_no", dm)
        res.outTradeNo = optionStringGet("out_trade_no", dm)
        res.retryFlag = optionStringGet("retry_flag", dm)
        res.action = optionStringGet("action", dm)
        res.gmtRefundPay = optionStringGet("gmt_refund_pay", dm)
        res.refundSettlementId = optionStringGet("refund_settlement_id", dm)
        return res
    }
}
