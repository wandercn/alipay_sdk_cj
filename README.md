<div align="center">
<h1>alipay_sdk_cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v1.0.0-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.56.4-brightgreen" style="display: inline-block;" />
<!-- <img alt="" src="https://img.shields.io/badge/cjcov-0.0%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/state-孵化/毕业-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/domain-HOS/Cloud-brightgreen" style="display: inline-block;" /> -->
</p>

## 介绍

AliPay Sdk for 仓颉

支付宝支付后端仓颉原生SDK。只支持最安全的RSA2，公钥证书方式签名验证方式,默认只支持utf-8编码和JSON格式。目前只支持商户直接接入模式

 RSA2密钥生成请参考<https://opendocs.alipay.com/common/02kipl> 中的公钥证书方式生成，使用CSR文件申请，密钥格式必须使用PKCS1(非java适用)

### 项目特性

- 支持手机网站支付相关接口

- 支持电脑网站支付相关接口

- 支持对请求数据签名和对支付宝返回数据同步验签

- 支付支付宝异步回调信息异步验签 `asyncVerifySign`

### 项目计划

1. 2024.11.11 已经完成支付宝支付在微信公共号和电脑网页场景接口后端所有功能。
2. 后续其他接口，有用户提需求再增加



### 注意事项说明：

main分支： 目前适配 Dev Channel 0.56.4

beta_0.53.13分支：目前适配 Beta Channel 0.53.13

### 源码目录

```shell
.
├── LICENSE     #开源协议
├── README.md   #整体介绍
├── aipdocs     #cjdoc 生成api接口文档目录
├── cjpm.toml
├── config      #cjdoc 生成文档的配置文件
├── example     #示例代码
└── src         #源码目录
    ├── biz     #支付宝每个接口对应请求参数类
    ├── jsonhelper # json序列化和反序列化使用到的帮助函数接口
    ├── pay.cj     # 支付接口
    ├── request.cj # 请求参数组合
    ├── response   # 每个接口返回结构字段
    ├── sign.cj    # 签名，验签
    └── util.cj    # 其他模块用到的函数
```
## 如何使用

在您代码仓的 cjpm.toml 文件中，需要新增加如下源码依赖：

Beta Channel 0.53.13

```
[dependencies]
 CJson = {git = "https://gitcode.com/Cangjie-SIG/alipay_sdk_cj", branch = "beta_0.53.13"}
```

Dev Channel 0.56.4

```
[dependencies]
 CJson = {git = "https://gitcode.com/Cangjie-SIG/alipay_sdk_cj", branch = "main"}
```

