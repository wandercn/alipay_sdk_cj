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

public class TradeRefundResponse <: Serializable<TradeRefundResponse> & JsonHelper {
    var response: RefundResponse = RefundResponse() // alipay_trade_refund_response
    var sign: ?String = None // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("sign", sign))
            .add(serSetOptionString("alipay_cert_sn", alipayCertSn))
            .add(field<RefundResponse>("alipay_trade_refund_response", response))
    }

    public static func deserialize(dm: DataModel): TradeRefundResponse {
        var res = TradeRefundResponse()
        res.response = RefundResponse.deserialize(getDms(dm).get("alipay_trade_refund_response"))
        res.sign = deGetOptionString("sign", dm)
        res.alipayCertSn = deGetOptionString("alipay_cert_sn", dm)
        return res
    }
}

class RefundResponse <: Serializable<RefundResponse> & JsonHelper {
    var code: ?String = None // code
    var msg: ?String = None // msg
    var subCode: ?String = None // sub_code
    var subMsg: ?String = None // sub_msg
    var tradeNo: ?String = None // trade_no
    var outTradeNo: ?String = None // out_trade_no
    var buyerLogonId: ?String = None // buyer_logon_id
    var fundChange: ?String = None // fund_change
    var refundFee: ?String = None // refund_fee
    var refundCurrency: ?String = None // refund_currency
    var gmtRefundPay: ?String = None // gmt_refund_pay
    var refundDetailItemList: ?ArrayList<TradeFundBill> = None // refund_detail_item_list
    var storeName: ?String = None // store_name
    var buyerUserId: ?String = None // buyer_user_id
    var refundPresetPaytoolList: ?ArrayList<RefundPresetPaytool> = None // refund_preset_paytool_list
    var refundSettlementId: ?String = None // refund_settlement_id
    var presentRefundBuyerAmount: ?String = None // present_refund_buyer_amount
    var presentRefundDiscountAmount: ?String = None // present_refund_discount_amount
    var presentRefundMdiscountAmount: ?String = None // present_refund_mdiscount_amount

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("code", code))
            .add(serSetOptionString("msg", msg))
            .add(serSetOptionString("sub_code", subCode))
            .add(serSetOptionString("sub_msg", subMsg))
            .add(serSetOptionString("trade_no", tradeNo))
            .add(serSetOptionString("out_trade_no", outTradeNo))
            .add(serSetOptionString("buyer_logon_id", buyerLogonId))
            .add(serSetOptionString("fund_change", fundChange))
            .add(serSetOptionString("refund_fee", refundFee))
            .add(serSetOptionString("refund_currency", refundCurrency))
            .add(serSetOptionString("gmt_refund_pay", gmtRefundPay))
            .add(field<?ArrayList<TradeFundBill>>("refund_detail_item_list", refundDetailItemList))
            .add(serSetOptionString("store_name", storeName))
            .add(serSetOptionString("buyer_user_id", buyerUserId))
            .add(field<?ArrayList<RefundPresetPaytool>>("refund_preset_paytool_list", refundPresetPaytoolList))
            .add(serSetOptionString("refund_settlement_id", refundSettlementId))
            .add(serSetOptionString("present_refund_buyer_amount", presentRefundBuyerAmount))
            .add(serSetOptionString("present_refund_discount_amount", presentRefundDiscountAmount))
            .add(serSetOptionString("present_refund_mdiscount_amount", presentRefundMdiscountAmount))
    }

    public static func deserialize(dm: DataModel): RefundResponse {
        var res = RefundResponse()
        res.code = deGetOptionString("code", dm)
        res.msg = deGetOptionString("msg", dm)
        res.subCode = deGetOptionString("sub_code", dm)
        res.subMsg = deGetOptionString("sub_msg", dm)
        res.tradeNo = deGetOptionString("trade_no", dm)
        res.outTradeNo = deGetOptionString("out_trade_no", dm)
        res.buyerLogonId = deGetOptionString("buyer_logon_id", dm)
        res.fundChange = deGetOptionString("fund_change", dm)
        res.refundFee = deGetOptionString("refund_fee", dm)
        res.refundCurrency = deGetOptionString("refund_currency", dm)
        res.gmtRefundPay = deGetOptionString("gmt_refund_pay", dm)
        res.refundDetailItemList = ArrayList<TradeFundBill>.deserialize(getDms(dm).get("refund_detail_item_list"))
        res.storeName = deGetOptionString("store_name", dm)
        res.buyerUserId = deGetOptionString("buyer_user_id", dm)
        res.refundPresetPaytoolList = ArrayList<RefundPresetPaytool>.deserialize(
            getDms(dm).get("refund_preset_paytool_list"))
        res.refundSettlementId = deGetOptionString("refund_settlement_id", dm)
        res.presentRefundBuyerAmount = deGetOptionString("present_refund_buyer_amount", dm)
        res.presentRefundDiscountAmount = deGetOptionString("present_refund_discount_amount", dm)
        res.presentRefundMdiscountAmount = deGetOptionString("present_refund_mdiscount_amount", dm)
        return res
    }
}

class TradeFundBill <: Serializable<TradeFundBill> & JsonHelper {
    var fundChannel: ?String = None // fund_channel
    var bankCode: ?String = None // bank_code
    var amount: ?String = None // amount
    var realAmount: ?String = None // real_amount
    var fundType: ?String = None // fund_type

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("fund_channel", fundChannel))
            .add(serSetOptionString("bank_code", bankCode))
            .add(serSetOptionString("amount", amount))
            .add(serSetOptionString("real_amount", realAmount))
            .add(serSetOptionString("fund_type", fundType))
    }

    public static func deserialize(dm: DataModel): TradeFundBill {
        var res = TradeFundBill()
        res.fundChannel = deGetOptionString("fund_channel", dm)
        res.bankCode = deGetOptionString("bank_code", dm)
        res.amount = deGetOptionString("amount", dm)
        res.realAmount = deGetOptionString("real_amount", dm)
        res.fundType = deGetOptionString("fund_type", dm)
        return res
    }
}

class RefundPresetPaytool <: Serializable<RefundPresetPaytool> & JsonHelper {
    var amount: ?ArrayList<String> = None // amount
    var assertTypeCode: ?String = None // assert_type_code

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(field<?ArrayList<String>>("amount", amount))
            .add(serSetOptionString("assert_type_code", assertTypeCode))
    }

    public static func deserialize(dm: DataModel): RefundPresetPaytool {
        var res = RefundPresetPaytool()
        res.amount = ArrayList<String>.deserialize(getDms(dm).get("amount"))
        res.assertTypeCode = deGetOptionString("assert_type_code", dm)
        return res
    }
}
