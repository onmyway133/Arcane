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

    let hashData = Hash.SHA384(key)
    let hashKeyData = hashData.subdataWithRange(NSMakeRange(0, 32))
    let ivData = hashData.subdataWithRange(NSMakeRange(32, 16))

    let operation = encrypting ? kCCEncrypt : kCCDecrypt
    var dataOutMovedLength: size_t = 0

    let status = CCCrypt(
      CCOperation(operation),
      CCAlgorithm(kCCAlgorithmAES128),
      CCOptions(kCCOptionPKCS7Padding),
      hashKeyData.bytes,
      kCCKeySizeAES128,
      ivData.bytes,
      data.bytes,
      size_t(data.length),
      out.mutableBytes,
      size_t(out.length),
      &dataOutMovedLength)

    guard Int(status) == Int(kCCSuccess) else { return nil }

    out.length = dataOutMovedLength
    return out
  }
}
