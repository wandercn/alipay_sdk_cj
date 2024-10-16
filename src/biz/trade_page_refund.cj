package alipay_sdk.biz

public class TradePageRefundBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.page.refund"
    }

    public func setTradeNo(value: V) {
        this.set("trade_no", value)
    }

    public func setOutTradeNo(value: V) {
        this.set("out_trade_no", value)
    }

    public func setOutRequestNo(value: V) {
        this.set("out_request_no", value)
    }

    public func setRefundAmount(value: V) {
        this.set("refund_amount", value)
    }
}
