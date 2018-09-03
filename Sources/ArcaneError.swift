//
//  ArcaneError.swift
//  Arcane-iOS
//
//  Created by Frank on 2018/9/3.
//  Copyright © 2018 Fantageek. All rights reserved.
//

import Foundation

enum ArcaneError: Error {
    case wrongAlgorithm(Crypto)
    case nilKeyType(String)
    case nilValueType(String)
}

extension ArcaneError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongAlgorithm(let crypto):
            return "\(crypto.methodKind.type) has no algorithm"
        case .nilKeyType(let message):
            return "Key-\(message) is nil"
        case .nilValueType(let message):
            return "Value-\(message) is nil"
        }
        
    }
}
