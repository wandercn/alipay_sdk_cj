package alipay_sdk.biz

import std.collection.HashMap
import encoding.json.{JsonValue, JsonKind}

public type V = String 

public interface BizContenter {
    func method(): String
    // 设置可选字段方法
    func set(k: String, v: V): Unit
    func getMap(): HashMap<String, V>
}

public open class BizObject {
    private var inner: HashMap<String, V>

    init() {
        this.inner = HashMap<String, V>()
    }

    public func getMap(): HashMap<String, V> {
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
