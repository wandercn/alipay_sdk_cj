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
/**
 * Alipay sdk in cangjie 支付宝支付 SDK。只支持最安全的RSA2，公钥证书方式签名验证方式,默认只支持utf-8编码和JSON格式。目前只支持商户直接接入模式
 *
 *
 * RSA2密钥生成请参考<https://opendocs.alipay.com/common/02kipl> 中的公钥证书方式生成，使用CSR文件申请，密钥格式必须使用PKCS1(非java适用)
 *
 */
package alipay_sdk

import net.http.{HttpResponse, ClientBuilder, Client, HttpRequestBuilder}
import net.tls.{TlsClientConfig, CertificateVerifyMode}
import encoding.json.{JsonValue, ToJson}
import std.collection.HashMap
import serialization.serialization.{DataModel, Serializable, DataModelStruct}
import alipay_sdk.biz.{BizContenter, TradeCreateBiz, getResponseKey, TradePayBiz, TradeCloseBiz, TradeQueryBiz, 
    TradeRefundBiz, TradeAppPayBiz, TradeCancelBiz, TradeWapPayBiz, TradePagePayBiz, TradePrecreateBiz, 
    TradePageRefundBiz, TradeFastpayRefundQueryBiz}
import alipay_sdk.response.{TradeCreateResponse, TradePayResponse, TradeQueryResponse, TradeCancelResponse, 
    TradeCloseResponse, TradeFastpayRefundQueryResponse, TradePageRefundResponse, TradePrecreateResponse, 
    TradeRefundResponse}

public interface Payer {
    func getApiUrl(): String
    func getPrivateKey(): String
    func getPublicKey(): String
    func getAppCertSn(): String
    func getAlipayRootCertSn(): String
    func getAlipayPublicKey(): String
    func getAppID(): String
    func getFormat(): String
    func getCharset(): String
    func getSignType(): String
    func getVersion(): String
    func getReturnUrl(): String
    func getNotifyUrl(): String
    func setNotifyUrl(url: String): Unit
    func setSignType(signType: String): Unit
    func setCharset(chartset: String): Unit

    func execute(req: Requester): Array<Byte>
    func doAlipay(bizContent: BizContenter): Array<Byte>

    func tradeCreate(biz: TradeCreateBiz): TradeCreateResponse
    func tradePay(biz: TradePayBiz): TradePayResponse
    func tradeQuery(biz: TradeQueryBiz): TradeQueryResponse
    func tradeAppPay(biz: TradeAppPayBiz): String
    func tradeWapPay(biz: TradeWapPayBiz): String
    func tradePagePay(biz: TradePagePayBiz): String
    func tradeCancel(biz: TradeCancelBiz): TradeCancelResponse
    func tradeRefund(biz: TradeRefundBiz): TradeRefundResponse
    func tradePageRefund(biz: TradePageRefundBiz): TradePageRefundResponse
    func tradeFastpayRefundQuery(biz: TradeFastpayRefundQueryBiz): TradeFastpayRefundQueryResponse
    func tradeClose(biz: TradeCloseBiz): TradeCloseResponse
    func asyncVerifySign(rawbody: Array<Byte>): Bool
}

public class PayClient <: Payer {
    var ApiUrl: String = "" // 接口网关地址
    var PrivateKey: String = "" // rsa私钥单行文本字符串
    var PublicKey: String = "" // rsa公钥单行文本字符串
    var AlipayPublicKey: String = "" // 证书解析出的支付宝公钥
    var AppCertSn: String = "" //`json:"app_cert_sn"`          // 应用公钥证书 SN
    var AlipayRootCertSn: String = "" // `json:"alipay_root_cert_sn"`  // 支付宝根证书 SN
    var AppID: String = "" // `json:"app_id"`               // 是	32	支付宝分配给开发者的应用ID	2014072300007148
    var Format: String = "" // `json:"format,omitempty"`     // 否	40	仅支持JSON	JSON
    var Charset: String = "" // `json:"charset"`              // 是	10	请求使用的编码格式，如utf-8,gbk,gb2312等	utf-8
    var SignType: String = "" //`json:"sign_type"`            // 是	10	商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2	RSA2
    var Version: String = "" // `json:"version"`              // 是	3	调用的接口版本，固定为：1.0	1.0
    var ReturnUrl: String = "" //`json:"return_url,omitempty"` // 否 前台回跳地址 return_url 自动跳转回商户页面
    var NotifyUrl: String = "" //`json:"notify_url,omitempty"` // 支付宝服务器主动通知callback商户服务器里指定的页面http/https路径。

