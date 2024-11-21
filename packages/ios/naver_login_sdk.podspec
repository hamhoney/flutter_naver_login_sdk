#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint naver_login_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'naver_login_sdk'
  s.version          = '0.0.1'
  s.summary          = 'Flutter-Naver Login SDK'
  s.description      = <<-DESC
Flutter-Naver Login SDK
                       DESC
  s.homepage         = 'http://lagerstroemia.net'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'b3xlon9@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # NaverLogin iOS SDK
  s.dependency 'naveridlogin-sdk-ios', '~> 4.2.3'
  
  # AlamoFire
  s.dependency 'Alamofire', '~> 5.10.1'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'naver_login_sdk_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end