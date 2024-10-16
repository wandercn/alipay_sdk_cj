package alipay_sdk.biz

import std.collection.HashMap

public interface BizContenter {
    func method(): String
    func set(k: String, v: String): Unit
}

type BizObject = HashMap<String, String>

public func getResponseKey<T>(biz: T): String where T <: BizContenter {
    var method = biz.method()
    method += ".response"
    return method.replace(".", "_")
}
