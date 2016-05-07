//
//  Tests.swift
//  CommonCryptoSwift
//
//  Created by Khoa Pham on 07/05/16.
//  Copyright © 2016 Khoa Pham. All rights reserved.
//

import XCTest
import CommonCryptoSwift

class Tests: XCTestCase {

  func testHash() {
    let string = "https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg"

    XCTAssertEqual(Hash.MD2(string), "e4a410bf8a43197e67a01d717bbf3557")
    XCTAssertEqual(Hash.MD4(string), "b263c99c66fd5703b894c020b224f71e")
    XCTAssertEqual(Hash.MD5(string), "0dfb10e8d2ae771b3b3ed4544139644e")

    XCTAssertEqual(Hash.SHA1(string), "cd99bfa31d38bb53850196b8f1daca692231def5")
    XCTAssertEqual(Hash.SHA224(string), "b0caf544bc75698e1efe4d55acf014ddb6ab3b5b14d312e1a5fe42d3")
    XCTAssertEqual(Hash.SHA256(string), "cb051d58a60b9581ff4c7ba63da07f9170f61bfbebab4a39898432ec970c3754")
    XCTAssertEqual(Hash.SHA384(string), "ee999f4e722bdab4534a4c3b9d33a13e37ab4bf227348d7218ef32f7483ee09f05f5f15e69e09d7d53dec46d4df16275")
    XCTAssertEqual(Hash.SHA512(string), "13416866022ace1b3392c0d7a7fb1e311612d3e30e9bafa9045ed9cdcd14ea4c31fb3b18d716c44ccecf8c18be5c063a0883bbc60f964ce002890fb628cf35c7")
  }

  func testHMAC() {
    let string = "https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg"
    let key = "google"

    XCTAssertEqual(HMAC.MD5(string, key: key), "419337f8da2e81cdf12dcb9b8e4cd76c")
    XCTAssertEqual(HMAC.SHA1(string, key: key), "5f4474c8872d73c1490241ab015f6c672c6dcdc8")
    XCTAssertEqual(HMAC.SHA224(string, key: key), "82a903faa4f93c528f490c699c9bfef0c0ef8a3498dd677cfab0a71e")
    XCTAssertEqual(HMAC.SHA256(string, key: key), "a8e314bf001c5ea640c374582f5a27d9d29a39cb1b1c729748bad5365dfb0632")
    XCTAssertEqual(HMAC.SHA384(string, key: key), "afa2026322d2843e564a9d88e2a03a5a4f75581386217052d952bdda7a7af6a48ba4e0b927229cdec46cdf7e5ffa9ee3")
    XCTAssertEqual(HMAC.SHA512(string, key: key), "d75af2a8f76dd22b3e7a52f84593e3c9d56065a675f5e96ecf3e1354d6dba05f357418fbfbd3af0491e69f548bb4200600d139d601741c6c9eb37952e2e38d7a")
  }
}
