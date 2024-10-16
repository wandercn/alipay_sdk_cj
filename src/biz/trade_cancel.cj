package alipay_sdk.biz

public class TradeCancelBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.cancel"
    }

    public func setOutTradeNo(value: V) {
        this.set("out_trade_no", value)
    }

    public func stTradeNo(value: V) {
        this.set("trade_no", value)
    }
}
