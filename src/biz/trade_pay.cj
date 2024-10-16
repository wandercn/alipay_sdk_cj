package alipay_sdk.biz

public class TradePayBiz <: BizObject & BizContenter {
    public func method(): String {
        return "alipay.trade.pay"
    }

    public func setOuttradeNo(value: V) {
        this.set("out_trade_no", value)
    }

    public func setScene(value: V) {
        this.set("scene", value)
    }

    public func setAuthCode(value: V) {
        this.set("auth_code", value)
    }

    public func setSubject(value: V) {
        this.set("subject", value)
    }
}
