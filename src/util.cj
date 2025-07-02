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
package alipay_sdk

import std.time.{TimeZone, DateTime,DateTimeFormat}
import std.collection.{HashMap, ArrayList}
import stdx.encoding.url.{Form, URL}
import std.sort.sort
import std.collection.*

public func getNowBeijingTimeStr(): String {
    let timeFormat = "yyyy-MM-dd HH:mm:ss"
    let loc = TimeZone("CST", Duration.hour * 8)
    let nowTime = DateTime.now().inTimeZone(loc)
    return nowTime.format(timeFormat)
}

func buildFrom(baseUrl: String, parameters: HashMap<String, String>): String {
    var sb = StringBuilder()
    sb.append("<form name=\"alipaysubmit\" method=\"post\" action=\"")
    sb.append(baseUrl)
    sb.append("?charset=utf-8")
    sb.append("\">\n")
    sb.append(buildHiddenFields(parameters))
    sb.append("<input type=\"submit\" value=\"立即支付\" style=\"display:none\" >\n")
    sb.append("</form>\n")
    sb.append("<script>document.forms['alipaysubmit'].submit();</script>")
    let form = sb.toString()
    return form
}

func buildHiddenFields(parameters: HashMap<String, String>): String {
    if (parameters.isEmpty()) {
        return ""
    }
    var sb = StringBuilder()
    for ((key, value) in parameters) {
        if (value.isEmpty()) {
            continue
        }
        sb.append(buildHiddenField(key, value))
    }
    return ""
}

func buildHiddenField(key: String, value: String): String {
    var sb = StringBuilder()
    sb.append("<input type=\"hidden\" name=\"")
    sb.append(key)
    sb.append("\" value=\"")
    // 转义双引号
    let newValue = value.replace("\"", "&quot;")
    sb.append(newValue)
    sb.append("\">\n")
    return sb.toString()
}
// 使用 replace 实现简单的 URL 编码
func queryEscape(input: String) {
    var encoded = input
    encoded = encoded.replace('$', '%24')
    encoded = encoded.replace('&', '%26')
    encoded = encoded.replace(' ', '%20')
    encoded = encoded.replace(',', '%2C')
    encoded = encoded.replace('/', '%2F')
    encoded = encoded.replace(':', '%3A')
    encoded = encoded.replace(';', '%3B')
    encoded = encoded.replace('=', '%3D')
    encoded = encoded.replace('?', '%3F')
    encoded = encoded.replace('@', '%40')
    encoded = encoded.replace('+', '%2B')
    return encoded
}

/**
 * 获取支付宝CallBack异步消息的待签名字符串和签名
 * 自行实现签名文档 https://opendocs.alipay.com/common/02mse7?pathHash=096e611e
 * 返回值 source - 签名字符串 , sign - 签名 , signType - 签名类型
 */
func getAsyncCallBackMsgSource(rawbody: Array<Byte>): (source: String, sign: String, signType: String) {
    var keys = ArrayList<String>()
    var values = HashMap<String, String>()
    // 根据URL Query的编码规则，空格表示+号，需要还原+号为空格
    let queryStr = String.fromUtf8(rawbody).replace("+"," ")
    parseQuery(values, queryStr)

    for ((k, _) in values) {
        keys.add(k)
    }

    // 按字典排序
    sort(keys,stable: true)

    let signType = match (values.get("sign_type")) {
        case Some(v) => v
        case None => throw Exception("callback msg 's sign_type is None ")
    }
    let sign = match (values.get("sign")) {
        //签名是base64有可能包含+但是不可能有空格，所以把空格还原回 +
        case Some(v) => v.replace(" ", "+")
        case None => throw Exception("callback msg 's sign is None ")
    }
    // 待签名字符串不包括sign和sign_type,需要删除
    values.remove("sign")
    values.remove("sign_type")

    let oldMap = values.clone()
    // 拼接成待签名字符串
    func getValue(key: String): String {
        if (let Some(value) <- oldMap.get(key)) {
            return "${key}=${value}"
        }
        return ""
    }
    var source: String = keys |> map(getValue) |> filter {x => x != ""} |> collectString<String>(delimiter: "&")

    return (source.trimEnd("&"), sign, signType)
}

public func parseQuery(values: HashMap<String, String>, query: String) {
    var str = query
    println("query: ${str}")
    while (!str.isEmpty()) {
        var key: String
        (key, str, _) = String.cut(str, "&")
        if (key.isEmpty()) {
            continue
        }
        var value: String
        (key, value, _) = String.cut(key, "=")
        if (value.isEmpty()) {
            continue
        }
        values.add(key, value)
        println("key: ${key} value: ${value}")
    }
    return
}

extend String {
    public static func cut(s: String, sep: String): (before: String, after: String, found: Bool) {
        if (let Some(i) <- s.indexOf(sep)) {
            return (s[..i], s[(i + sep.size)..], true)
        }
        (s, "", false)
    }
}
