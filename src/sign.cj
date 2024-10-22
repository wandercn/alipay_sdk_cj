package alipay_sdk

import crypto.keys.*
import crypto.x509.*
import std.io.*
import crypto.digest.*
import std.crypto.digest.*
import encoding.base64

public interface Signer {
    mut func setPrivateKey(s: String): Unit
    func sign(s: String): String
    func verify(source: String, signature: String): Bool
    mut func setPublicKey(s: String): Unit
}

// 目前只支持RSA2模式
public struct SignSHA256WithRSA <: Signer {
    var privateKey: Option<RSAPrivateKey>
    var publicKey: Option<RSAPublicKey>
    init(signType: String) {
        match (signType) {
            case "RSA2" =>
                this.privateKey = None
                this.publicKey = None
            case _ =>
                this.privateKey = None
                this.publicKey = None
        }
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
            var md = digest(h, source)
            let signatureByte = priv.sign(h, md, padType: PKCS1)
            return base64.toBase64String(signatureByte).toString()
        } else {
            throw Exception("PrivateKey is empty")
        }
    }
    // 通过RSA公钥验证签名文本
    public func verify(source: String, signature: String): Bool {
        if (let Some(pubKey) <- this.publicKey) {
            var h = SHA256()
            var md = digest(h, source)
            return pubKey.verify(h, md, signature.toArray(), padType: PKCS1)
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

const kPublicKeyPrefix = "-----BEGIN PUBLIC KEY-----"
const kPublicKeySuffix = "-----END PUBLIC KEY-----"
const kPKCS1Prefix = "-----BEGIN RSA PRIVATE KEY-----"
const KPKCS1Suffix = "-----END RSA PRIVATE KEY-----"
const kPKCS8Prefix = "-----BEGIN PRIVATE KEY-----"
const KPKCS8Suffix = "-----END PRIVATE KEY-----"
const kPublicKeyType = "PUBLIC KEY"
const kPrivateKeyType = "PRIVATE KEY"
const kRSAPrivateKeyType = "RSA PRIVATE KEY"

func formatPKCS1PrivateKey(raw: String): String {
    return formatKey(raw, kPKCS1Prefix, KPKCS1Suffix, 64)
}

func formatPKCS8PrivateKey(raw: String): String {
    return formatKey(raw, kPKCS8Prefix, KPKCS8Suffix, 64)
}

func formatPublicKey(raw: String): String {
    return formatKey(raw, kPublicKeyPrefix, kPublicKeySuffix, 64)
}

func formatKey(raw: String, prefix: String, suffix: String, lineCount: Int): String {
    var byteArrayStream = ByteArrayStream()
    let buffer = StringWriter(byteArrayStream)
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
    return byteArrayStream.readString()
}
