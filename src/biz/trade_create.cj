package alipay_sdk.biz

public class TradeCreateBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.create"
    }
    // 以下是设置必选字段方法
    public func setOutTradeNo(value: V) {
        this.set("out_trade_no", value)
    }

    public func setTotalAmount(value: V) {
        this.set("total_amount", value)
    }

    public func setSubject(value: V) {
        this.set("subject", value)
    }

    public func setBuyerId(value: V) {
        this.set("buyer_id", value)
    }
}
