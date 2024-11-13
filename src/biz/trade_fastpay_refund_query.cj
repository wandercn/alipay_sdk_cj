/*
   Copyright (c) 2024-present wander@rustpub.com
   hotbuild is licensed under Mulan PSL v2.
   You can use this software according to the terms and conditions of the Mulan PSL v2.
   You may obtain a copy of Mulan PSL v2 at:
            http://license.coscl.org.cn/MulanPSL2
   THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
   EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
   MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
   See the Mulan PSL v2 for more details.
 */
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
