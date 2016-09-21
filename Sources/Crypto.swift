//
//  Crypto.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 08/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import CCommonCrypto

typealias DigestMethod = (_ data: UnsafeRawPointer,
  _ len: CC_LONG, _ md: UnsafeMutablePointer<UInt8>) -> UnsafeMutablePointer<UInt8>

struct Crypto {
  enum Method {
    case MD2, MD4, MD5, SHA1, SHA224, SHA256, SHA384, SHA512
  }

  let length: Int32
  let methodKind: Method
  let HMACAlgorithm: CCHmacAlgorithm?

  init(length: Int32, methodKind: Method, HMACAlgorithm: CCHmacAlgorithm?) {
    self.length = (length)
    self.methodKind = (methodKind)
    self.HMACAlgorithm = (HMACAlgorithm)
  }

  func method(data: UnsafeRawPointer, length: UInt32, buffer: inout [UInt8]) {
    switch methodKind {
    case .MD2: CC_MD2(data, length, &buffer)
    case .MD4: CC_MD4(data, length, &buffer)
    case .MD5: CC_MD5(data, length, &buffer)
    case .SHA1: CC_SHA1(data, length, &buffer)
    case .SHA224: CC_SHA224(data, length, &buffer)
    case .SHA256: CC_SHA256(data, length, &buffer)
    case .SHA384: CC_SHA384(data, length, &buffer)
    case .SHA512: CC_SHA512(data, length, &buffer)
    }
  }

  static let MD2 = Crypto(length: CC_MD2_DIGEST_LENGTH, methodKind: .MD2,
                          HMACAlgorithm: nil)
  static let MD4 = Crypto(length: CC_MD4_DIGEST_LENGTH, methodKind: .MD4,
                          HMACAlgorithm: nil)
  static let MD5 = Crypto(length: CC_MD5_DIGEST_LENGTH, methodKind: .MD5,
                          HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgMD5))
  static let SHA1 = Crypto(length: CC_SHA1_DIGEST_LENGTH, methodKind: .SHA1,
                           HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA1))
  static let SHA224 = Crypto(length: CC_SHA224_DIGEST_LENGTH, methodKind: .SHA224,
                             HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA224))
  static let SHA256 = Crypto(length: CC_SHA256_DIGEST_LENGTH, methodKind: .SHA256,
                             HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA256))
  static let SHA384 = Crypto(length: CC_SHA384_DIGEST_LENGTH, methodKind: .SHA384,
                             HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA384))
  static let SHA512 = Crypto(length: CC_SHA512_DIGEST_LENGTH, methodKind: .SHA512,
                             HMACAlgorithm: CCHmacAlgorithm(kCCHmacAlgSHA512))
}
