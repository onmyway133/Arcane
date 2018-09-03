//
//  HMAC.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 08/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CCommonCrypto

public extension Data {
    public func HMACMD5(with key: String) -> Data? {
        return _HMAC(utf8Key: key, crypto: .MD5)
    }
    public func HMACSHA1(with key: String) -> Data? {
        return _HMAC(utf8Key: key, crypto: .SHA1)
    }
    public func HMACSHA224(with key: String) -> Data? {
        return _HMAC(utf8Key: key, crypto: .SHA224)
    }
    public func HMACSHA256(with key: String) -> Data? {
        return _HMAC(utf8Key: key, crypto: .SHA256)
    }
    public func HMACSHA384(with key: String) -> Data? {
        return _HMAC(utf8Key: key, crypto: .SHA384)
    }
    public func HMACSHA512(with key: String) -> Data? {
        return _HMAC(utf8Key: key, crypto: .SHA512)
    }
    /// not use for public. Public method should use **throw** version
    private func _HMAC(utf8Key: String, crypto: Crypto) -> Data? {
        do {
            return try HMAC(utf8Key: utf8Key, crypto: .MD5)
        } catch {
            return nil
        }
    }
    
    public func HMAC(utf8Key: String, crypto: Crypto) throws -> Data {
        guard let keyData = utf8Key.data(using: .utf8) else {
            throw ArcaneError.nilKeyType("| encode with utf8 |")
        }
        return try HMAC(keyData, crypto: crypto)
    }
    
    public func HMAC(_ key: Data, crypto: Crypto) throws -> Data  {
        guard let HMACAlgorithm = crypto.HMACAlgorithm else {
            throw ArcaneError.wrongAlgorithm(crypto)
        }
        
        // Can also use UnsafeMutablePointer<CUnsignedChar>.alloc(Int(crypto.length))
        var buffer = Array<UInt8>(repeating: 0, count: Int(crypto.length))
        CCHmac(HMACAlgorithm, (key as NSData).bytes, key.count, (self as NSData).bytes, self.count, &buffer)
        
        return Data(bytes: UnsafePointer<UInt8>(buffer), count: Int(crypto.length))
    }
}
