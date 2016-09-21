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

  public static func encrypt(_ data: Data, key: Data) -> Data? {
    return perform(data, key: key, encrypting: true)
  }

  public static func decrypt(_ data: Data, key: Data) -> Data? {
    return perform(data, key: key, encrypting: false)
  }

  // MARK: - String

  public static func encrypt(_ string: String, key: String) -> String? {
    guard let data = string.data(using: String.Encoding.utf8),
      let keyData = key.data(using: String.Encoding.utf8) else { return nil }

    let encrypted = perform(data, key: keyData, encrypting: true)
    return encrypted?.base64EncodedString(options: .lineLength64Characters)
  }

  public static func decrypt(_ string: String, key: String) -> String? {
    guard let data = Data(base64Encoded: string, options: .ignoreUnknownCharacters),
      let keyData = key.data(using: String.Encoding.utf8) else { return nil }

    guard let decrypted = perform(data, key: keyData, encrypting: false) else { return nil }
    return String(data: decrypted, encoding: String.Encoding.utf8)
  }

  // MARK: - Private

  fileprivate static func perform(_ data: Data, key: Data, encrypting: Bool) -> Data? {
    guard let out = NSMutableData(length: data.count + kCCBlockSizeAES128) else { return nil }

    let hashData = Hash.SHA384(key)
    let hashKeyData = hashData.subdata(in: 0..<32)
    let ivData = hashData.subdata(in: 32..<48)

    let operation = encrypting ? kCCEncrypt : kCCDecrypt
    var dataOutMovedLength: size_t = 0

    let status = CCCrypt(
      CCOperation(operation),
      CCAlgorithm(kCCAlgorithmAES128),
      CCOptions(kCCOptionPKCS7Padding),
      (hashKeyData as NSData).bytes,
      kCCKeySizeAES128,
      (ivData as NSData).bytes,
      (data as NSData).bytes,
      size_t(data.count),
      out.mutableBytes,
      size_t(out.length),
      &dataOutMovedLength)

    guard Int(status) == Int(kCCSuccess) else { return nil }

    out.length = dataOutMovedLength
    return out as Data
  }
}