    public func builder(): PayClientBuilder {
        return PayClientBuilder()
    }
    public func getApiUrl(): String {
        return this.ApiUrl
    }
    public func getPrivateKey(): String {
        return this.PrivateKey
    }
    public func getPublicKey(): String {
        return this.PublicKey
    }
    public func getAppCertSn(): String {
        return this.AppCertSn
    }
    public func getAlipayRootCertSn(): String {
        return this.AlipayRootCertSn
    }
    public func getAlipayPublicKey(): String {
        return this.AlipayPublicKey
    }
    public func getAppID(): String {
        return this.AppID
    }
    public func getFormat(): String {
        return this.Format
    }
    public func getCharset(): String {
        return this.Charset
    }
    public func getSignType(): String {
        return this.SignType
    }
    public func getVersion(): String {
        return this.Version
    }
    public func getReturnUrl(): String {
        return this.ReturnUrl
    }
    public func getNotifyUrl(): String {
        return this.NotifyUrl
    }
    public func setNotifyUrl(url: String): Unit {
        this.NotifyUrl = url
    }
    public func setSignType(signType: String): Unit {
        this.SignType = signType
    }
    public func setCharset(chartset: String): Unit {
        this.Charset = chartset
    }
    public func execute(req: Requester): Array<Byte> {
        let method = req.getMethod()
        let payload = req.encodePayload()
        var tlsConfig = TlsClientConfig()
        tlsConfig.verifyMode = TrustAll

        var httpclient = ClientBuilder().tlsConfig(tlsConfig).build()
        var requestBuild = HttpRequestBuilder()
        if (method == "alipay.trade.precreate") {
            requestBuild.url(this.ApiUrl + "?" + payload).get()
        } else {
            requestBuild.url(this.ApiUrl).body(payload).post()
        }
        var request = requestBuild
            .header("Content-Type", "application/x-www-form-urlencoded;charset=utf-8")
            .header("Accept", "application/json;charset=utf-8")
            .build()
        var rsp = httpclient.send(request)
        httpclient.close()
        if (let Some(length) <- rsp.bodySize) {
            var body = Array<Byte>(length, item: 0)
            rsp.body.read(body)

            return body
        }
        throw Exception("Body is None!")
    }

    public func doAlipay(bizContent: BizContenter): Array<Byte> {
        match (bizContent.method()) {
            case "alipay.trade.wap.pay" | "alipay.trade.page.pay" => return this.createClienPageForm(bizContent)
            case "alipay.trade.app.pay" => return this.createClienSdktRequest(bizContent)
            case _ =>
                var request = Request(this).setBizContent(bizContent).setMethod(bizContent.method())
                let res = this.execute(request)
                // 同步验签
                func syncVerifySign(response: Array<Byte>): Bool {
                    var result = String.fromUtf8(response)
                    // 闭包，获取response
                    func getRawSource(): String {
                        let responseKey = getResponseKey(bizContent)
                        var dm = DataModel.fromJson(JsonValue.fromStr(result))
                        var dms = match (dm) {
                            case data: DataModelStruct => data
                            case _ => throw Exception("this data is not DataModelStruct")
                        }
                        return dms.get(responseKey).toJson().toString()
                    }
                    // 闭包，获取签名
                    func getSignture(): String {
                        let responseKey = getResponseKey(bizContent)
                        var dm = DataModel.fromJson(JsonValue.fromStr(result))
                        var dms = match (dm) {
                            case data: DataModelStruct => data
                            case _ => throw Exception("this data is not DataModelStruct")
                        }

                        return String.deserialize(dms.get("sign"))
                    }
                    var singer = newSigner(this.getSignType())
                    singer.setPublicKey(this.getAlipayPublicKey())

                    let passd = singer.verify(getRawSource(), getSignture())
                    return passd
                }
                let isPass = syncVerifySign(res)
                if (!isPass) {
                    throw Exception("syncVerifySign no passed!")
                } else {
                    return res
                }
        }
    }

    func createClienPageForm(bizContent: BizContenter): Array<Byte> {
        var request = Request(this).setBizContent(bizContent).setMethod(bizContent.method())
        let encodeQuery = request.encodePayload()
        var parameters = HashMap<String, String>()
        let kvPairs = encodeQuery.split("&", removeEmpty: true)
        for (kv in kvPairs) {
            let splits = kv.split("=", removeEmpty: true)
            let k = splits[0]
            let v = splits[1]
            parameters[k] = v
        }
        let form = buildFrom(this.getApiUrl(), parameters)

        return form.toArray()
    }

