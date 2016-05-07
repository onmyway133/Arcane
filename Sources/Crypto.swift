//
//  Crypto.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 08/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CCommonCrypto

typealias DigestMethod = (data: UnsafePointer<Void>,
  len: CC_LONG, md: UnsafeMutablePointer<UInt8>) -> UnsafeMutablePointer<UInt8>

struct Crypto {
  let length: Int32
  let method: DigestMethod
  let HMACAlgorithm: CCHmacAlgorithm?

  static let MD2 = Crypto(length: CC_MD2_DIGEST_LENGTH, method: CC_MD2,
                          HMACAlgorithm: nil)
  static let MD4 = Crypto(length: CC_MD4_DIGEST_LENGTH, method: CC_MD4,
                          HMACAlgorithm: nil)
  static let MD5 = Crypto(length: CC_MD5_DIGEST_LENGTH, method: CC_MD5,
                          HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgMD5))
  static let SHA1 = Crypto(length: CC_SHA1_DIGEST_LENGTH, method: CC_SHA1,
                           HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA1))
  static let SHA224 = Crypto(length: CC_SHA224_DIGEST_LENGTH, method: CC_SHA224,
                             HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA224))
  static let SHA256 = Crypto(length: CC_SHA256_DIGEST_LENGTH, method: CC_SHA256,
                             HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA256))
  static let SHA384 = Crypto(length: CC_SHA384_DIGEST_LENGTH, method: CC_SHA384,
                             HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA384))
  static let SHA512 = Crypto(length: CC_SHA512_DIGEST_LENGTH, method: CC_SHA512,
                             HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA512))
}
