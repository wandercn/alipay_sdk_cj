package alipay_sdk

import std.time.*

public func getNowBeijingTimeStr(): String {
    let timeFormat = "yyyy/MM/dd HH:mm:ss"
    let loc = TimeZone.load("Asia/Shanghai")
    let nowTime = DateTime.now().inTimeZone(loc)
    return nowTime.toString(timeFormat)
}