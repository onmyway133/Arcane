Pod::Spec.new do |s|
  s.name             = "Arcane"
  s.summary          = "CommonCrypto in Swift"
  s.version          = "2.0"
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
  s.swift_version = '4.2'

  s.script_phase = {
	:name => 'CommonCrypto',
	:script => 'COMMON_CRYPTO_DIR="${SDKROOT}/usr/include/CommonCrypto"
	if [ -f "${COMMON_CRYPTO_DIR}/module.modulemap" ]
		then
		echo "CommonCrypto already exists, skipping"
		else
		# This if-statement means we will only run the main script if the
		# CommonCrypto.framework directory doesn not exist because otherwise
		# the rest of the script causes a full recompile for anything
		# where CommonCrypto is a dependency
		# Do a "Clean Build Folder" to remove this directory and trigger
		# the rest of the script to run
		FRAMEWORK_DIR="${BUILT_PRODUCTS_DIR}/CommonCrypto.framework"
		if [ -d "${FRAMEWORK_DIR}" ]; then
			echo "${FRAMEWORK_DIR} already exists, so skipping the rest of the script."
			exit 0
		fi
		mkdir -p "${FRAMEWORK_DIR}/Modules"
		echo "module CommonCrypto [system] {
			header \"${SDKROOT}/usr/include/CommonCrypto/CommonCrypto.h\"
			export *
		}" >> "${FRAMEWORK_DIR}/Modules/module.modulemap"
		ln -sf "${SDKROOT}/usr/include/CommonCrypto" "${FRAMEWORK_DIR}/Headers"
	fi',
	:execution_position => :before_compile
  }
end
