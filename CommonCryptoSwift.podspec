Pod::Spec.new do |s|
  s.name             = "CommonCryptoSwift"
  s.summary          = "CommonCrypto in Swift"
  s.version          = "0.1.0"
  s.homepage         = "https://github.com/onmyway133/CommonCrypto.swift"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/CommonCrypto.swift.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.2'

  s.requires_arc = true
  s.source_files = 'Sources/**/*.swift'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2', 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/CommonCryptoSwift/Sources/CCommonCrypto' }
  s.preserve_paths = 'Sources/CCommonCrypto/module.modulemap'

end
