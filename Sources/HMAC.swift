//
//  HMAC.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 08/05/16.
//  Copyright © 2016 Khoa Pham. All rights reserved.
//

import Foundation
import CCommonCrypto

public struct HMAC {

  // MARK: - NSData

  public static func MD5(data: NSData) -> NSData {
    return HMAC.hash(data, cryto: .MD5)
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

  static func hash(data: NSData, cryto: Crypto) -> NSData {
    fatalError()
  }
}
