package alipay_sdk

import alipay_sdk.biz
import alipay_sdk.jsonhelper.JsonHelper
import serialization.serialization.{Serializable, DataModelStruct, DataModel, field, Field}
import std.collection.{ArrayList, HashMap}
import std.sort.stableSort

public interface Requester {
    func setMethod(s: String): Requester
    func getMethod(): String
    func setBizContent(b: biz.BizContenter): Requester
    func encodePayload(): String
}

public class Request <: Serializable<Request> & Requester & JsonHelper {
    var privateKey: String = "" // rsa私钥单行文本字符串 
    var publicKey: String = "" // rsa公钥单行文本字符串
    var appCertSn: String = "" // 应用公钥证书 SN
    var alipayRootCertSn: String = "" //alipay_root_cert_sn,支付宝根证书 SN
    var appID: String = "" // app_id,支付宝分配给开发者的应用ID	2014072300007148
    var appAuthToken: Option<String> = None // app_auth_token,详见应用授权概述
    var method: String = "" // method,接口名称	alipay.trade.create
    var format: String = "" // format,仅支持JSON	JSON
    var charset: String = "" // charset,请求使用的编码格式，如utf-8,gbk,gb2312等	utf-8
    var signType: String = "" // sign_type,商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2	RSA2
    var sign: String = "" // sign,商户请求参数的签名串，详见签名	详见示例
    var timestamp: String = "" // timestamp,发送请求的时间，格式"yyyy-MM-dd HH:mm:ss"	2014-07-24 03:07:50
    var version: String = "" //version,调用的接口版本，固定为：1.0	1.0
    var notifyUrl: Option<String> = None //notify_url,支付宝服务器主动通知商户服务器里指定的页面http/https路径
    var returnUrl: Option<String> = None //return_url,前台回跳地址 return_url 自动跳转回商户页面
    var bizContent: String = "" //biz_content , 请求参数的集合，最大长度不限，除公共参数外所有请求参数都必须放在这个参数中传递，具体参照各产品快速接入文档

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
        return DataModelStruct()
            .add(bindString("app_cert_sn", appCertSn))
            .add(bindString("alipay_root_cert_sn", alipayRootCertSn))
            .add(bindString("app_id", appID))
            .add(bindOptionString("app_auth_token", appAuthToken))
            .add(bindString("method", method))
            .add(bindString("format", format))
            .add(bindString("charset", charset))
            .add(bindString("sign_type", signType))
            .add(bindString("sign", sign))
            .add(bindString("timestamp", timestamp))
            .add(bindString("version", version))
            .add(bindOptionString("notify_url", notifyUrl))
            .add(bindOptionString("return_url", returnUrl))
            .add(bindString("biz_content", bizContent))
    }
    public static func deserialize(dm: DataModel): Request {
        var res = Request()
        res.appCertSn = stringGet("app_cert_sn", dm)
        res.alipayRootCertSn = stringGet("alipay_root_cert_sn", dm)
        res.appID = stringGet("app_id", dm)
        res.appAuthToken = stringGet("app_auth_token", dm)
        res.method = stringGet("method", dm)
        res.format = stringGet("format", dm)
        res.charset = stringGet("charset", dm)
        res.signType = stringGet("sign_type", dm)
        res.sign = stringGet("sign", dm)
        res.timestamp = stringGet("timestamp", dm)
        res.version = stringGet("version", dm)
        res.notifyUrl = optionStringGet("notify_url", dm)
        res.returnUrl = optionStringGet("return_url", dm)
        res.bizContent = stringGet("biz_content", dm)
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
        this.bizContent = b.getMap().toString()
        return this
    }

    public func setTimestamp() {
        this.timestamp = getNowBeijingTimeStr()
    }

    public func encodePayload(): String {
        var signer = newSigner(this.signType)
        signer.setPrivateKey(this.privateKey)
        var sortStrSource = this.getSortedSignSource()
        // println("带签名字符串: ${sortStrSource}")
        let signture = signer.sign(sortStrSource)
        // println("签名：${signture}")

        var encodeList = ArrayList<String>()
        for (one in sortStrSource.split("&")) {
            var splites = one.split("=")
            splites[1] = queryEscape(splites[1])
            encodeList.append(String.join(splites, delimiter: "="))
        }

        var encodeQuery = String.join(encodeList.toArray(), delimiter: "&") + "&sign=" + queryEscape(signture)
        // println("编码数据：${encodeQuery}")
        return encodeQuery
    }
    public func getSortedSignSource(): String {
        var jsonObj = this.serialize()
        let m = HashMap<String, Option<String>>.deserialize(jsonObj)
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
