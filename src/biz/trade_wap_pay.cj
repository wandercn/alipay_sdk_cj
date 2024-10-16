package alipay_sdk.biz

public class TradeWapPayBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.wap.pay"
    }

    public func setSubject(value: V) {
        this.set("subject", value)
    }

    public func setOuttradeNo(value: V) {
        this.set("out_trade_no", value)
    }

    public func setTotalAmount(value: V) {
        this.set("total_amount", value)
    }

    public func setQuitUrl(value: V) {
        this.set("quit_url", value)
    }

    public func setProductCode(value: V) {
        this.set("product_code", value)
    }

    public func setReturnUrl(value: V) {
        this.set("return_url", value)
    }
}
