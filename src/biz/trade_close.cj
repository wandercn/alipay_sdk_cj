package alipay_sdk.biz

public class TradeCloseBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.close"
    }

    func setTradeNo(value: V) {
        this.set("trade_no", value)
    }

    func setOutTradeNo(value: V) {
        this.set("out_trade_no", value)
    }
}
