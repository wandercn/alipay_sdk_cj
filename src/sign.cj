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
package alipay_sdk

import stdx.crypto.keys.{RSAPrivateKey, RSAPublicKey, PadOption}
import std.io.{ByteBuffer, StringWriter, readString}
import stdx.crypto.digest.SHA256
import std.crypto.digest.digest
import stdx.encoding.base64

public interface Signer {
    mut func setPrivateKey(s: String): Unit
    func sign(s: String): String
    func verify(source: String, signature: String): Bool
    mut func setPublicKey(s: String): Unit
}

public func newSigner(signType: String): Signer {
    match (signType) {
        case "RSA2" => SignSHA256WithRSA()
        case _ => SignSHA256WithRSA()
    }
}

// 目前只支持RSA2模式
public struct SignSHA256WithRSA <: Signer {
    var privateKey: Option<RSAPrivateKey>
    var publicKey: Option<RSAPublicKey>
    init() {
        this.privateKey = None
        this.publicKey = None
    }
    // 通过RSA文本字符串设置RSA私钥
    public mut func setPrivateKey(s: String) {
        this.privateKey = Some(loadPrivateKey(s))
    }
    // 通过RSA文字字符串设置RSA私钥
    public mut func setPublicKey(s: String) {
        this.publicKey = Some(loadPublicKey(s))
    }
    // 通过RSA私钥计算文本签名
    public func sign(source: String): String {
        if (let Some(priv) <- this.privateKey) {
            var h = SHA256()
            h.write(source.toArray())
            var md = h.finish()
            let signatureByte = priv.sign(h, md, padType: PKCS1)
            return base64.toBase64String(signatureByte)
        } else {
            throw Exception("PrivateKey is empty")
        }
    }
    // 通过RSA公钥验证签名文本
    public func verify(source: String, signature: String): Bool {
        if (let Some(pubKey) <- this.publicKey) {
            var h = SHA256()
            h.write(source.toArray())
            var md = h.finish()
            var decodeSign = base64.fromBase64String(signature)
            match (decodeSign) {
                case Some(signArr) => return pubKey.verify(h, md, signArr, padType: PKCS1)
                case None => throw Exception("base64 decode is failed")
            }
        } else {
            throw Exception("publicKey is empty")
        }
    }
}

public func loadPrivateKey(privateStr: String): RSAPrivateKey {
    return RSAPrivateKey.decodeFromPem(formatPKCS1PrivateKey(privateStr))
}

public func loadPublicKey(publicStr: String): RSAPublicKey {
    return RSAPublicKey.decodeFromPem(formatPublicKey(publicStr))
}

const PUBLIC_KEY_PREFIX = "-----BEGIN PUBLIC KEY-----"
const PUBLIC_KEY_SUFFIX = "-----END PUBLIC KEY-----"
const PKCS1_PREFIX = "-----BEGIN RSA PRIVATE KEY-----"
const PKCS1_SUFFIX = "-----END RSA PRIVATE KEY-----"
const PKCS8_PREFIX = "-----BEGIN PRIVATE KEY-----"
const PKCS8_SUFFIX = "-----END PRIVATE KEY-----"
const PUBLIC_KEY_TYPE = "PUBLIC KEY"
const PRIVATE_KEY_TYPE = "PRIVATE KEY"
const RSA_PRIVATE_KEY_TYPE = "RSA PRIVATE KEY"

func formatPKCS1PrivateKey(raw: String): String {
    return formatKey(raw, PKCS1_PREFIX, PKCS1_SUFFIX, 64)
}

func formatPKCS8PrivateKey(raw: String): String {
    return formatKey(raw, PKCS8_PREFIX, PKCS8_SUFFIX, 64)
}

func formatPublicKey(raw: String): String {
    return formatKey(raw, PUBLIC_KEY_PREFIX, PUBLIC_KEY_SUFFIX, 64)
}

func formatKey(raw: String, prefix: String, suffix: String, lineCount: Int): String {
    var byteBuffer = ByteBuffer()
    let buffer = StringWriter(byteBuffer)
    buffer.write(prefix)
    buffer.write("\n")
    let rawLen = lineCount
    let keyLen = raw.size
    var raws = keyLen / rawLen
    let temp = keyLen % rawLen
    if (temp > 0) {
        raws++
    }
    var start = 0
    var end = start + rawLen
    for (i in 0..raws) {
        if (i == raws - 1) {
            buffer.write(raw[start..])
        } else {
            buffer.write(raw[start..end])
        }
        buffer.write("\n")
        start += rawLen
        end = start + rawLen
    }
    buffer.write(suffix)
    buffer.write("\n")
    buffer.flush()
    return readString(byteBuffer)
}
