Pod::Spec.new do |s|
  s.name             = "Arcane"
  s.summary          = "CommonCrypto in Swift"
  s.version          = "0.2.0"
  s.homepage         = "https://github.com/onmyway133/Arcane"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/Arcane.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.2'

  s.requires_arc = true
  s.source_files = 'Sources/**/*.swift'
  s.xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/Arcane/Sources/CCommonCrypto' }
  s.preserve_paths = 'Sources/CCommonCrypto/module.modulemap'

end
