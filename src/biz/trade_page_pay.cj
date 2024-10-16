package alipay_sdk.biz

public class TradePagePayBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.page.pay"
    }

    public func setOutTradeNo(value: V) {
        this.set("out_trade_no", value)
    }
    public func setProductCode(value: V) {
        this.set("product_code", value)
    }
    public func setTotalAmount(value: V) {
        this.set("total_amount", value)
    }
    public func setSubject(value: V) {
        this.set("subject", value)
    }
}