    func createClienSdktRequest(bizContent: BizContenter): Array<Byte> {
        var request = Request(this).setBizContent(bizContent).setMethod(bizContent.method())
        let clientSdkRequest = request.encodePayload()
        return clientSdkRequest.toArray()
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.create
     * alipay.trade.create(统一收单交易创建接口)
     */
    public func tradeCreate(biz: TradeCreateBiz): TradeCreateResponse {
        let body = this.doAlipay(biz)
        var jsonV = JsonValue.fromStr(String.fromUtf8(body))
        let dm = DataModel.fromJson(jsonV)
        var res = TradeCreateResponse.deserialize(dm)

        return res
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.pay
     * alipay.trade.pay(统一收单交易支付接口)
     */
    public func tradePay(biz: TradePayBiz): TradePayResponse {
        let body = this.doAlipay(biz)
        var jsonV = JsonValue.fromStr(String.fromUtf8(body))
        let dm = DataModel.fromJson(jsonV)
        var res = TradePayResponse.deserialize(dm)
        return res
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.query
     * alipay.trade.query(统一收单线下交易查询)
     */
    public func tradeQuery(biz: TradeQueryBiz): TradeQueryResponse {
        let body = this.doAlipay(biz)
        var jsonV = JsonValue.fromStr(String.fromUtf8(body))
        let dm = DataModel.fromJson(jsonV)
        var res = TradeQueryResponse.deserialize(dm)
        return res
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.app.pay
     * alipay.trade.app.pay(app支付接口2.0)后端只生成form数据给前端调用
     */
    public func tradeAppPay(biz: TradeAppPayBiz): String {
        let body = this.doAlipay(biz)
        return String.fromUtf8(body)
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.wap.pay
     * alipay.trade.wap.pay(手机网站支付接口2.0)后端只生成form数据给前端调用
     */
    public func tradeWapPay(biz: TradeWapPayBiz): String {
        let body = this.doAlipay(biz)
        return String.fromUtf8(body)
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.page.pay
     * alipay.trade.page.pay(统一收单下单并支付页面接口)后端只生成form数据给前端调用
     */
    public func tradePagePay(biz: TradePagePayBiz): String {
        let body = this.doAlipay(biz)
        return String.fromUtf8(body)
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.cancel
     * alipay.trade.cancel(统一收单交易撤销接口)
     */
    public func tradeCancel(biz: TradeCancelBiz): TradeCancelResponse {
        let body = this.doAlipay(biz)
        var jsonV = JsonValue.fromStr(String.fromUtf8(body))
        let dm = DataModel.fromJson(jsonV)
        var res = TradeCancelResponse.deserialize(dm)
        return res
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.refund
     * alipay.trade.refund(统一收单交易退款接口)
     */
    public func tradeRefund(biz: TradeRefundBiz): TradeRefundResponse {
        let body = this.doAlipay(biz)
        var jsonV = JsonValue.fromStr(String.fromUtf8(body))
        let dm = DataModel.fromJson(jsonV)
        var res = TradeRefundResponse.deserialize(dm)
        return res
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.page.refund
     * alipay.trade.page.refund(统一收单退款页面接口)
     */
    public func tradePageRefund(biz: TradePageRefundBiz): TradePageRefundResponse {
        let body = this.doAlipay(biz)
        var jsonV = JsonValue.fromStr(String.fromUtf8(body))
        let dm = DataModel.fromJson(jsonV)
        var res = TradePageRefundResponse.deserialize(dm)
        return res
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.fastpay.refund.query
     * alipay.trade.fastpay.refund.query(统一收单交易退款查询)
     */
    public func tradeFastpayRefundQuery(biz: TradeFastpayRefundQueryBiz): TradeFastpayRefundQueryResponse {
        let body = this.doAlipay(biz)
        var jsonV = JsonValue.fromStr(String.fromUtf8(body))
        let dm = DataModel.fromJson(jsonV)
        var res = TradeFastpayRefundQueryResponse.deserialize(dm)
        return res
    }
    /**
     * https://opendocs.alipay.com/apis/api_1/alipay.trade.close
     * alipay.trade.close(统一收单交易关闭接口)
     */
    public func tradeClose(biz: TradeCloseBiz): TradeCloseResponse {
        let body = this.doAlipay(biz)
        var jsonV = JsonValue.fromStr(String.fromUtf8(body))
        let dm = DataModel.fromJson(jsonV)
        var res = TradeCloseResponse.deserialize(dm)
        return res
    }
    /**
     * 异步验签
     * 支付宝异步回调信息，用支付宝公钥验证签名，确认消息是支付宝服务器发出的
     * rawbody 是callback 异步通知 body
     */
    public func asyncVerifySign(rawbody: Array<Byte>): Bool {
        let (source, sign, signType) = getAsyncCallBackMsgSource(rawbody)
        var signer = newSigner(signType)
        signer.setPublicKey(this.getAlipayPublicKey())
        return signer.verify(source, sign)
    }
}

public class PayClientBuilder {
    var apiUrl: Option<String> = None // 接口网关地址
    var privateKey: Option<String> = None // rsa私钥单行文本字符串
    var publicKey: Option<String> = None // rsa公钥单行文本字符串
    var alipayPublicKey: Option<String> = None // 证书解析出的支付宝公钥
    var appCertSn: Option<String> = None //`json:"app_cert_sn"`          // 应用公钥证书 SN
    var alipayRootCertSn: Option<String> = None // `json:"alipay_root_cert_sn"`  // 支付宝根证书 SN
    var appID: Option<String> = None // `json:"app_id"`               // 是	32	支付宝分配给开发者的应用ID	2014072300007148
    var format: Option<String> = None // `json:"format,omitempty"`     // 否	40	仅支持JSON	JSON
    var charset: Option<String> = None // `json:"charset"`              // 是	10	请求使用的编码格式，如utf-8,gbk,gb2312等	utf-8
    var signType: Option<String> = None //`json:"sign_type"`            // 是	10	商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2	RSA2
    var version: Option<String> = None // `json:"version"`              // 是	3	调用的接口版本，固定为：1.0	1.0
    var returnUrl: Option<String> = None //`json:"return_url,omitempty"` // 否 前台回跳地址 return_url 自动跳转回商户页面
    var notifyUrl: Option<String> = None //`json:"notify_url,omitempty"` // 支付宝服务器主动通知callback商户服务器里指定的页面http/https路径。

    public func setApiUrl(v: String): This {
        this.apiUrl = Some(v)
        return this
    }

    public func setPrivateKey(v: String): This {
        this.privateKey = Some(v)
        return this
    }
    public func setPublicKey(v: String): This {
        this.publicKey = Some(v)
        return this
    }

    public func setAlipayPublicKey(v: String): This {
        this.alipayPublicKey = Some(v)
        return this
    }

    public func setAppCertSn(v: String): This {
        this.appCertSn = Some(v)
        return this
    }

    public func setAlipayRootCertSn(v: String): This {
        this.alipayRootCertSn = Some(v)
        return this
    }

    public func setAppID(v: String): This {
        this.appID = Some(v)
        return this
    }

    public func setFormat(v: String): This {
        this.format = Some(v)
        return this
    }

    public func setCharset(v: String): This {
        this.charset = Some(v)
        return this
    }

    public func setSignType(v: String): This {
        this.signType = Some(v)
        return this
    }

    public func setVersion(v: String): This {
        this.version = Some(v)
        return this
    }

    public func setReturnUrl(v: String): This {
        this.returnUrl = Some(v)
        return this
    }

    public func setNotifyUrl(v: String): This {
        this.notifyUrl = Some(v)
        return this
    }

    public func build(): Payer {
        var p = PayClient()

        if (let Some(v) <- this.apiUrl) {
            p.ApiUrl = v
        } else {
            throw Exception("api_url is required")
        }
        if (let Some(v) <- this.privateKey) {
            p.PrivateKey = v
        } else {
            throw Exception("private_key is required")
        }
        if (let Some(v) <- this.publicKey) {
            p.PublicKey = v
        } else {
            throw Exception("public_key is required")
        }
        if (let Some(v) <- this.alipayPublicKey) {
            p.AlipayPublicKey = v
        } else {
            throw Exception("alipay_public_key is required")
        }
        if (let Some(v) <- this.appCertSn) {
            p.AppCertSn = v
        } else {
            throw Exception("app_cert_sn is required")
        }
        if (let Some(v) <- this.alipayRootCertSn) {
            p.AlipayRootCertSn = v
        } else {
            throw Exception("alipay_root_cert_sn is required")
        }
        if (let Some(v) <- this.appID) {
            p.AppID = v
        } else {
            throw Exception("app_id is required")
        }
        if (let Some(v) <- this.format) {
            p.Format = v
        } else {
            p.Format = "JSON"
        }
        if (let Some(v) <- this.charset) {
            p.Charset = v
        } else {
            p.Charset = "utf-8"
        }
        if (let Some(v) <- this.signType) {
            p.SignType = v
        } else {
            p.SignType = "RSA2"
        }
        if (let Some(v) <- this.version) {
            p.Version = v
        } else {
            p.Version = "1.0"
        }
        if (let Some(v) <- this.returnUrl) {
            p.ReturnUrl = v
        }
        if (let Some(v) <- this.notifyUrl) {
            p.NotifyUrl = v
        }
        return p
    }
}
