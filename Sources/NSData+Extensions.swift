//
//  NSData+Extensions.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 08/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension NSData {
  
  var hexString: String {
    var result = ""

    var bytes = [UInt8](count: length, repeatedValue: 0)
    getBytes(&bytes, length: length)

    for byte in bytes {
      result += String(format: "%02x", UInt(byte))
    }

    return result
  }
}
