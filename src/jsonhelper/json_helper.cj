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
    static func stringGet(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return String.deserialize(dms.get(key))
    }
    static func optionStringGet(key: String, dm: DataModel) {
        let dms = getDms(dm)
        return Option<String>.deserialize(dms.get(key))
    }
}

public interface SerializeBinder {
    static func bindOptionString(key: String, value: ?String) {
        return field<Option<String>>(key, value)
    }
    static func bindString(key: String, value: ?String) {
        return field<Option<String>>(key, value)
    }
}

public interface JsonHelper <: SerializeBinder & DeserializeGet {}
