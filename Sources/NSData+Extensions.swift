//
//  NSData+Extensions.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 08/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension Data {

    // MARK: - Hex String
    var hexString: String {
        var result = ""

        var bytes = [UInt8](repeating: 0, count: count)
        copyBytes(to: &bytes, count: count)

        for byte in bytes {
            result += String(format: "%02x", UInt(byte))
        }

        return result
    }


    // MARK: - Base64
    var base64: Data {
        return base64EncodedData(options: [])
    }

    var base64String: String {
        return base64EncodedString(options: [])
    }
}
