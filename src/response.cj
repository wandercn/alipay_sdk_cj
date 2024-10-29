package alipay_sdk

import serialization.serialization.{Serializable,DataModel,DataModelStruct,field}

public class TradeCreateResponse <: Serializable<TradeCreateResponse> {
    var response: CreateResponse // alipay_trade_create_response
    var sign: Option<String> // sign
    var alipayCertSn: Option<String> // alipay_cert_sn

    init() {
        this.response = CreateResponse()
        this.sign = ""
        this.alipayCertSn = ""
    }

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(field<Option<String>>("sign", sign))
            .add(field<Option<String>>("alipay_cert_sn", alipayCertSn))
            .add(field<CreateResponse>("alipay_trade_create_response", response))
    }

    public static func deserialize(dm: DataModel): TradeCreateResponse {
        let dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var res = TradeCreateResponse()
        res.response = CreateResponse.deserialize(dms.get("alipay_trade_create_response"))
        res.sign = Option<String>.deserialize(dms.get("sign"))
        res.alipayCertSn = Option<String>.deserialize(dms.get("alipay_cert_sn"))
        return res
    }
}

class CreateResponse <: Serializable<CreateResponse> {
    var code: Option<String> // code,
    var msg: Option<String> // msg,
    var subCode: Option<String> // sub_code,
    var subMsg: Option<String> // sub_msg
    var tradeNo: Option<String> // trade_no,omitempty
    var outTradeNo: Option<String> // out_trade_no
    init() {
        this.code = ""
        this.msg = ""
        this.subCode = ""
        this.subMsg = ""
        this.tradeNo = ""
        this.outTradeNo = ""
    }
    public func serialize(): DataModel {
        return DataModelStruct()
            .add(field<Option<String>>("code", code))
            .add(field<Option<String>>("msg", msg))
            .add(field<Option<String>>("sub_code", subCode))
            .add(field<Option<String>>("sub_msg", subMsg))
            .add(field<Option<String>>("trade_no", tradeNo))
            .add(field<Option<String>>("out_trade_no", outTradeNo))
    }

    public static func deserialize(dm: DataModel): CreateResponse {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var res = CreateResponse()
        res.code = Option<String>.deserialize(dms.get("code"))
        res.msg = Option<String>.deserialize(dms.get("msg"))
        res.subCode = Option<String>.deserialize(dms.get("sub_code"))
        res.subMsg = Option<String>.deserialize(dms.get("sub_msg"))
        res.tradeNo = Option<String>.deserialize(dms.get("trade_no"))
        res.outTradeNo = Option<String>.deserialize(dms.get("out_trade_no"))
        return res
    }
}
