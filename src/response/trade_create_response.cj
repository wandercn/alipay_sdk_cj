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

import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, field}
import std.collection.ArrayList
import alipay_sdk.jsonhelper.JsonHelper

public class TradeCreateResponse <: Serializable<TradeCreateResponse> & JsonHelper {
    public var response: CreateResponse = CreateResponse() // alipay_trade_create_response
    public var sign: ?String = None // sign
    public var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("sign", sign))
            .add(serSetOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<CreateResponse>("alipay_trade_create_response", response))
    }

    public static func deserialize(dm: DataModel): TradeCreateResponse {
        var res = TradeCreateResponse()
        res.response = CreateResponse.deserialize(getDms(dm).get("alipay_trade_create_response"))
        res.sign = deGetOptionString("sign", dm)
        res.alipayCertSn = deGetOptionString("alipay_cert_sn", dm)
        return res
    }
}

public class CreateResponse <: Serializable<CreateResponse> & JsonHelper {
    public var code: ?String = None // code,
    public var msg: ?String = None // msg,
    public var subCode: ?String = None // sub_code,
    public var subMsg: ?String = None // sub_msg
    public var tradeNo: ?String = None // trade_no,omitempty
    public var outTradeNo: ?String = None // out_trade_no
    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("code", code))
            .add(serSetOptionString("msg", msg))
            .add(serSetOptionString("sub_code", subCode))
            .add(serSetOptionString("sub_msg", subMsg))
            .add(serSetOptionString("trade_no", tradeNo))
            .add(serSetOptionString("out_trade_no", outTradeNo))
    }

    public static func deserialize(dm: DataModel): CreateResponse {
        var res = CreateResponse()
        res.code = deGetOptionString("code", dm)
        res.msg = deGetOptionString("msg", dm)
        res.subCode = deGetOptionString("sub_code", dm)
        res.subMsg = deGetOptionString("sub_msg", dm)
        res.tradeNo = deGetOptionString("trade_no", dm)
        res.outTradeNo = deGetOptionString("out_trade_no", dm)
        return res
    }
}
