package alipay_sdk.biz

public class TradeAppPayBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.app.pay"
    }
    // 以下是设置必选字段方法
    public func setTotalAmount(value: V) {
        this.set("total_amount", value)
    }

    public func setSubject(value: V) {
        this.set("subject", value)
    }

    public func setOutTradeNo(value: V) {
        this.set("out_trade_no", value)
    }
}
