# Arcane
CommonCrypto in Swift

[![CI Status](http://img.shields.io/travis/onmyway133/Arcane.svg?style=flat)](https://travis-ci.org/onmyway133/Arcane)
[![Version](https://img.shields.io/cocoapods/v/Arcane.svg?style=flat)](http://cocoadocs.org/docsets/Arcane)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Arcane.svg?style=flat)](http://cocoadocs.org/docsets/Arcane)
[![Platform](https://img.shields.io/cocoapods/p/Arcane.svg?style=flat)](http://cocoadocs.org/docsets/Arcane)
<img src="https://img.shields.io/badge/%20in-swift%204.0-orange.svg">

![](Screenshots/Arcane.png)

## Description

Read my answer here [Importing CommonCrypto in a Swift framework](http://stackoverflow.com/a/37125785/1418457)

## Features

- Work on NSData, String
- Message Digest, SHA, HMAC, Base64
- Hash Algorithm: MD2, MD4, MD5, SHA1, SHA256, SHA224, SHA384, SHA512

### Hash

```swift
Hash.MD5("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg") // 0dfb10e8d2ae771b3b3ed4544139644e
Hash.SHA246("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg") // cb051d58a60b9581ff4c7ba63da07f9170f61bfbebab4a39898432ec970c3754
```

### HMAC

```swift
HMAC.SHA1("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg", key: "google") // 5f4474c8872d73c1490241ab015f6c672c6dcdc8
```

### Base64

```swift
Base64.SHA1("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg", key: "google") // X0R0yIctc8FJAkGrAV9sZyxtzcg=
```

### AES

```swift
let _ = AES.encrypt("string", key: "secret")
let _ = AES.decrypt(data, key: keyData)
```


### Obfuscator

```swift
let obfuscator = Obfuscator(value: "").a.b.c.d.e.n1.n2.X.Y.Z // "abcde12XYZ"
```

## Installation

**Arcane** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Arcane'
```

**Arcane** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "onmyway133/Arcane"
```

## Author

Khoa Pham, onmyway133@gmail.com

## Contributing

We would love you to contribute to **Arcane**, check the [CONTRIBUTING](https://github.com/onmyway133/Arcane/blob/master/CONTRIBUTING.md) file for more info.

## License

**Arcane** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/Arcane/blob/master/LICENSE.md) file for more info.
