package alipay_sdk.biz

import std.collection.HashMap
import encoding.json.{JsonObject,JsonValue}
import serialization.serialization.DataModel

public type V = JsonValue

public interface BizContenter {
    func method(): String
    // 设置可选字段方法
    func set(k: String, v: V): Unit
    func getMap(): JsonObject
}

public open class BizObject {
    private var inner: JsonObject

    init() {
        this.inner = JsonObject()
    }

    public func getMap(): JsonObject {
        this.inner
    }

    public func set(k: String, v: V): Unit {
        this.inner.put(k, v)
    }
}

public func getResponseKey<T>(biz: T): String where T <: BizContenter {
    var method = biz.method()
    method += ".response"
    return method.replace(".", "_")
}
