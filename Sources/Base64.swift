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

    public static func MD2(_ data: Data) -> Data {
        return Base64.base64(data, crypto: .MD2)
    }

    public static func MD4(_ data: Data) -> Data {
        return Base64.base64(data, crypto: .MD4)
    }

    public static func MD5(_ data: Data) -> Data {
        return Base64.base64(data, crypto: .MD5)
    }

    public static func SHA1(_ data: Data) -> Data {
        return Base64.base64(data, crypto: .SHA1)
    }

    public static func SHA224(_ data: Data) -> Data {
        return Base64.base64(data, crypto: .SHA224)
    }

    public static func SHA256(_ data: Data) -> Data {
        return Base64.base64(data, crypto: .SHA256)
    }

    public static func SHA384(_ data: Data) -> Data {
        return Base64.base64(data, crypto: .SHA384)
    }

    public static func SHA512(_ data: Data) -> Data {
        return Base64.base64(data, crypto: .SHA512)
    }

    static func base64(_ data: Data, crypto: Crypto) -> Data {
        return Hash.hash(data, crypto: crypto).base64
    }

    // MARK: - String

    public static func MD2(_ string: String) -> String? {
        return Base64.base64(string, crypto: .MD2)
    }

    public static func MD4(_ string: String) -> String? {
        return Base64.base64(string, crypto: .MD4)
    }

    public static func MD5(_ string: String) -> String? {
        return Base64.base64(string, crypto: .MD5)
    }

    public static func SHA1(_ string: String) -> String? {
        return Base64.base64(string, crypto: .SHA1)
    }

    public static func SHA224(_ string: String) -> String? {
        return Base64.base64(string, crypto: .SHA224)
    }

    public static func SHA256(_ string: String) -> String? {
        return Base64.base64(string, crypto: .SHA256)
    }

    public static func SHA384(_ string: String) -> String? {
        return Base64.base64(string, crypto: .SHA384)
    }

    public static func SHA512(_ string: String) -> String? {
        return Base64.base64(string, crypto: .SHA512)
    }
    
    static func base64(_ string: String, crypto: Crypto) -> String? {
        guard let data = string.data(using: String.Encoding.utf8) else { return nil }
        
        return Hash.hash(data, crypto: crypto).base64String
    }
}