## Example

 ## apidoc
 <https://opendocs.alipay.com/apis/api_1/alipay.trade.create>

 ## alipay.trade.create(统一收单交易创建接口)

 注意：开发环境使用沙箱环境下的CSR公钥证书配置调试代码,生产环境需要切换正式申请的公钥证书配置。沙箱环境配置参考<https://opendocs.alipay.com/common/02kkv7>
 
 (如下的Example使用的是沙箱环境下本人申请的自定义公钥证书) (已经适配新版沙箱环境,新版沙箱网关地址是https://openapi-sandbox.dl.alipaydev.com/gateway.do)


```cangjie

import std.time.DateTime
import alipay_sdk.{PayClientBuilder,Payer}
import alipay_sdk.biz
import encoding.json.{JsonString,JsonInt,ToJson}


main() {
    let outTradeNo = DateTime.now().toUnixTimeStamp().toNanoseconds().toString()
    var bizContent = biz.TradeCreateBiz()
    bizContent.setSubject(JsonString("huawei Mate70"))
    bizContent.setOutTradeNo(JsonString(outTradeNo))
    bizContent.setTotalAmount(JsonInt(5))
    bizContent.set("seller_id", JsonString("2088721038897364"))
    bizContent.setBuyerId(JsonString("2088722038897372"))
    bizContent.set("timestamp", JsonString("2024-10-28 17:47:04"))
    let client = newPayClient()
    let result = client.tradeCreate(bizContent)
    println(result.serialize().toJson())
    return
}

const pubkey ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuYr//cNhdjma7rhDg+dWpSi2H7TvZFZA6PrY9IkTHkJUFU4GXEYeek3AfVPdTJU3/RnJQ4OgnD2mCqFGSgUogePNSBnpmqO8qrSNf0b0LCmt9OT+uuURbuxZjK4XmlEsSqfcDz0ZudApc93PdODpBr5Fw1QFQVz4GPlWieTlVf97GLJBHjTa5i41GYGKe9Wk9AsFOAetTaKdKc5Kq/UVlvOZ7Izl+AzjmmDuVqqn2mUhJPj0Upv9Uw/h9DwLB/I7ebaBl5t+ePnvkaezGr/GqRCMyPmBrRWCW7ztZy9xQi19a8aPbuRjwnUgwfHcxQSczYdSmRvU3L5pSvoMJXBf5QIDAQAB"
const apiurl= "https://openapi-sandbox.dl.alipaydev.com/gateway.do"
const appcertsn="2ae63de7d1a864071bd72875b6aea838"
const privateKey="MIIEowIBAAKCAQEAuYr//cNhdjma7rhDg+dWpSi2H7TvZFZA6PrY9IkTHkJUFU4GXEYeek3AfVPdTJU3/RnJQ4OgnD2mCqFGSgUogePNSBnpmqO8qrSNf0b0LCmt9OT+uuURbuxZjK4XmlEsSqfcDz0ZudApc93PdODpBr5Fw1QFQVz4GPlWieTlVf97GLJBHjTa5i41GYGKe9Wk9AsFOAetTaKdKc5Kq/UVlvOZ7Izl+AzjmmDuVqqn2mUhJPj0Upv9Uw/h9DwLB/I7ebaBl5t+ePnvkaezGr/GqRCMyPmBrRWCW7ztZy9xQi19a8aPbuRjwnUgwfHcxQSczYdSmRvU3L5pSvoMJXBf5QIDAQABAoIBAE9IWgKxTiAalV2UVyUx4RBJySjbQ7/4K1xic/pp6EVxykQgRw9+1t8kAjCLeXCUAoygTCQRRrv8i8rXBxXyBlEaakl46R0vAhtfc2cDhqqoVLDkeQSbhUuEqu82JNfH/8kW2S2Zyjhf/paIHXGv+WLsQxsn9+bqNwlU4emiaWzJNeo8VDWH/7muOOZDEkj/1z/BPzf74RrgkNQFJM6n3EqOjQNdV2ogmGiArBGfGCBfdX0m7X1m7m0RdUHd0PhohUMAp7N6MCtyioFT6vPjrNZHTFCULAI6AqtToJ2zyrBOsyr2kLy3EQXPDMd3Zk+p0NEjmOLQKzD0rGkOjrpzc7ECgYEA/pEdQrS8HvNKQoUK22CEw633GY8Ef7iLio7aSY87FEVSYITpJsZsPQ8Bm3pLGuj3LiF4usmzEeB7ZheJATIVivW2W5AHTFPaHrRz6pQRTVKQ+asczGVrpGYF1XZwtcvWeuSmwOLHTA5cTlasV5e4lP0Ee/A0JwzoqYZPVFd5Gr8CgYEAupZoSZyW2m39tAK/X2RIW5dlglaZtg8PSWmk1LkBItP2WrL7Jre3Oa1CZQNlpCGEkRVzeb32q5EBEG/QTVD3g4smaJ2OYpSNpJVmkjof2/BnfYswzhYiaukK1KV88jNylek3LOULYPAHPxt7gyNG1W+R/rbdF86Xyx/fVrZJolsCgYA7srpC73GCbJmImfyez7ay0PQ2uTRb42JN/wwv3fgD2/Hikqi+oB+3/fHpjTdZuzJkThMq8qwc0CEAIxrM/frRWKgINvGPM8beFoFsjIa2NFutQTSCtnIU3pwVoC30ZDYLId39M/F6449AC9FkxT7TKbbIfd8tHTjesJGf/Nd4rwKBgQCz0fB/wOHBcO9oZJ16mXMCkk3J5xwMUUcyQRYRzJpDrnNlxcg18Cgs9cVfBH8YRxUznbDES0dG4WBdLuVZHgbsR1aky/NFHlXDoBhSJKI/nNigLVzDwKE6140QksxvvxVXVINQSQ1GRw00zI+kOoMxf2z8Rc+d+gRgRj8/mj4ssQKBgBgSkawYSapzlqtRn397p3QiOMPA0OKaoL5ovVxLKKsr/L8b1SrPntk0CUHYVFjE6P5l4RuFURoGnny5ThXWvYQ0A1xkKGMmVTbQJld+K2rqNyghtAX5CtA0laTngJHK4CFoHNNwQwExbQrWzaCBDEjVZOjTrD2/fgoN1wlOtJL7"
const alipayrootcertsn ="687b59193f3f462dd5336e5abf83c5d8_02941eef3187dddf3d3b83462e1dfcf6"
const appid="9021000138690920"
const alipaypubKey="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjRE7n0tuGp4e/3RwUnExLxU0JUDsbOOpFgGO/UJT2jidePGRN/GJlqMREfkyYh+JwAhs2ehEUG1j5wnKBIeqCHN8SixwQamyqkMypSJhCUIxfPGOkdD2Vj7n+/iVCFJvmUWBUN5OqD57x410mf1HXlcKegmyFVB1BzHkDLRm3y4+iBMYNsPkZNNZisbv/5etDodCLVQRS/2EiBSHLEjD85Vtm6gCkYieKRdIshyUMwiNr1dIJIJEhdrNt0hsEDkXAbeIRUN9j7OijoZ6Wr076i3+NBuci5wOC7bzLPbU56v2TmJ1yHPqFjAkHKMEesWPHDv7tKANUdsSV03fx1XI6QIDAQAB"
func newPayClient(): Payer {
    var client = PayClientBuilder()
        .setAppID(appid)
        .setApiUrl(apiurl)
        .setAppID(appid)
        .setAlipayRootCertSn(alipayrootcertsn)
        .setAlipayPublicKey(alipaypubKey)
        .setAppCertSn(appcertsn)
        .setCharset("utf-8")
        .setFormat("JSON")
        .setPrivateKey(privateKey)
        .setPublicKey(pubkey)
        .setSignType("RSA2")
        .setVersion("1.0")
        .build()
    return client
}

```

## output

```json

{"sign":"gXCzk12LlpSmddZkODd5pudECfGcOYKmxFbfl3PpZhQrQd/10Y5HvtZU0LwqsDUr3FkDHXWptpV5AygH1nxxcABQXtpR6Gl2KE1J+Y9gQBwak+/5p0XmpRV9IsLxKCipvZwr+yk8gV6WU1c4aeaFG6C0IHdgLIoeDHJmc2xUNirsvNDI9ctvrQQ/t7aaER2ehvsvyfQW7+rydbdtfWzt8h5JhfowfANWA3imw7h1vfdJL1meAf5fentFaZ04TDx0C7gE9mycnU2QzZAO/Ag1Wt3FVN74w4HZiJ9vxm9Hw1ebym3EZcnHpCnS+H1WsKGKPhwjiGNQS9MntuaHnGdSUw==","alipay_cert_sn":"71d5f5ab5fa06fcad86b56c0c5888217","alipay_trade_create_response":{"code":"10000","msg":"Success","sub_code":null,"sub_msg":null,"trade_no":"2024102922001497370504000146","out_trade_no":"1730196119255256000"}}

```

## 参考项目

https://github.com/wandercn/alipay_sdk_rust

## 生成api文档

```
 cd alipay_sdk_cj
 cjdoc config
```
api文档就生成在apidocs/docs目录下是html文件，浏览器打开index.html就可以看到
```

## 开源协议
木兰宽松许可证， 第2版 License

## 参与贡献

欢迎给我们提交PR，欢迎给我们提交Issue，欢迎参与任何形式的贡献。