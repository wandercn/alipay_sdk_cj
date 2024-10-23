package alipay_sdk

import alipay_sdk.biz
import serialization.serialization.*
import encoding.json.*
import std.collection.*
import std.sort.*
import std.net.*
import encoding.url.*

public interface Requester {
    func setMethod(s: String): Requester
    func getMethod(): String
    func setBizContent(b: biz.BizContenter): Requester
    func encodePayload(): String
}

public class Request <: Serializable<Request> & Requester { // 是否必填	最大长度	描述	示例值
    var privateKey: String = "" //     string `json:"-"`                        // rsa私钥单行文本字符串
    var publicKey: String = "" //       string `json:"-"`                        // rsa公钥单行文本字符串
    var appCertSn: String = "" //    string `json:"app_cert_sn"`              // 应用公钥证书 SN
    var alipayRootCertSn: String = "" // string `json:"alipay_root_cert_sn"`      // 支付宝根证书 SN
    var appID: String = "" // string `json:"app_id"`                   // 是	32	支付宝分配给开发者的应用ID	2014072300007148
    var appAuthToken: Option<String> = None // string `json:"app_auth_token,omitempty"` // 否	40	详见应用授权概述
    var method: String = "" //string `json:"method"`                   // 是	128	接口名称	alipay.trade.create
    var format: String = "" //string `json:"format,omitempty"`         // 否	40	仅支持JSON	JSON
    var charset: String = "" //string `json:"charset"`                  // 是	10	请求使用的编码格式，如utf-8,gbk,gb2312等	utf-8
    var signType: String = "" //string `json:"sign_type"`                // 是	10	商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2	RSA2
    var sign: String = "" // string `json:"sign"`                     // 是	344	商户请求参数的签名串，详见签名	详见示例
    var timestamp: String = "" //string `json:"timestamp"`                // 是	19	发送请求的时间，格式"yyyy-MM-dd HH:mm:ss"	2014-07-24 03:07:50
    var version: String = "" //string `json:"version"`                  // 是	3	调用的接口版本，固定为：1.0	1.0
    var notifyUrl: Option<String> = None //string `json:"notify_url,omitempty"`     // 否	256	支付宝服务器主动通知商户服务器里指定的页面http/https路径。	https://dev-api.quantibio.com/subs_order/aliplay/callback
    var returnUrl: Option<String> = None //string `json:"return_url,omitempty"`     // 否 前台回跳地址 return_url 自动跳转回商户页面
    var bizContent: String = "" //string `json:"biz_content"`              //是		请求参数的集合，最大长度不限，除公共参数外所有请求参数都必须放在这个参数中传递，具体参照各产品快速接入文档

    init() {}
    init(p: Payer) {
        this.privateKey = p.getPrivateKey()
        this.publicKey = p.getPublicKey()
        this.appCertSn = p.getAppCertSn()
        this.alipayRootCertSn = p.getAlipayRootCertSn()
        this.appID = p.getAppID()
        this.charset = p.getCharset()
        this.signType = p.getSignType()
        if (p.getReturnUrl().isEmpty()) {
            this.returnUrl = None
        } else {
            this.returnUrl = Some(p.getReturnUrl())
        }

        if (p.getNotifyUrl().isEmpty()) {
            this.notifyUrl = None
        } else {
            this.notifyUrl = Some(p.getNotifyUrl())
        }
        this.notifyUrl = p.getNotifyUrl()
        this.method = ""
        this.format = "JSON"
        this.version = "1.0"
        this.appAuthToken = None
        this.bizContent = ""
        this.sign = ""
        this.timestamp = getNowBeijingTimeStr()
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<String>("app_cert_sn", appCertSn)).add(
            field<String>("alipay_root_cert_sn", alipayRootCertSn)).add(field<String>("app_id", appID)).add(
            field<Option<String>>("app_auth_token", appAuthToken)).add(field<String>("method", method)).add(
            field<String>("format", format)).add(field<String>("charset", charset)).add(
            field<String>("sign_type", signType)).add(field<String>("sign", sign)).add(
            field<String>("timestamp", timestamp)).add(field<String>("version", version)).add(
            field<Option<String>>("notify_url", notifyUrl)).add(field<Option<String>>("return_url", returnUrl)).add(
            field<String>("biz_content", bizContent))
    }
    public static func deserialize(dm: DataModel): Request {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }

        var res = Request()
        // 闭包
        func stringGet(key: String) {
            return String.deserialize(dms.get(key))
        }
        func optionStringGet(key: String) {
            return Option<String>.deserialize(dms.get(key))
        }
        res.appCertSn = stringGet("app_cert_sn")
        res.alipayRootCertSn = stringGet("alipay_root_cert_sn")
        res.appID = stringGet("app_id")
        res.appAuthToken = stringGet("app_auth_token")
        res.method = stringGet("method")
        res.format = stringGet("format")
        res.charset = stringGet("charset")
        res.signType = stringGet("sign_type")
        res.sign = stringGet("sign")
        res.timestamp = stringGet("timestamp")
        res.version = stringGet("version")
        res.notifyUrl = optionStringGet("notify_url")
        res.returnUrl = optionStringGet("notify_url")
        res.bizContent = stringGet("biz_content")
        return res
    }
    public func getMethod(): String {
        this.method
    }

    public func setMethod(s: String): Requester {
        this.method = s
        return this
    }

    public func setBizContent(b: biz.BizContenter): Requester {
        this.bizContent = b.getMap().serialize().toJson().toJsonString()
        return this
    }

    public func setTimestamp() {
        this.timestamp = getNowBeijingTimeStr()
    }

    public func encodePayload(): String {
        var signer = newSigner(this.signType)
        signer.setPrivateKey(this.privateKey)
        var signSource = this.getSignSource()
        var signSourceSplits = signSource.split("=")
        signSourceSplits.sort(stable: true)
        var sortStr = String.join(signSourceSplits, delimiter: "&")
        let signture = signer.sign(sortStr)
        let encodeQuery = URL.parse(sortStr + "&sign=" + signture).queryForm.toEncodeString()

        return encodeQuery
    }
    public func getSignSource(): String {
        var jsonObj = this.serialize()
        let m = HashMap<String,Option<String>>.deserialize(jsonObj)
        var queryList = ArrayList<String>()
        for ((k, v) in m) {
            if (let Some(v2) <- v) {
            if (!v2.isEmpty() && k != "sign") {
                let query = k + "=" + v2.trimStart(" ").trimEnd(" ")
                queryList.append(query)
            }
            }
        }
        var arr = queryList.toArray()
        stableSort(arr)

        return String.join(arr, delimiter: "&")
    }
}
