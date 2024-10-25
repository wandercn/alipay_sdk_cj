package alipay_sdk

import alipay_sdk.biz.*
import net.http.*
import net.tls.*
import encoding.json.*
import encoding.url.*
import std.collection.*
import serialization.serialization.*
import std.io.*

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

    // func execute(Requester) (*[]byte, error)
    func execute(req: Requester): Array<Byte>
    // DoAlipay(biz.BizContenter) (*[]byte, error)
    func doAlipay(bizContent: BizContenter): Array<Byte>

    // TradeCreate(*biz.TradeCreateBiz) (*TradeCreateResponse, error)
    func tradeCreate(biz: TradeCreateBiz): TradeCreateResponse
    // TradePay(*biz.TradePayBiz) (*TradePayResponse, error)
    // TradePrecreate(*biz.TradePrecreateBiz) (*TradePrecreateResponse, error)
    // TradeAppPay(*biz.TradeAppPayBiz) (string, error)
    // TradeWapPay(*biz.TradeWapPayBiz) (string, error)
    // TradePagePay(*biz.TradePagePayBiz) (string, error)
    // TradeQuery(*biz.TradeQueryBiz) (*TradeQueryResponse, error)
    // TradeCancel(*biz.TradeCancelBiz) (*TradeCancelResponse, error)
    // TradeRefund(*biz.TradeRefundBiz) (*TradeRefundResponse, error)
    // TradePageRefund(*biz.TradePageRefundBiz) (*TradePageRefundResponse, error)
    // TradeFastpayRefundQuery(*biz.TradeFastpayRefundQueryBiz) (*TradeFastpayRefundQueryResponse, error)
    // TradeClose(*biz.TradeCloseBiz) (*TradeCloseResponse, error)
    // AsyncVerifySign(rawbody []byte) (bool, error)
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

    // var IsProd: Bool //`json:"-"`                    // 是否生产环境
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
        print("payload: ${payload}")
        var tlsConfig = TlsClientConfig()
        tlsConfig.verifyMode = TrustAll

        var httpclient = ClientBuilder().tlsConfig(tlsConfig).build()
        var requestBuild = HttpRequestBuilder()
        if (method == "alipay.trade.precreate") {
            requestBuild.url(this.ApiUrl + "?" + payload).get()
        } else {
            requestBuild.url(this.ApiUrl).body(payload).post()
        }
        var request = requestBuild.header("Content-Type", "application/x-www-form-urlencoded").build()
        var res = httpclient.send(request)
        println(res)
        let length = match (res.bodySize) {
            case Some(data) => data
            case _ => 0
        }
        let buffer= ByteBuffer()
        var buf = Array<Byte>(16, repeat: 0)
        while (res.body.read(buf) > 0) {
            println("read =======================1")
            buffer.write(buf)
            buf.fill(0)
            // println(buffer.bytes())
        }
        httpclient.close()
        return String.fromUtf8(readToEnd(buffer)).toArray()
    }

    public func doAlipay(bizContent: BizContenter): Array<Byte> {
        match (bizContent.method()) {
            case "alipay.trade.wap.pay" | "alipay.trade.page.pay" => return [1, 0]
            case "alipay.trade.app.pay" => return [2, 0]
            case _ =>
                var request = Request(this).setBizContent(bizContent).setMethod(bizContent.method())
                let res = this.execute(request)
                // 同步验签
                func syncVerifySign(response: Array<Byte>): Bool {
                    println("测试")

                    var result = response.serialize().toJson()
                    println("result:${result}")
                    // 闭包，获取response
                    func getRawSource(): String {
                        let responseKey = getResponseKey(bizContent)

                        if (let Some(raw) <- result.asObject().get(responseKey)) {
                             println("raw:${raw}")
                            return raw.toString()
                        } else {
                            return ""
                        }
                    }
                    // 闭包，获取签名
                    func getSignture(): String {
                        if (let Some(sign) <- result.asObject().get("sign")) {
                                println("sign:${sign}")
                            return sign.toString()
                        } else {
                            return ""
                        }
                    }
                    var singer = newSigner(this.getSignType())
                    singer.setPublicKey(this.getAlipayPublicKey())

                    let passd = singer.verify(getRawSource(), getSignture())
                    return false
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
        let kvPairs = encodeQuery.split("&")
        for (kv in kvPairs) {
            let splits = kv.split("=")
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

    // https://opendocs.alipay.com/apis/api_1/alipay.trade.create
    // alipay.trade.create(统一收单交易创建接口)
    public func tradeCreate(biz: TradeCreateBiz): TradeCreateResponse {
        let body = this.doAlipay(biz)
        var jsonV = JsonValue.fromStr(String.fromUtf8(body))
        let dm = DataModel.fromJson(jsonV)
        var res = TradeCreateResponse.deserialize(dm)

        return res
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
