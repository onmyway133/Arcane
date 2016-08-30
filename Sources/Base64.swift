//
//  Base64.swift
//  Arcane
//
//  Created by Francesco Perrotti-Garcia on 8/30/16.
//  Copyright © 2016 Arcane. All rights reserved.
//

import Foundation
import CCommonCrypto

public struct Base64 {

    // MARK: - NSData

    public static func MD2(data: NSData) -> NSData {
        return Base64.base64(data, crypto: .MD2)
    }

    public static func MD4(data: NSData) -> NSData {
        return Base64.base64(data, crypto: .MD4)
    }

    public static func MD5(data: NSData) -> NSData {
        return Base64.base64(data, crypto: .MD5)
    }

    public static func SHA1(data: NSData) -> NSData {
        return Base64.base64(data, crypto: .SHA1)
    }

    public static func SHA224(data: NSData) -> NSData {
        return Base64.base64(data, crypto: .SHA224)
    }

    public static func SHA256(data: NSData) -> NSData {
        return Base64.base64(data, crypto: .SHA256)
    }

    public static func SHA384(data: NSData) -> NSData {
        return Base64.base64(data, crypto: .SHA384)
    }

    public static func SHA512(data: NSData) -> NSData {
        return Base64.base64(data, crypto: .SHA512)
    }

    static func base64(data: NSData, crypto: Crypto) -> NSData {
        return Hash.hash(data, crypto: crypto).base64
    }

    // MARK: - String

    public static func MD2(string: String) -> String? {
        return Base64.base64(string, crypto: .MD2)
    }

    public static func MD4(string: String) -> String? {
        return Base64.base64(string, crypto: .MD4)
    }

    public static func MD5(string: String) -> String? {
        return Base64.base64(string, crypto: .MD5)
    }

    public static func SHA1(string: String) -> String? {
        return Base64.base64(string, crypto: .SHA1)
    }

    public static func SHA224(string: String) -> String? {
        return Base64.base64(string, crypto: .SHA224)
    }

    public static func SHA256(string: String) -> String? {
        return Base64.base64(string, crypto: .SHA256)
    }

    public static func SHA384(string: String) -> String? {
        return Base64.base64(string, crypto: .SHA384)
    }

    public static func SHA512(string: String) -> String? {
        return Base64.base64(string, crypto: .SHA512)
    }
    
    static func base64(string: String, crypto: Crypto) -> String? {
        guard let data = string.dataUsingEncoding(NSUTF8StringEncoding) else { return nil }
        
        return Hash.hash(data, crypto: crypto).base64String
    }
}
