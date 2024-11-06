package alipay_sdk

import std.time.{TimeZone, DateTime}
import std.collection.HashMap

public func getNowBeijingTimeStr(): String {
    let timeFormat = "yyyy-MM-dd HH:mm:ss"
    let loc = TimeZone("CST", 8 * Duration.hour)
    let nowTime = DateTime.now().inTimeZone(loc)
    return nowTime.toString(timeFormat)
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