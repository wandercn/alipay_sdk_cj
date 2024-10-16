package alipay_sdk.biz

public class TradePrecreateBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.precreate"
    }

    public func setOutTradeNo(value: V) {
        this.set("out_trade_no", value)
    }

    public func setTotalAmount(value: V) {
        this.set("total_amount", value)
    }

    public func setSubject(value: V) {
        this.set("subject", value)
    }
}
