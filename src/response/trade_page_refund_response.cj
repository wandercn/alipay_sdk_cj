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

public class TradePageRefundResponse <: Serializable<TradePageRefundResponse> & JsonHelper {
    var response: PageRefundResponse = PageRefundResponse() // alipay_trade_page_refund_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("sign", sign))
            .add(serSetOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<PageRefundResponse>("alipay_trade_page_refund_response", response))
    }

    public static func deserialize(dm: DataModel): TradePageRefundResponse {
        var res = TradePageRefundResponse()
        res.response = PageRefundResponse.deserialize(getDms(dm).get("alipay_trade_page_refund_response"))
        res.sign = deGetOptionString("sign", dm)
        res.alipayCertSn = deGetOptionString("alipay_cert_sn", dm)
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
            .add(serSetOptionString("code", code))
            .add(serSetOptionString("msg", msg))
            .add(serSetOptionString("sub_code", subCode))
            .add(serSetOptionString("sub_msg", subMsg))
            .add(serSetOptionString("trade_no", tradeNo))
            .add(serSetOptionString("out_trade_no", outTradeNo))
            .add(serSetOptionString("out_request_no", outRequestNo))
            .add(serSetOptionString("refund_amount", refundAmount))
    }

    public static func deserialize(dm: DataModel): PageRefundResponse {
        var res = PageRefundResponse()
        res.code = deGetOptionString("code", dm)
        res.msg = deGetOptionString("msg", dm)
        res.subCode = deGetOptionString("sub_code", dm)
        res.subMsg = deGetOptionString("sub_msg", dm)
        res.tradeNo = deGetOptionString("trade_no", dm)
        res.outTradeNo = deGetOptionString("out_trade_no", dm)
        res.outRequestNo = deGetOptionString("out_request_no", dm)
        res.refundAmount = deGetOptionString("refund_amount", dm)
        return res
    }
}
