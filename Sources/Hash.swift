//
//  Hash.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 07/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CCommonCrypto

public struct Hash {

  // MARK: - NSData

  public static func MD2(_ data: Data) -> Data {
    return Hash.hash(data, crypto: .MD2)
  }

  public static func MD4(_ data: Data) -> Data {
    return Hash.hash(data, crypto: .MD4)
  }

  public static func MD5(_ data: Data) -> Data {
    return Hash.hash(data, crypto: .MD5)
  }

  public static func SHA1(_ data: Data) -> Data {
    return Hash.hash(data, crypto: .SHA1)
  }

  public static func SHA224(_ data: Data) -> Data {
    return Hash.hash(data, crypto: .SHA224)
  }

  public static func SHA256(_ data: Data) -> Data {
    return Hash.hash(data, crypto: .SHA256)
  }

  public static func SHA384(_ data: Data) -> Data {
    return Hash.hash(data, crypto: .SHA384)
  }

  public static func SHA512(_ data: Data) -> Data {
    return Hash.hash(data, crypto: .SHA512)
  }

  static func hash(_ data: Data, crypto: Crypto) -> Data {
    var buffer = Array<UInt8>(repeating: 0, count: Int(crypto.length))
    crypto.method(data: (data as NSData).bytes, length: UInt32(data.count), buffer: &buffer)

    return Data(bytes: UnsafePointer<UInt8>(buffer), count: buffer.count)
  }

  // MARK: - String

  public static func MD2(_ string: String) -> String? {
    return Hash.hash(string, crypto: .MD2)
  }

  public static func MD4(_ string: String) -> String? {
    return Hash.hash(string, crypto: .MD4)
  }

  public static func MD5(_ string: String) -> String? {
    return Hash.hash(string, crypto: .MD5)
  }

  public static func SHA1(_ string: String) -> String? {
    return Hash.hash(string, crypto: .SHA1)
  }

  public static func SHA224(_ string: String) -> String? {
    return Hash.hash(string, crypto: .SHA224)
  }

  public static func SHA256(_ string: String) -> String? {
    return Hash.hash(string, crypto: .SHA256)
  }

  public static func SHA384(_ string: String) -> String? {
    return Hash.hash(string, crypto: .SHA384)
  }

  public static func SHA512(_ string: String) -> String? {
    return Hash.hash(string, crypto: .SHA512)
  }

  static func hash(_ string: String, crypto: Crypto) -> String? {
    guard let data = string.data(using: String.Encoding.utf8) else { return nil }

    return Hash.hash(data, crypto: crypto).hexString
  }
}
