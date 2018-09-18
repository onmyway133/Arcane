//
//  AES.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 27/07/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CommonCrypto

public struct AES {

  // MARK: - Data

  public static func encrypt(_ data: Data, key: Data, keySize: Int = kCCKeySizeAES128) -> Data? {
    return perform(data, key: key, keySize: keySize, encrypting: true)
  }

  public static func decrypt(_ data: Data, key: Data, keySize: Int = kCCKeySizeAES128) -> Data? {
    return perform(data, key: key, keySize: keySize, encrypting: false)
  }

  // MARK: - String

  public static func encrypt(_ string: String, key: String, keySize: Int = kCCKeySizeAES128) -> String? {
    guard let data = string.data(using: String.Encoding.utf8),
      let keyData = key.data(using: String.Encoding.utf8) else { return nil }

    let encrypted = perform(data, key: keyData, keySize: keySize, encrypting: true)
    return encrypted?.base64EncodedString(options: .lineLength64Characters)
  }

  public static func decrypt(_ string: String, key: String, keySize: Int = kCCKeySizeAES128) -> String? {
    guard let data = Data(base64Encoded: string, options: .ignoreUnknownCharacters),
      let keyData = key.data(using: String.Encoding.utf8) else { return nil }

    guard let decrypted = perform(data, key: keyData, keySize: keySize, encrypting: false) else { return nil }
    return String(data: decrypted, encoding: String.Encoding.utf8)
  }

  // MARK: - Private
	
  fileprivate static func perform(_ data: Data, key: Data, keySize: Int = kCCKeySizeAES128, encrypting: Bool) -> Data? {
    guard let out = NSMutableData(length: data.count + kCCBlockSizeAES128) else { return nil }

    let hashData = Hash.SHA384(key)

    // kCCKeySizeAES128 by default
    var keyRange: Range<Int> = 0..<16
    var ivRange: Range<Int> = 16..<32

    switch keySize {
    case kCCKeySizeAES192:
      keyRange = 0..<24
      ivRange = 24..<40
    case kCCKeySizeAES256:
      keyRange = 0..<32
      ivRange = 32..<48
    default: ()
    }

    let hashKeyData = hashData.subdata(in: keyRange)
    let ivData = hashData.subdata(in: ivRange)

    let operation = encrypting ? kCCEncrypt : kCCDecrypt
    var dataOutMovedLength: size_t = 0

    let status = CCCrypt(
      CCOperation(operation),
      CCAlgorithm(kCCAlgorithmAES128),
      CCOptions(kCCOptionPKCS7Padding),
      (hashKeyData as NSData).bytes,
      keySize,
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
