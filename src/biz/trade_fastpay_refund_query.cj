package alipay_sdk.biz

public class TradeFastpayRefundQueryBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.fastpay.refund.query"
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
}
