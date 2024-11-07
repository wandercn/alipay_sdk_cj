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
package alipay_sdk.jsonhelper

import serialization.serialization.{Serializable, DataModel, DataModelStruct, field}

public interface GetDms {
    static func getDms(dm: DataModel) {
        let dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        return dms
    }
}

public interface DeserializeGet <: GetDms {
    static func deGetBool(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return Bool.deserialize(dms.get(key))
    }

    static func deGetOptionBool(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return Option<Bool>.deserialize(dms.get(key))
    }

    static func deGetInt(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return Int.deserialize(dms.get(key))
    }

    static func deGetOptionInt(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return Option<Int>.deserialize(dms.get(key))
    }

    static func deGetFloat64(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return Float64.deserialize(dms.get(key))
    }

    static func deGetOptionFloat64(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return Option<Float64>.deserialize(dms.get(key))
    }

    static func deGetString(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return String.deserialize(dms.get(key))
    }

    static func deGetOptionString(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return Option<String>.deserialize(dms.get(key))
    }
}

public interface SerializeBinder {
    static func serSetBool(key: String, value: Bool) {
        return field<Bool>(key, value)
    }

    static func serSetOptionBool(key: String, value: ?Bool) {
        return field<Option<Bool>>(key, value)
    }

    static func serSetInt(key: String, value: Int) {
        return field<Int>(key, value)
    }

    static func serSetOptionInt(key: String, value: ?Int) {
        return field<Option<Int>>(key, value)
    }

        static func serSetFloat64(key: String, value: Float64) {
        return field<Float64>(key, value)
    }

    static func serSetOptionFloat64(key: String, value: ?Float64) {
        return field<Option<Float64>>(key, value)
    }

    static func serSetString(key: String, value: String) {
        return field<String>(key, value)
    }

    static func serSetOptionString(key: String, value: ?String) {
        return field<Option<String>>(key, value)
    }
}

public interface JsonHelper <: SerializeBinder & DeserializeGet {}
