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
            .add(bindString("sign", sign))
            .add(bindOptionString("alipay_cert_sn", alipayCertSn))
    }

    public static func deserialize(dm: DataModel): TradeQueryResponse {
        var res = TradeQueryResponse()
        res.response = QueryResponse.deserialize(getDms(dm).get("alipay_trade_query_response"))
        res.sign = stringGet("sign", dm)
        res.alipayCertSn = optionStringGet("alipay_cert_sn", dm)
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
            .add(bindOptionString("code", code))
            .add(bindOptionString("msg", msg))
            .add(bindOptionString("sub_code", subCode))
            .add(bindOptionString("sub_msg", subMsg))
            .add(bindOptionString("trade_no", tradeNo))
            .add(bindOptionString("out_trade_no", outTradeNo))
            .add(bindOptionString("buyer_logon_id", buyerLogonId))
            .add(bindOptionString("trade_status", tradeStatus))
            .add(bindOptionString("total_amount", totalAmount))
            .add(bindOptionString("trans_currency", transCurrency))
            .add(bindOptionString("settle_currency", settleCurrency))
            .add(bindOptionString("settle_amount", settleAmount))
            .add(bindOptionString("pay_currency", payCurrency))
            .add(bindOptionString("pay_amount", payAmount))
            .add(bindOptionString("settle_trans_rate", settleTransRate))
            .add(bindOptionString("trans_pay_rate", transPayRate))
            .add(bindOptionString("buyer_pay_amount", buyerPayAmount))
            .add(bindOptionString("point_amount", pointAmount))
            .add(bindOptionString("invoice_amount", invoiceAmount))
            .add(bindOptionString("send_pay_date", sendPayDate))
            .add(bindOptionString("receipt_amount", receiptAmount))
            .add(bindOptionString("store_id", storeId))
            .add(bindOptionString("terminal_id", terminalId))
            .add(bindOptionString("store_name", storeName))
            .add(bindOptionString("buyer_user_id", buyerUserId))
            .add(bindOptionString("charge_amount", chargeAmount))
            .add(bindOptionString("charge_flags", chargeFlags))
            .add(bindOptionString("settlement_id", settlementId))
            .add(bindOptionString("auth_trade_pay_mode", authTradePayMode))
            .add(bindOptionString("buyer_user_type", buyerUserType))
            .add(bindOptionString("mdiscount_amount", mdiscountAmount))
            .add(bindOptionString("discount_amount", discountAmount))
            .add(bindOptionString("buyer_user_name", buyerUserName))
            .add(bindOptionString("subject", subject))
            .add(bindOptionString("body", body))
            .add(bindOptionString("alipay_sub_merchant_id", alipaySubMerchantId))
            .add(bindOptionString("ext_infos", extInfos))
            .add(field<?ArrayList<FundBill>>("fund_bill_list", fundBillList))
            .add(field<?TradeSettleInfo>("trade_settle_info", tradeSettleInfo))
    }

    public static func deserialize(dm: DataModel): QueryResponse {
        var res = QueryResponse()
        res.code = optionStringGet("code", dm)
        res.msg = optionStringGet("msg", dm)
        res.subCode = optionStringGet("sub_code", dm)
        res.subMsg = optionStringGet("sub_msg", dm)
        res.tradeNo = optionStringGet("trade_no", dm)
        res.outTradeNo = optionStringGet("out_trade_no", dm)
        res.buyerLogonId = optionStringGet("buyer_logon_id", dm)
        res.tradeStatus = optionStringGet("trade_status", dm)
        res.totalAmount = optionStringGet("total_amount", dm)
        res.transCurrency = optionStringGet("trans_currency", dm)
        res.settleCurrency = optionStringGet("settle_currency", dm)
        res.settleAmount = optionStringGet("settle_amount", dm)
        res.payCurrency = optionStringGet("pay_currency", dm)
        res.payAmount = optionStringGet("pay_amount", dm)
        res.settleTransRate = optionStringGet("settle_trans_rate", dm)
        res.transPayRate = optionStringGet("trans_pay_rate", dm)
        res.buyerPayAmount = optionStringGet("buyer_pay_amount", dm)
        res.pointAmount = optionStringGet("point_amount", dm)
        res.invoiceAmount = optionStringGet("invoice_amount", dm)
        res.sendPayDate = optionStringGet("send_pay_date", dm)
        res.receiptAmount = optionStringGet("receipt_amount", dm)
        res.storeId = optionStringGet("store_id", dm)
        res.terminalId = optionStringGet("terminal_id", dm)
        res.storeName = optionStringGet("store_name", dm)
        res.buyerUserId = optionStringGet("buyer_user_id", dm)
        res.chargeAmount = optionStringGet("charge_amount", dm)
        res.chargeFlags = optionStringGet("charge_flags", dm)
        res.settlementId = optionStringGet("settlement_id", dm)
        res.authTradePayMode = optionStringGet("auth_trade_pay_mode", dm)
        res.buyerUserType = optionStringGet("buyer_user_type", dm)
        res.mdiscountAmount = optionStringGet("mdiscount_amount", dm)
        res.discountAmount = optionStringGet("discount_amount", dm)
        res.buyerUserName = optionStringGet("buyer_user_name", dm)
        res.subject = optionStringGet("subject", dm)
        res.body = optionStringGet("body", dm)
        res.alipaySubMerchantId = optionStringGet("alipay_sub_merchant_id", dm)
        res.extInfos = optionStringGet("ext_infos", dm)
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
            .add(bindOptionString("operation_type", operationType))
            .add(bindOptionString("operation_serial_no", operationSerialNo))
            .add(bindOptionString("operation_dt", operationDt))
            .add(bindOptionString("trans_out", transOut))
            .add(bindOptionString("trans_in", transIn))
            .add(bindOptionString("amount", amount))
    }

    public static func deserialize(dm: DataModel): TradeSettleDetail {
        var res = TradeSettleDetail()
        res.operationType = optionStringGet("operation_type", dm)
        res.operationSerialNo = optionStringGet("operation_serial_no", dm)
        res.operationDt = optionStringGet("operation_dt", dm)
        res.transOut = optionStringGet("trans_out", dm)
        res.transIn = optionStringGet("trans_in", dm)
        res.amount = optionStringGet("amount", dm)
        return res
    }
}
