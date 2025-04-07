package alipay_sdk.test

import alipay_sdk.getAsyncCallBackMsgSource
import std.unittest.*
import std.unittest.testmacro.*
// 待签名字符串
const TEST_SOURCE = #"app_id=2018051460120527&auth_app_id=2018051460120527&buyer_id=2088102051478752&buyer_logon_id=159****9805&buyer_pay_amount=1.80&charset=utf-8&fund_bill_list=[{"amount":"1.80","fundChannel":"ALIPAYACCOUNT"}]&gmt_create=2025-03-10 11:36:58&gmt_payment=2025-03-10 11:36:58&invoice_amount=1.80&notify_id=2025031001222113658078751456190861&notify_time=2025-03-10 11:50:49&notify_type=trade_status_sync&out_trade_no=67c7ff794d06060001ada651&point_amount=0.00&receipt_amount=1.80&seller_email=finances@quantibio.com&seller_id=2088411714187990&subject=量化益生菌&total_amount=1.80&trade_no=2025031022001478751419336105&trade_status=TRADE_SUCCESS&version=1.0"#

// 支付宝消息签名
const TEST_SIGN = "LAYYO/0JLEbbLCSBgxMVsJuSZ7Gz/6GZfaLmRZVYl6B+PnUfZlU57MTrmhoQgeBCjEgphCO2X5tIaZKae3/cQzDRV5imkhTu4U5JcNhGNUx8zNXfEd5IXP5AH11sGE1amArJ/W4rjc3OkVIptKF7aIR3/bApcWk+oNGCQwt4YFAUFJXEDqOzE8UJdaognZ/4fR5yweaMpdemkJ+qN024LBXtKGtb2y7z7jiabRLCNjc6+mwjuUB0OtH02xLTE5JI9ab1BfKSJY2sxW7LtIpnv+s0X62UwydrqEaHVlbfDCX3Gj2gRE1bL2Gwe62q/vS34Pl0gKbFE1j1JdSFd5KjxA=="
const TEST_RAW_BODY = #"gmt_create=2025-03-10+11:36:58&charset=utf-8&seller_email=finances@quantibio.com&subject=量化益生菌&sign=LAYYO/0JLEbbLCSBgxMVsJuSZ7Gz/6GZfaLmRZVYl6B+PnUfZlU57MTrmhoQgeBCjEgphCO2X5tIaZKae3/cQzDRV5imkhTu4U5JcNhGNUx8zNXfEd5IXP5AH11sGE1amArJ/W4rjc3OkVIptKF7aIR3/bApcWk+oNGCQwt4YFAUFJXEDqOzE8UJdaognZ/4fR5yweaMpdemkJ+qN024LBXtKGtb2y7z7jiabRLCNjc6+mwjuUB0OtH02xLTE5JI9ab1BfKSJY2sxW7LtIpnv+s0X62UwydrqEaHVlbfDCX3Gj2gRE1bL2Gwe62q/vS34Pl0gKbFE1j1JdSFd5KjxA==&buyer_id=2088102051478752&invoice_amount=1.80&notify_id=2025031001222113658078751456190861&fund_bill_list=[{"amount":"1.80","fundChannel":"ALIPAYACCOUNT"}]&notify_type=trade_status_sync&trade_status=TRADE_SUCCESS&receipt_amount=1.80&buyer_pay_amount=1.80&app_id=2018051460120527&sign_type=RSA2&seller_id=2088411714187990&gmt_payment=2025-03-10+11:36:58&notify_time=2025-03-10+11:50:49&version=1.0&out_trade_no=67c7ff794d06060001ada651&total_amount=1.80&trade_no=2025031022001478751419336105&auth_app_id=2018051460120527&buyer_logon_id=159****9805&point_amount=0.00"#

@Test
public func getAsyncCallBackMsgSourceTest() {
    let (source, sign, signType) = getAsyncCallBackMsgSource(TEST_RAW_BODY.toArray())
    println("test: ${source}")
    @Expect(TEST_SOURCE,source)
    @Expect(TEST_SIGN,sign)
}