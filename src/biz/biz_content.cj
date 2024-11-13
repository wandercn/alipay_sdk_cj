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
package alipay_sdk.biz

import std.collection.HashMap
import encoding.json.{JsonObject, JsonValue}
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
