package alipay_sdk.test

import std.unittest.*
import std.unittest.testmacro.*
import alipay_sdk.{Payer,PayClientBuilder,biz}
import std.time.DateTime
import stdx.encoding.json.{JsonString, JsonInt, ToJson}

const PUB_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuYr//cNhdjma7rhDg+dWpSi2H7TvZFZA6PrY9IkTHkJUFU4GXEYeek3AfVPdTJU3/RnJQ4OgnD2mCqFGSgUogePNSBnpmqO8qrSNf0b0LCmt9OT+uuURbuxZjK4XmlEsSqfcDz0ZudApc93PdODpBr5Fw1QFQVz4GPlWieTlVf97GLJBHjTa5i41GYGKe9Wk9AsFOAetTaKdKc5Kq/UVlvOZ7Izl+AzjmmDuVqqn2mUhJPj0Upv9Uw/h9DwLB/I7ebaBl5t+ePnvkaezGr/GqRCMyPmBrRWCW7ztZy9xQi19a8aPbuRjwnUgwfHcxQSczYdSmRvU3L5pSvoMJXBf5QIDAQAB"
const API_URL = "https://openapi-sandbox.dl.alipaydev.com/gateway.do"
const APP_CERTSN = "2ae63de7d1a864071bd72875b6aea838"
const PRIVATE_KEY = "MIIEowIBAAKCAQEAuYr//cNhdjma7rhDg+dWpSi2H7TvZFZA6PrY9IkTHkJUFU4GXEYeek3AfVPdTJU3/RnJQ4OgnD2mCqFGSgUogePNSBnpmqO8qrSNf0b0LCmt9OT+uuURbuxZjK4XmlEsSqfcDz0ZudApc93PdODpBr5Fw1QFQVz4GPlWieTlVf97GLJBHjTa5i41GYGKe9Wk9AsFOAetTaKdKc5Kq/UVlvOZ7Izl+AzjmmDuVqqn2mUhJPj0Upv9Uw/h9DwLB/I7ebaBl5t+ePnvkaezGr/GqRCMyPmBrRWCW7ztZy9xQi19a8aPbuRjwnUgwfHcxQSczYdSmRvU3L5pSvoMJXBf5QIDAQABAoIBAE9IWgKxTiAalV2UVyUx4RBJySjbQ7/4K1xic/pp6EVxykQgRw9+1t8kAjCLeXCUAoygTCQRRrv8i8rXBxXyBlEaakl46R0vAhtfc2cDhqqoVLDkeQSbhUuEqu82JNfH/8kW2S2Zyjhf/paIHXGv+WLsQxsn9+bqNwlU4emiaWzJNeo8VDWH/7muOOZDEkj/1z/BPzf74RrgkNQFJM6n3EqOjQNdV2ogmGiArBGfGCBfdX0m7X1m7m0RdUHd0PhohUMAp7N6MCtyioFT6vPjrNZHTFCULAI6AqtToJ2zyrBOsyr2kLy3EQXPDMd3Zk+p0NEjmOLQKzD0rGkOjrpzc7ECgYEA/pEdQrS8HvNKQoUK22CEw633GY8Ef7iLio7aSY87FEVSYITpJsZsPQ8Bm3pLGuj3LiF4usmzEeB7ZheJATIVivW2W5AHTFPaHrRz6pQRTVKQ+asczGVrpGYF1XZwtcvWeuSmwOLHTA5cTlasV5e4lP0Ee/A0JwzoqYZPVFd5Gr8CgYEAupZoSZyW2m39tAK/X2RIW5dlglaZtg8PSWmk1LkBItP2WrL7Jre3Oa1CZQNlpCGEkRVzeb32q5EBEG/QTVD3g4smaJ2OYpSNpJVmkjof2/BnfYswzhYiaukK1KV88jNylek3LOULYPAHPxt7gyNG1W+R/rbdF86Xyx/fVrZJolsCgYA7srpC73GCbJmImfyez7ay0PQ2uTRb42JN/wwv3fgD2/Hikqi+oB+3/fHpjTdZuzJkThMq8qwc0CEAIxrM/frRWKgINvGPM8beFoFsjIa2NFutQTSCtnIU3pwVoC30ZDYLId39M/F6449AC9FkxT7TKbbIfd8tHTjesJGf/Nd4rwKBgQCz0fB/wOHBcO9oZJ16mXMCkk3J5xwMUUcyQRYRzJpDrnNlxcg18Cgs9cVfBH8YRxUznbDES0dG4WBdLuVZHgbsR1aky/NFHlXDoBhSJKI/nNigLVzDwKE6140QksxvvxVXVINQSQ1GRw00zI+kOoMxf2z8Rc+d+gRgRj8/mj4ssQKBgBgSkawYSapzlqtRn397p3QiOMPA0OKaoL5ovVxLKKsr/L8b1SrPntk0CUHYVFjE6P5l4RuFURoGnny5ThXWvYQ0A1xkKGMmVTbQJld+K2rqNyghtAX5CtA0laTngJHK4CFoHNNwQwExbQrWzaCBDEjVZOjTrD2/fgoN1wlOtJL7"
const ALIPAY_ROOT_CERTSN = "687b59193f3f462dd5336e5abf83c5d8_02941eef3187dddf3d3b83462e1dfcf6"
const APPID = "9021000138690920"
const ALIPAY_PUB_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjRE7n0tuGp4e/3RwUnExLxU0JUDsbOOpFgGO/UJT2jidePGRN/GJlqMREfkyYh+JwAhs2ehEUG1j5wnKBIeqCHN8SixwQamyqkMypSJhCUIxfPGOkdD2Vj7n+/iVCFJvmUWBUN5OqD57x410mf1HXlcKegmyFVB1BzHkDLRm3y4+iBMYNsPkZNNZisbv/5etDodCLVQRS/2EiBSHLEjD85Vtm6gCkYieKRdIshyUMwiNr1dIJIJEhdrNt0hsEDkXAbeIRUN9j7OijoZ6Wr076i3+NBuci5wOC7bzLPbU56v2TmJ1yHPqFjAkHKMEesWPHDv7tKANUdsSV03fx1XI6QIDAQAB"

func newPayClient(): Payer {
    var client = PayClientBuilder()
        .setAppID(APPID)
        .setApiUrl(API_URL)
        .setAppID(APPID)
        .setAlipayRootCertSn(ALIPAY_ROOT_CERTSN)
        .setAlipayPublicKey(ALIPAY_PUB_KEY)
        .setAppCertSn(APP_CERTSN)
        .setCharset("utf-8")
        .setFormat("JSON")
        .setPrivateKey(PRIVATE_KEY)
        .setPublicKey(PUB_KEY)
        .setSignType("RSA2")
        .setVersion("1.0")
        .build()
    return client
}

@Test
public class PayTest{
    @TestCase
    public func testTradeCreate(){
    let outTradeNo = DateTime.now().toUnixTimeStamp().toNanoseconds().toString()
    var bizContent = biz.TradeCreateBiz()
    bizContent.setSubject(JsonString("华为Mate70"))
    bizContent.setOutTradeNo(JsonString(outTradeNo))
    bizContent.setTotalAmount(JsonInt(5))
    bizContent.set("seller_id", JsonString("2088721038897364"))
    bizContent.setBuyerId(JsonString("2088722038897372"))
    bizContent.set("timestamp", JsonString("2024-10-28 17:47:04"))
    let client = newPayClient()
    let result = client.tradeCreate(bizContent)
    @Expect(result.response.code,"10000")
    @Expect(result.response.msg,"Success")
    }
}