package alipay_sdk.response

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
