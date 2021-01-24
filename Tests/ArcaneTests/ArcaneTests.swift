import XCTest
@testable import Arcane

final class ArcaneTests: XCTestCase {
    static var allTests = [
        ("testExample", testExample),
    ]

    func testExample() {}
    
    private let string = "https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg"
    private let key = "google"

    func testHashWithString() {
        XCTAssertEqual(Hash.MD2(string), "e4a410bf8a43197e67a01d717bbf3557")
        XCTAssertEqual(Hash.MD4(string), "b263c99c66fd5703b894c020b224f71e")
        XCTAssertEqual(Hash.MD5(string), "0dfb10e8d2ae771b3b3ed4544139644e")

        XCTAssertEqual(Hash.SHA1(string), "cd99bfa31d38bb53850196b8f1daca692231def5")
        XCTAssertEqual(Hash.SHA224(string), "b0caf544bc75698e1efe4d55acf014ddb6ab3b5b14d312e1a5fe42d3")
        XCTAssertEqual(Hash.SHA256(string), "cb051d58a60b9581ff4c7ba63da07f9170f61bfbebab4a39898432ec970c3754")
        XCTAssertEqual(Hash.SHA384(string), "ee999f4e722bdab4534a4c3b9d33a13e37ab4bf227348d7218ef32f7483ee09f05f5f15e69e09d7d53dec46d4df16275")
        XCTAssertEqual(Hash.SHA512(string), "13416866022ace1b3392c0d7a7fb1e311612d3e30e9bafa9045ed9cdcd14ea4c31fb3b18d716c44ccecf8c18be5c063a0883bbc60f964ce002890fb628cf35c7")
    }

    func testHashWithData() {
        XCTAssertEqual(Hash.SHA384(string.data(using: String.Encoding.utf8)!).count, 48)
    }

    func testBase64WithString() {
        XCTAssertEqual(Base64.MD2(string), "5KQQv4pDGX5noB1xe781Vw==")
        XCTAssertEqual(Base64.MD4(string), "smPJnGb9VwO4lMAgsiT3Hg==")
        XCTAssertEqual(Base64.MD5(string), "DfsQ6NKudxs7PtRUQTlkTg==")

        XCTAssertEqual(Base64.SHA1(string), "zZm/ox04u1OFAZa48drKaSIx3vU=")
        XCTAssertEqual(Base64.SHA224(string), "sMr1RLx1aY4e/k1VrPAU3barO1sU0xLhpf5C0w==")
        XCTAssertEqual(Base64.SHA256(string), "ywUdWKYLlYH/THumPaB/kXD2G/vrq0o5iYQy7JcMN1Q=")
        XCTAssertEqual(Base64.SHA384(string), "7pmfTnIr2rRTSkw7nTOhPjerS/InNI1yGO8y90g+4J8F9fFeaeCdfVPexG1N8WJ1")
        XCTAssertEqual(Base64.SHA512(string), "E0FoZgIqzhszksDXp/seMRYS0+MOm6+pBF7Zzc0U6kwx+zsY1xbETM7PjBi+XAY6CIO7xg+WTOACiQ+2KM81xw==")
    }

    func testBase64WithData() {
        XCTAssertEqual(Base64.SHA384(string.data(using: String.Encoding.utf8)!).count, 64)
    }

    func testHMAC() {
        XCTAssertEqual(HMAC.MD5(string, key: key), "419337f8da2e81cdf12dcb9b8e4cd76c")
        XCTAssertEqual(HMAC.SHA1(string, key: key), "5f4474c8872d73c1490241ab015f6c672c6dcdc8")
        XCTAssertEqual(HMAC.SHA224(string, key: key), "82a903faa4f93c528f490c699c9bfef0c0ef8a3498dd677cfab0a71e")
        XCTAssertEqual(HMAC.SHA256(string, key: key), "a8e314bf001c5ea640c374582f5a27d9d29a39cb1b1c729748bad5365dfb0632")
        XCTAssertEqual(HMAC.SHA384(string, key: key), "afa2026322d2843e564a9d88e2a03a5a4f75581386217052d952bdda7a7af6a48ba4e0b927229cdec46cdf7e5ffa9ee3")
        XCTAssertEqual(HMAC.SHA512(string, key: key), "d75af2a8f76dd22b3e7a52f84593e3c9d56065a675f5e96ecf3e1354d6dba05f357418fbfbd3af0491e69f548bb4200600d139d601741c6c9eb37952e2e38d7a")
    }

    func testHMACWithDigest() {
        XCTAssertEqual(HMAC.MD5(string, key: key, digest: .base64), "QZM3+Nougc3xLcubjkzXbA==")
        XCTAssertEqual(HMAC.SHA1(string, key: key, digest: .base64), "X0R0yIctc8FJAkGrAV9sZyxtzcg=")
        XCTAssertEqual(HMAC.SHA224(string, key: key, digest: .base64), "gqkD+qT5PFKPSQxpnJv+8MDvijSY3Wd8+rCnHg==")
        XCTAssertEqual(HMAC.SHA256(string, key: key, digest: .base64), "qOMUvwAcXqZAw3RYL1on2dKaOcsbHHKXSLrVNl37BjI=")
        XCTAssertEqual(HMAC.SHA384(string, key: key, digest: .base64), "r6ICYyLShD5WSp2I4qA6Wk91WBOGIXBS2VK92np69qSLpOC5JyKc3sRs335f+p7j")
        XCTAssertEqual(HMAC.SHA512(string, key: key, digest: .base64), "11ryqPdt0is+elL4RZPjydVgZaZ19eluzz4TVNbboF81dBj7+9OvBJHmn1SLtCAGANE51gF0HGyes3lS4uONeg==")
    }

    func testAESWithString() {
        let encrypted = AES.encrypt(string, key: key)
        let decrypted = AES.decrypt(encrypted!, key: key)

        XCTAssertEqual(decrypted, string)
    }

    func testAESWithData() {
        let data = AES.encrypt(
            string.data(using: String.Encoding.utf8)!,
            key: key.data(using: String.Encoding.utf8)!
        )
        let decrypted = AES.decrypt(
            data!,
            key: key.data(using: String.Encoding.utf8)!
        )!

        XCTAssertEqual(String(data: decrypted, encoding: String.Encoding.utf8), string)
    }
}
