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

package alipay_sdk.test
import std.sort.SortExtension
import alipay_sdk.newSigner
import std.unittest.*
import std.unittest.testmacro.*
const PRIVATE_KEY_FILE = #"MIIEogIBAAKCAQEAog0N+rHllTO+e42Bc5mpvowolWVStyurL3Ou/86uRMN8im7WG1v44h09IaZpw4k6dpYEj89d7aLd7IwnBR5Wg84Ox2LMR/Y/Pzo10hjlvJJOk+igqepSTtB/4UX0cG/9tWceHAWOFuD8uw/SSJegC91a0MmLUBUpd4wWnN1iOSi0442iNvNk79Z6xLKIs4LNJGCNddxcofvpdqq4/5ywxHo24m5zPQf6/ttGk5jQQVrF+y2ckdHKd2h7ZSOYI7nzlzbZqK0UOMDuTvRs696fPa5wSEshE0RQBcn5iCltNTPyLsL3RGUUlsLOPsyT6cFZtUAKJ+J6wEqQxM5TrvNHywIDAQABAoIBAGDTuhGccFipVVzP3ZSsMV+4sZsqsrTd8+hjkCIrZbeSsvyoY2hvmRPKcreDjtiWS4eF9e3T8wTF9yKbT8lgKkORQQVkBDnPalUmO/hwhf0Z0rfQHQfKCiorrO129iqk0AyvM698pj0HbBt9xaE4cBoGxnfQpVxReLiEzRInucP6lhE79v1BwXCwMtRVvFPPIFaLJ02JGIywN+jnkpLwJj8TAu5u3JawlRnsFJgQeTdsHs4G6E11WBeo7OZtKPiKWMcj1nPU0Dnr+6VG89Rx/cxqlMrlTJBhKsLEzcVQwcc3M3UnMOU3Of7Mj1olnUGJ90apVukDFM5OI4Mfqi9etekCgYEA9ViJqVUdzJwqTK/gmbAsRvri9+rmWhfoqBMGeUoHktOGR/hMKJ/LrVa1oBIcVVNdLbI7Ks0kySGCa6qm/4YP2DCihj0GKwnHdPQ94pd3lWvUFZimNKi5V/+sREU0dKSqK3b7F0njtpR6zn+x8KpktO7izL3o8740KpSb7xGb0BUCgYEAqRaLShbDYjhSfvIzWAbuPNpvvtDWUNip1cuJwzTvDthECV5ltkhLGVWVnStch6OeTbK+llLDVw+j/YT1KetQcZ60tw2spn8nq6UvC2IFa2h61zpa8VWeRDfhyEIzoBE8DFAyeWjqYHyHJlh0BzRA2P3ts2LwwwhRa6OHhYzQ0F8CgYAUUvpMab2nNoSWh7dOY/a3Bo+IxA/DBNoEGldd8tD/y8AC9EGy19HykQ1Irldkhhxg7bPTDt1uP/Vi3+cnob5sRVMhVarOI+g++wCpZazFVwJhq5yRHi0EaiymFymKRB3IrfmM61UOyewGcTOXYTYoeuWU2mKS1n3RzS/BtS64JQKBgB2husVAGftzfVmL3l2V0VhOu3iIJpbCcXjrE3hnJWHHmpy9sztvjeGhsvd5Kt0GWm6pXWcAmAUA069RBpnTCCTxOCBAQDppXC1jZEwtYF/DTou7SUazx2mTFXk/yMZLXueVglLuhOxlxlV8+NBuYtLkJSzjsOes5H/lh5Fq7QknAoGAJ/LzTBLPy3terUgqejSxB4pr6PMbNd8wEStHN1RmR2v9Msuto7PUT7OOjQYIJwQLnxQUDr65bB5uR35v+L/rC6XUkzJM18YWvmOhFM8OsIYc4HdDhSmeFpMXdbd6entMJEX0bWrTbS/UdEcqE30kwuNuEFQ07LopGY1gBEe1G8U="# // 沙箱环境自定义测试密钥
const PUBILC_KEY_FILE = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAog0N+rHllTO+e42Bc5mpvowolWVStyurL3Ou/86uRMN8im7WG1v44h09IaZpw4k6dpYEj89d7aLd7IwnBR5Wg84Ox2LMR/Y/Pzo10hjlvJJOk+igqepSTtB/4UX0cG/9tWceHAWOFuD8uw/SSJegC91a0MmLUBUpd4wWnN1iOSi0442iNvNk79Z6xLKIs4LNJGCNddxcofvpdqq4/5ywxHo24m5zPQf6/ttGk5jQQVrF+y2ckdHKd2h7ZSOYI7nzlzbZqK0UOMDuTvRs696fPa5wSEshE0RQBcn5iCltNTPyLsL3RGUUlsLOPsyT6cFZtUAKJ+J6wEqQxM5TrvNHywIDAQAB" // 沙箱环境自定义测试密钥
const SOURCE_URL = #"alipay_root_cert_sn=687b59193f3f462dd5336e5abf83c5d8_02941eef3187dddf3d3b83462e1dfcf6&app_cert_sn=1aca24501cc5cd3ac19089ff49d99d63&app_id=2021000117650139&biz_content={"buyer_id":"2088102175953034","out_trade_no":"1620630871769533001","subject":"iPhone","timestamp":"2021-05-08 17:09:04","total_amount":"88.88"}&charset=utf-8&format=JSON&method=alipay.trade.create&sign_type=RSA2&timestamp=2021-05-12 17:18:09&version=1.0"#

@Test
public func signTest() {
    var s = newSigner("RSA2")
    s.setPrivateKey(PRIVATE_KEY_FILE)
    s.setPublicKey(PUBILC_KEY_FILE)
    var sourceSplit = SOURCE_URL.split("&", removeEmpty: true)
    sourceSplit.sort(stable: true)
    let sortSource = String.join(sourceSplit, delimiter: "&")

    let signature = s.sign(sortSource)
    let isPassed = s.verify(sortSource, signature)
    @Expect(isPassed,true)
}
