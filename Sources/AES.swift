//
//  AES.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 27/07/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CCommonCrypto

public struct AES {

  // MARK: - Data

  public static func encrypt(data: NSData, key: NSData) -> NSData? {
    return perform(data, key: key, encrypting: true)
  }

  public static func decrypt(data: NSData, key: NSData) -> NSData? {
    return perform(data, key: key, encrypting: false)
  }

  // MARK: - String

  public static func encrypt(string: String, key: String) -> String? {
    guard let data = string.dataUsingEncoding(NSUTF8StringEncoding),
      keyData = key.dataUsingEncoding(NSUTF8StringEncoding) else { return nil }

    let encrypted = perform(data, key: keyData, encrypting: true)
    return encrypted?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
  }

  public static func decrypt(string: String, key: String) -> String? {
    guard let data = NSData(base64EncodedString: string, options: .IgnoreUnknownCharacters),
      keyData = key.dataUsingEncoding(NSUTF8StringEncoding) else { return nil }

    guard let decrypted = perform(data, key: keyData, encrypting: false) else { return nil }
    return String(data: decrypted, encoding: NSUTF8StringEncoding)
  }

  // MARK: - Private

  private static func perform(data: NSData, key: NSData, encrypting: Bool) -> NSData? {
    guard let out = NSMutableData(length: data.length + kCCBlockSizeAES128) else { return nil }

    let operation = encrypting ? kCCEncrypt : kCCDecrypt
    var dataOutMovedLength: Int = 0

    let status = CCCrypt(
      UInt32(operation),
      UInt32(kCCAlgorithmAES128),
      UInt32(kCCOptionPKCS7Padding),
      key.bytes,
      kCCKeySizeAES128,
      nil,
      data.bytes,
      data.length,
      out.mutableBytes,
      out.length,
      &dataOutMovedLength)

    guard UInt32(status) == UInt32(kCCSuccess) else { return nil }

    out.length = dataOutMovedLength
    return out
  }
}
