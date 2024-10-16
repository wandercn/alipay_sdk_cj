package alipay_sdk.biz

public class TradeRefundBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.refund"
    }

    public func setOutTradeNo(value: V) {
        this.set("out_trade_no", value)
    }

    public func setTradeNo(value: V) {
        this.set("trade_no", value)
    }

    public func setRefundAmount(value: V) {
        this.set("refund_amount", value)
    }
}
