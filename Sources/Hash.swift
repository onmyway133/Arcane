//
//  Hash.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 07/05/16.
//  Copyright © 2016 Khoa Pham. All rights reserved.
//

import Foundation
import CCommonCrypto

public struct Hash {

  // MARK: - NSData

  public static func MD2(data: NSData) -> NSData {
    return Hash.hash(data, crypto: .MD2)
  }

  public static func MD4(data: NSData) -> NSData {
    return Hash.hash(data, crypto: .MD4)
  }

  public static func MD5(data: NSData) -> NSData {
    return Hash.hash(data, crypto: .MD5)
  }

  public static func SHA1(data: NSData) -> NSData {
    return Hash.hash(data, crypto: .SHA1)
  }

  public static func SHA224(data: NSData) -> NSData {
    return Hash.hash(data, crypto: .SHA224)
  }

  public static func SHA256(data: NSData) -> NSData {
    return Hash.hash(data, crypto: .SHA256)
  }

  public static func SHA384(data: NSData) -> NSData {
    return Hash.hash(data, crypto: .SHA384)
  }

  public static func SHA512(data: NSData) -> NSData {
    return Hash.hash(data, crypto: .SHA512)
  }

  static func hash(data: NSData, crypto: Crypto) -> NSData {
    let buffer = crypto.hash(data)

    return NSData(bytes: buffer, length: buffer.count)
  }

  // MARK: - String

  public static func MD2(string: String) -> String? {
    return Hash.hash(string, crypto: .MD2)
  }

  public static func MD4(string: String) -> String? {
    return Hash.hash(string, crypto: .MD4)
  }

  public static func MD5(string: String) -> String? {
    return Hash.hash(string, crypto: .MD5)
  }

  public static func SHA1(string: String) -> String? {
    return Hash.hash(string, crypto: .SHA1)
  }

  public static func SHA224(string: String) -> String? {
    return Hash.hash(string, crypto: .SHA224)
  }

  public static func SHA256(string: String) -> String? {
    return Hash.hash(string, crypto: .SHA256)
  }

  public static func SHA384(string: String) -> String? {
    return Hash.hash(string, crypto: .SHA384)
  }

  static func hash(string: String, crypto: Crypto) -> String? {
    guard let data = string.dataUsingEncoding(NSUTF8StringEncoding) else { return nil }

    let buffer = crypto.hash(data)

    return Array(0..<crypto.length).reduce("") {
      $0 ?? "" + String(format: "%02x", buffer[Int($1)])
    }
  }
}
