package alipay_sdk

import serialization.serialization.*

public class TradeCreateResponse <: Serializable<TradeCreateResponse> {
    var response: CreateResponse //`json:"alipay_trade_create_response,omitempty"`
    var sign: String //    `json:"sign"`
    var alipayCertSn: String //`json:"alipay_cert_sn,omitempty"`

    init() {
        this.response = CreateResponse()
        this.sign = ""
        this.alipayCertSn = ""
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<String>("sign", sign)).add(field<String>("alipay_cert_sn", alipayCertSn)).add(
            field<CreateResponse>("alipay_trade_create_response", response))
    }

    public static func deserialize(dm: DataModel): TradeCreateResponse {
        let dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var res = TradeCreateResponse()
        res.response = CreateResponse.deserialize(dms.get("alipay_trade_create_response"))
        res.sign = String.deserialize(dms.get("sign"))
        res.alipayCertSn = String.deserialize(dms.get("alipay_cert_sn"))
        return res
    }
}

class CreateResponse <: Serializable<CreateResponse> {
    var code: String // `json:"code,omitempty"`
    var msg: String //`json:"msg,omitempty"`
    var subCode: String // `json:"sub_code,omitempty"`
    var subMsg: String // `json:"sub_msg,omitempty"`
    var tradeNo: String // `json:"trade_no,omitempty"`
    var outTradeNo: String // `json:"out_trade_no,omitempty"`
    init() {
        this.code = ""
        this.msg = ""
        this.subCode = ""
        this.subMsg = ""
        this.tradeNo = ""
        this.outTradeNo = ""
    }
    public func serialize(): DataModel {
        return DataModelStruct().add(field<String>("code", code)).add(field<String>("msg", msg)).add(
            field<String>("sub_code", subCode)).add(field<String>("sub_msg", subMsg)).add(
            field<String>("trade_no", tradeNo)).add(field<String>("out_trade_no", outTradeNo))
    }

    public static func deserialize(dm: DataModel): CreateResponse {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var res = CreateResponse()
        res.code = String.deserialize(dms.get("code"))
        res.msg = String.deserialize(dms.get("msg"))
        res.subCode = String.deserialize(dms.get("sub_code"))
        res.subMsg = String.deserialize(dms.get("sub_msg"))
        res.tradeNo = String.deserialize(dms.get("trade_no"))
        res.outTradeNo = String.deserialize(dms.get("out_trade_no"))
        return res
    }
}
