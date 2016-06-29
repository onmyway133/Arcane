# CommonCrypto.swift
CommonCrypto in Swift

[![CI Status](http://img.shields.io/travis/onmyway133/CommonCryptoSwift.svg?style=flat)](https://travis-ci.org/onmyway133/CommonCryptoSwift)
[![Version](https://img.shields.io/cocoapods/v/CommonCryptoSwift.svg?style=flat)](http://cocoadocs.org/docsets/CommonCryptoSwift)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/CommonCryptoSwift.svg?style=flat)](http://cocoadocs.org/docsets/CommonCryptoSwift)
[![Platform](https://img.shields.io/cocoapods/p/CommonCryptoSwift.svg?style=flat)](http://cocoadocs.org/docsets/CommonCryptoSwift)

![](Screenshots/Banner.png)

## Features

- Work on NSData, String
- Message Digest, SHA, HMAC
- Hash Algorithm: MD2, MD4, MD5, SHA1, SHA256, SHA224, SHA384, SHA512

```swift
Hash.MD5("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg") // 0dfb10e8d2ae771b3b3ed4544139644e
Hash.SHA246("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg") // cb051d58a60b9581ff4c7ba63da07f9170f61bfbebab4a39898432ec970c3754
HMAC.SHA1("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg", key: "google") // 5f4474c8872d73c1490241ab015f6c672c6dcdc8
```

## Installation

**CommonCryptoSwift** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CommonCryptoSwift', git: 'https://github.com/onmyway133/CommonCrypto.swift'
```

**CommonCryptoSwift** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "onmyway133/CommonCrypto.swift"
```

## Author

Khoa Pham, onmyway133@gmail.com

## Contributing

We would love you to contribute to **CommonCryptoSwift**, check the [CONTRIBUTING](https://github.com/onmyway133/CommonCryptoSwift/blob/master/CONTRIBUTING.md) file for more info.

## License

**CommonCryptoSwift** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/CommonCryptoSwift/blob/master/LICENSE.md) file for more info.
