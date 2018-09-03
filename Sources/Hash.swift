//
//  Hash.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 07/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CCommonCrypto

public extension Data {
    public var MD2: Data {
        return hash(with: .MD2)
    }
    
    public var MD4: Data {
        return hash(with: .MD4)
    }
    
    public var MD5: Data {
        return hash(with: .MD5)
    }
    
    public var SHA1: Data {
        return hash(with: .SHA1)
    }
    
    public var SHA224: Data {
        return hash(with: .SHA224)
    }
    
    public var SHA256: Data {
        return hash(with: .SHA256)
    }
    
    public var SHA384: Data {
        return hash(with: .SHA384)
    }
    
    public var SHA512: Data {
        return hash(with: .SHA512)
    }
    
    public func hash(with crypto: Crypto) -> Data {
        var buffer = Array<UInt8>(repeating: 0, count: Int(crypto.length))
        crypto.method(data: (self as NSData).bytes, length: UInt32(self.count), buffer: &buffer)
        
        return Data(bytes: UnsafePointer<UInt8>(buffer), count: buffer.count)
    }
}

extension String {
    public var MD2: Data? {
        return _hash_utf8(crypto: .MD2)
    }
    
    public var MD4: Data? {
        return _hash_utf8(crypto: .MD4)
    }
    
    public var MD5: Data? {
        return _hash_utf8(crypto: .MD5)
    }
    
    public var SHA1: Data? {
        return _hash_utf8(crypto: .SHA1)
    }
    
    public var SHA224: Data? {
        return _hash_utf8(crypto: .SHA224)
    }
    
    public var SHA256: Data? {
        return _hash_utf8(crypto: .SHA256)
    }
    
    public var SHA384: Data? {
        return _hash_utf8(crypto: .SHA384)
    }
    
    public var SHA512: Data? {
        return _hash_utf8(crypto: .SHA512)
    }
    
    private func _hash_utf8(crypto: Crypto) -> Data? {
        do {
            return try hash_utf8(crypto)
        } catch {
            return nil
        }
    }
    
    /// **Warning: String must be utf8 encoding**
    public func hash_utf8(_ crypto: Crypto) throws -> Data {
        guard let data = self.data(using: .utf8) else {
            throw ArcaneError.nilKeyType("| encode with utf8 |")
        }
        return data.hash(with: crypto)
    }
}

