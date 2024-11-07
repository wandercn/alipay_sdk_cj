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

public class TradePrecreateResponse <: Serializable<TradePrecreateResponse> & JsonHelper {
    var response: PrecreateResponse = PrecreateResponse() // alipay_trade_precreate_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("sign", sign))
            .add(serSetOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<PrecreateResponse>("alipay_trade_precreate_response", response))
    }

    public static func deserialize(dm: DataModel): TradePrecreateResponse {
        var res = TradePrecreateResponse()
        res.response = PrecreateResponse.deserialize(getDms(dm).get("alipay_trade_precreate_response"))
        res.sign = deGetOptionString("sign", dm)
        res.alipayCertSn = deGetOptionString("alipay_cert_sn", dm)
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
            .add(serSetOptionString("code", code))
            .add(serSetOptionString("msg", msg))
            .add(serSetOptionString("sub_code", subCode))
            .add(serSetOptionString("sub_msg", subMsg))
            .add(serSetOptionString("out_trade_no", outTradeNo))
            .add(serSetOptionString("qr_code", qrCode))
    }

    public static func deserialize(dm: DataModel): PrecreateResponse {
        var res = PrecreateResponse()
        res.code = deGetOptionString("code", dm)
        res.msg = deGetOptionString("msg", dm)
        res.subCode = deGetOptionString("sub_code", dm)
        res.subMsg = deGetOptionString("sub_msg", dm)
        res.outTradeNo = deGetOptionString("out_trade_no", dm)
        res.qrCode = deGetOptionString("qr_code", dm)
        return res
    }
}
