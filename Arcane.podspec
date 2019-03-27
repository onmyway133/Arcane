Pod::Spec.new do |s|
  s.name             = "Arcane"
  s.summary          = "CommonCrypto in Swift"
  s.version          = "2.1"
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
  s.watchos.deployment_target = '3.0'

  s.source_files = 'Sources/**/*.swift'

  s.swift_version = '5.0'
  s.swift_versions = ['4.2', '5.0']
end
