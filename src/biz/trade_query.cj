package alipay_sdk.biz

public class TradeQueryBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.query"
    }

    public func setOutTradeNo(value: V) {
        this.set("out_trade_no", value)
    }

    public func setTradeNo(value: V) {
        this.set("trade_no", value)
    }
}
