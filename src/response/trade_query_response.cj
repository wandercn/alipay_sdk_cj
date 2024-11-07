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

public class TradeQueryResponse <: Serializable<TradeQueryResponse> & JsonHelper {
    var response: QueryResponse = QueryResponse() // alipay_trade_query_response
    var sign: String = "" // sign
    var alipayCertSn: ?String = None // alipay_cert_sn

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(field<QueryResponse>("alipay_trade_query_response", response))
            .add(serSetString("sign", sign))
            .add(serSetOptionString("alipay_cert_sn", alipayCertSn))
    }

    public static func deserialize(dm: DataModel): TradeQueryResponse {
        var res = TradeQueryResponse()
        res.response = QueryResponse.deserialize(getDms(dm).get("alipay_trade_query_response"))
        res.sign = deGetString("sign", dm)
        res.alipayCertSn = deGetOptionString("alipay_cert_sn", dm)
        return res
    }
}

class QueryResponse <: Serializable<QueryResponse> & JsonHelper {
    var code: ?String = None // code
    var msg: ?String = None // msg
    var subCode: ?String = None // sub_code
    var subMsg: ?String = None // sub_msg
    var tradeNo: ?String = None // trade_no
    var outTradeNo: ?String = None // out_trade_no
    var buyerLogonId: ?String = None // buyer_logon_id
    var tradeStatus: ?String = None // trade_status
    var totalAmount: ?String = None // total_amount
    var transCurrency: ?String = None // trans_currency
    var settleCurrency: ?String = None // settle_currency
    var settleAmount: ?String = None // settle_amount
    var payCurrency: ?String = None // pay_currency
    var payAmount: ?String = None // pay_amount
    var settleTransRate: ?String = None // settle_trans_rate
    var transPayRate: ?String = None // trans_pay_rate
    var buyerPayAmount: ?String = None // buyer_pay_amount
    var pointAmount: ?String = None // point_amount
    var invoiceAmount: ?String = None // invoice_amount
    var sendPayDate: ?String = None // send_pay_date
    var receiptAmount: ?String = None // receipt_amount
    var storeId: ?String = None // store_id
    var terminalId: ?String = None // terminal_id
    var fundBillList: ?ArrayList<FundBill> = None // fund_bill_list
    var storeName: ?String = None // store_name
    var buyerUserId: ?String = None // buyer_user_id
    var chargeAmount: ?String = None // charge_amount
    var chargeFlags: ?String = None // charge_flags
    var settlementId: ?String = None // settlement_id
    var tradeSettleInfo: ?TradeSettleInfo = None // trade_settle_info
    var authTradePayMode: ?String = None // auth_trade_pay_mode
    var buyerUserType: ?String = None // buyer_user_type
    var mdiscountAmount: ?String = None // mdiscount_amount
    var discountAmount: ?String = None // discount_amount
    var buyerUserName: ?String = None // buyer_user_name
    var subject: ?String = None // subject
    var body: ?String = None // body
    var alipaySubMerchantId: ?String = None // alipay_sub_merchant_id
    var extInfos: ?String = None // ext_infos

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("code", code))
            .add(serSetOptionString("msg", msg))
            .add(serSetOptionString("sub_code", subCode))
            .add(serSetOptionString("sub_msg", subMsg))
            .add(serSetOptionString("trade_no", tradeNo))
            .add(serSetOptionString("out_trade_no", outTradeNo))
            .add(serSetOptionString("buyer_logon_id", buyerLogonId))
            .add(serSetOptionString("trade_status", tradeStatus))
            .add(serSetOptionString("total_amount", totalAmount))
            .add(serSetOptionString("trans_currency", transCurrency))
            .add(serSetOptionString("settle_currency", settleCurrency))
            .add(serSetOptionString("settle_amount", settleAmount))
            .add(serSetOptionString("pay_currency", payCurrency))
            .add(serSetOptionString("pay_amount", payAmount))
            .add(serSetOptionString("settle_trans_rate", settleTransRate))
            .add(serSetOptionString("trans_pay_rate", transPayRate))
            .add(serSetOptionString("buyer_pay_amount", buyerPayAmount))
            .add(serSetOptionString("point_amount", pointAmount))
            .add(serSetOptionString("invoice_amount", invoiceAmount))
            .add(serSetOptionString("send_pay_date", sendPayDate))
            .add(serSetOptionString("receipt_amount", receiptAmount))
            .add(serSetOptionString("store_id", storeId))
            .add(serSetOptionString("terminal_id", terminalId))
            .add(serSetOptionString("store_name", storeName))
            .add(serSetOptionString("buyer_user_id", buyerUserId))
            .add(serSetOptionString("charge_amount", chargeAmount))
            .add(serSetOptionString("charge_flags", chargeFlags))
            .add(serSetOptionString("settlement_id", settlementId))
            .add(serSetOptionString("auth_trade_pay_mode", authTradePayMode))
            .add(serSetOptionString("buyer_user_type", buyerUserType))
            .add(serSetOptionString("mdiscount_amount", mdiscountAmount))
            .add(serSetOptionString("discount_amount", discountAmount))
            .add(serSetOptionString("buyer_user_name", buyerUserName))
            .add(serSetOptionString("subject", subject))
            .add(serSetOptionString("body", body))
            .add(serSetOptionString("alipay_sub_merchant_id", alipaySubMerchantId))
            .add(serSetOptionString("ext_infos", extInfos))
            .add(field<?ArrayList<FundBill>>("fund_bill_list", fundBillList))
            .add(field<?TradeSettleInfo>("trade_settle_info", tradeSettleInfo))
    }

    public static func deserialize(dm: DataModel): QueryResponse {
        var res = QueryResponse()
        res.code = deGetOptionString("code", dm)
        res.msg = deGetOptionString("msg", dm)
        res.subCode = deGetOptionString("sub_code", dm)
        res.subMsg = deGetOptionString("sub_msg", dm)
        res.tradeNo = deGetOptionString("trade_no", dm)
        res.outTradeNo = deGetOptionString("out_trade_no", dm)
        res.buyerLogonId = deGetOptionString("buyer_logon_id", dm)
        res.tradeStatus = deGetOptionString("trade_status", dm)
        res.totalAmount = deGetOptionString("total_amount", dm)
        res.transCurrency = deGetOptionString("trans_currency", dm)
        res.settleCurrency = deGetOptionString("settle_currency", dm)
        res.settleAmount = deGetOptionString("settle_amount", dm)
        res.payCurrency = deGetOptionString("pay_currency", dm)
        res.payAmount = deGetOptionString("pay_amount", dm)
        res.settleTransRate = deGetOptionString("settle_trans_rate", dm)
        res.transPayRate = deGetOptionString("trans_pay_rate", dm)
        res.buyerPayAmount = deGetOptionString("buyer_pay_amount", dm)
        res.pointAmount = deGetOptionString("point_amount", dm)
        res.invoiceAmount = deGetOptionString("invoice_amount", dm)
        res.sendPayDate = deGetOptionString("send_pay_date", dm)
        res.receiptAmount = deGetOptionString("receipt_amount", dm)
        res.storeId = deGetOptionString("store_id", dm)
        res.terminalId = deGetOptionString("terminal_id", dm)
        res.storeName = deGetOptionString("store_name", dm)
        res.buyerUserId = deGetOptionString("buyer_user_id", dm)
        res.chargeAmount = deGetOptionString("charge_amount", dm)
        res.chargeFlags = deGetOptionString("charge_flags", dm)
        res.settlementId = deGetOptionString("settlement_id", dm)
        res.authTradePayMode = deGetOptionString("auth_trade_pay_mode", dm)
        res.buyerUserType = deGetOptionString("buyer_user_type", dm)
        res.mdiscountAmount = deGetOptionString("mdiscount_amount", dm)
        res.discountAmount = deGetOptionString("discount_amount", dm)
        res.buyerUserName = deGetOptionString("buyer_user_name", dm)
        res.subject = deGetOptionString("subject", dm)
        res.body = deGetOptionString("body", dm)
        res.alipaySubMerchantId = deGetOptionString("alipay_sub_merchant_id", dm)
        res.extInfos = deGetOptionString("ext_infos", dm)
        res.fundBillList = ArrayList<FundBill>.deserialize(getDms(dm).get("fund_bill_list"))
        res.tradeSettleInfo = TradeSettleInfo.deserialize(getDms(dm).get("trade_settle_info"))
        return res
    }
}

