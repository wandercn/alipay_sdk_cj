package alipay_sdk.response

import serialization.serialization.{Serializable, DataModel, DataModelStruct, field}
import std.collection.ArrayList
import alipay_sdk.jsonhelper.JsonHelper

public class TradePrecreateResponse <: Serializable<TradePrecreateResponse> & JsonHelper {
    var response: PrecreateResponse = PrecreateResponse() // alipay_trade_precreate_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("sign", sign))
            .add(bindOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<PrecreateResponse>("alipay_trade_precreate_response", response))
    }

    public static func deserialize(dm: DataModel): TradePrecreateResponse {
        var res = TradePrecreateResponse()
        res.response = PrecreateResponse.deserialize(getDms(dm).get("alipay_trade_precreate_response"))
        res.sign = optionStringGet("sign", dm)
        res.alipayCertSn = optionStringGet("alipay_cert_sn", dm)
        return res
    }
}

class PrecreateResponse <: Serializable<PrecreateResponse> & JsonHelper {
    var code: ?String = None // code
    var msg: ?String = None // msg
    var subCode: ?String = None // sub_code
    var subMsg: ?String = None // sub_msg
    var outTradeNo: ?String = None // out_trade_no
    var qrCode: ?String = None // qr_code

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(bindOptionString("code", code))
            .add(bindOptionString("msg", msg))
            .add(bindOptionString("sub_code", subCode))
            .add(bindOptionString("sub_msg", subMsg))
            .add(bindOptionString("out_trade_no", outTradeNo))
            .add(bindOptionString("qr_code", qrCode))
    }

    public static func deserialize(dm: DataModel): PrecreateResponse {
        var res = PrecreateResponse()
        res.code = optionStringGet("code", dm)
        res.msg = optionStringGet("msg", dm)
        res.subCode = optionStringGet("sub_code", dm)
        res.subMsg = optionStringGet("sub_msg", dm)
        res.outTradeNo = optionStringGet("out_trade_no", dm)
        res.qrCode = optionStringGet("qr_code", dm)
        return res
    }
}
