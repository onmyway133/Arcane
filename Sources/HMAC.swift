//
//  HMAC.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 08/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CCommonCrypto

public struct HMAC {

  // MARK: - NSData

  public static func MD5(data: NSData, key: NSData) -> NSData? {
    return HMAC.generate(data, key: key, crypto: .MD5)
  }

  public static func SHA1(data: NSData, key: NSData) -> NSData? {
    return HMAC.generate(data, key: key, crypto: .SHA1)
  }

  public static func SHA224(data: NSData, key: NSData) -> NSData? {
    return HMAC.generate(data, key: key, crypto: .SHA224)
  }

  public static func SHA256(data: NSData, key: NSData) -> NSData? {
    return HMAC.generate(data, key: key, crypto: .SHA256)
  }

  public static func SHA384(data: NSData, key: NSData) -> NSData? {
    return HMAC.generate(data, key: key, crypto: .SHA384)
  }

  public static func SHA512(data: NSData, key: NSData) -> NSData? {
    return HMAC.generate(data, key: key, crypto: .SHA512)
  }

  static func generate(data: NSData, key: NSData, crypto: Crypto) -> NSData? {
    guard let HMACAlgorithm = crypto.HMACAlgorithm else { return nil }

    // Can also use UnsafeMutablePointer<CUnsignedChar>.alloc(Int(crypto.length))
    var buffer = Array<UInt8>(count: Int(crypto.length), repeatedValue: 0)
    CCHmac(HMACAlgorithm, key.bytes, key.length, data.bytes, data.length, &buffer)

    return NSData(bytes: buffer, length: Int(crypto.length))
  }

  // MARK: - String

  public static func MD5(string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .MD5)
  }

  public static func SHA1(string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA1)
  }

  public static func SHA224(string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA224)
  }

  public static func SHA256(string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA256)
  }

  public static func SHA384(string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA384)
  }

  public static func SHA512(string: String, key: String) -> String? {
    return HMAC.generate(string, key: key, crypto: .SHA512)
  }

  static func generate(string: String, key: String, crypto: Crypto) -> String? {
    guard let data = string.dataUsingEncoding(NSUTF8StringEncoding),
      keyData = key.dataUsingEncoding(NSUTF8StringEncoding)
      else { return nil }

    return HMAC.generate(data, key: keyData, crypto: crypto)?.hexString
  }
}