class TradeSettleInfo <: Serializable<TradeSettleInfo> & JsonHelper {
    var tradeSettleDetailList: ?ArrayList<TradeSettleDetail> = None // trade_settle_detail_list

    public func serialize(): DataModel {
        return DataModelStruct().add(
            field<?ArrayList<TradeSettleDetail>>("trade_settle_detail_list", tradeSettleDetailList))
    }

    public static func deserialize(dm: DataModel): TradeSettleInfo {
        var res = TradeSettleInfo()
        res.tradeSettleDetailList = ArrayList<TradeSettleDetail>.deserialize(getDms(dm).get("trade_settle_detail_list"))
        return res
    }
}

class TradeSettleDetail <: Serializable<TradeSettleDetail> & JsonHelper {
    var operationType: ?String = None // operation_type
    var operationSerialNo: ?String = None // operation_serial_no
    var operationDt: ?String = None // operation_dt
    var transOut: ?String = None // trans_out
    var transIn: ?String = None // trans_in
    var amount: ?String = None // amount

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(serSetOptionString("operation_type", operationType))
            .add(serSetOptionString("operation_serial_no", operationSerialNo))
            .add(serSetOptionString("operation_dt", operationDt))
            .add(serSetOptionString("trans_out", transOut))
            .add(serSetOptionString("trans_in", transIn))
            .add(serSetOptionString("amount", amount))
    }

    public static func deserialize(dm: DataModel): TradeSettleDetail {
        var res = TradeSettleDetail()
        res.operationType = deGetOptionString("operation_type", dm)
        res.operationSerialNo = deGetOptionString("operation_serial_no", dm)
        res.operationDt = deGetOptionString("operation_dt", dm)
        res.transOut = deGetOptionString("trans_out", dm)
        res.transIn = deGetOptionString("trans_in", dm)
        res.amount = deGetOptionString("amount", dm)
        return res
    }
}
