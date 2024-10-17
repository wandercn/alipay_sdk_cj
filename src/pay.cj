package alipay_sdk

import alipay_sdk.biz.*

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
    // static func execute<T>(req: T): Array<Byte> where T <: Requester
    // DoAlipay(biz.BizContenter) (*[]byte, error)
    // static func doAlipay<B>(biz: B): Array<Byte> where B <: BizContenter

    // TradeCreate(*biz.TradeCreateBiz) (*TradeCreateResponse, error)
    // func tradeCreate(biz: TradeCreateBiz): TradeCreateResponse
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
    // public static func execute<T>(req: T): Array<Byte> where T <: Requester {
    // return
    // }
    // DoAlipay(biz.BizContenter) (*[]byte, error)
    // public static func doAlipay<B>(biz: B): Array<Byte> where B <: BizContenter {}
    // public func tradeCreate(biz: TradeCreateBiz): TradeCreateResponse {}
}

public class PayClientBuilder {
    var ApiUrl: Option<String> = None // 接口网关地址
    var PrivateKey: Option<String> = None // rsa私钥单行文本字符串
    var PublicKey: Option<String> = None // rsa公钥单行文本字符串
    var AlipayPublicKey: Option<String> = None // 证书解析出的支付宝公钥
    var AppCertSn: Option<String> = None //`json:"app_cert_sn"`          // 应用公钥证书 SN
    var AlipayRootCertSn: Option<String> = None // `json:"alipay_root_cert_sn"`  // 支付宝根证书 SN
    var AppID: Option<String> = None // `json:"app_id"`               // 是	32	支付宝分配给开发者的应用ID	2014072300007148
    var Format: Option<String> = None // `json:"format,omitempty"`     // 否	40	仅支持JSON	JSON
    var Charset: Option<String> = None // `json:"charset"`              // 是	10	请求使用的编码格式，如utf-8,gbk,gb2312等	utf-8
    var SignType: Option<String> = None //`json:"sign_type"`            // 是	10	商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2	RSA2
    var Version: Option<String> = None // `json:"version"`              // 是	3	调用的接口版本，固定为：1.0	1.0
    var ReturnUrl: Option<String> = None //`json:"return_url,omitempty"` // 否 前台回跳地址 return_url 自动跳转回商户页面
    var NotifyUrl: Option<String> = None //`json:"notify_url,omitempty"` // 支付宝服务器主动通知callback商户服务器里指定的页面http/https路径。

    public func apiUrl(v: String): This {
        this.ApiUrl = Some(v)
        return this
    }

    public func privateKey(v: String): This {
        this.PrivateKey = Some(v)
        return this
    }
    public func publicKey(v: String): This {
        this.PublicKey = Some(v)
        return this
    }

    public func alipayPublicKey(v: String): This {
        this.AlipayPublicKey = Some(v)
        return this
    }

    public func appCertSn(v: String): This {
        this.AppCertSn = Some(v)
        return this
    }

    public func alipayRootCertSn(v: String): This {
        this.AlipayRootCertSn = Some(v)
        return this
    }

    public func appID(v: String): This {
        this.AppID = Some(v)
        return this
    }

    public func format(v: String): This {
        this.Format = Some(v)
        return this
    }

    public func charset(v: String): This {
        this.Charset = Some(v)
        return this
    }

    public func signType(v: String): This {
        this.SignType = Some(v)
        return this
    }

    public func version(v: String): This {
        this.Version = Some(v)
        return this
    }

    public func returnUrl(v: String): This {
        this.ReturnUrl = Some(v)
        return this
    }

    public func notifyUrl(v: String): This {
        this.NotifyUrl = Some(v)
        return this
    }

    public func build(): PayClient {
        var p = PayClient()

        if (let Some(v) <- this.ApiUrl) {
            this.ApiUrl = v
        } else {
            throw Exception("api_url is required")
        }

        if (let Some(v) <- this.PrivateKey) {
            this.PrivateKey = v
        } else {
            throw Exception("private_key is required")
        }
        if (let Some(v) <- this.PublicKey) {
            p.PublicKey = v
        } else {
            throw Exception("public_key is required")
        }

        if (let Some(v) <- this.AlipayPublicKey) {
            p.AlipayPublicKey = v
        } else {
            throw Exception("alipay_public_key is required")
        }

        if (let Some(v) <- this.AppCertSn) {
            p.AppCertSn = v
        } else {
            throw Exception("app_cert_sn is required")
        }

        if (let Some(v) <- this.AlipayRootCertSn) {
            p.AlipayRootCertSn = v
        } else {
            throw Exception("alipay_root_cert_sn is required")
        }

        if (let Some(v) <- this.AppID) {
            p.AppID = v
        } else {
            throw Exception("app_id is required")
        }

        if (let Some(v) <- this.Format) {
            p.Format = v
        } else {
            p.Format = "JSON"
        }

        if (let Some(v) <- this.Charset) {
            p.Charset = v
        } else {
            p.Charset = "utf-8"
        }

        if (let Some(v) <- this.SignType) {
            p.SignType = v
        } else {
            p.SignType = "RSA2"
        }

        if (let Some(v) <- this.Version) {
            p.Version = v
        } else {
            p.Version = "1.0"
        }

        if (let Some(v) <- this.ReturnUrl) {
            p.ReturnUrl = v
        }

        if (let Some(v) <- this.NotifyUrl) {
            p.NotifyUrl = v
        } else {
            throw Exception("notify_url is required")
        }

        return p
    }
}
