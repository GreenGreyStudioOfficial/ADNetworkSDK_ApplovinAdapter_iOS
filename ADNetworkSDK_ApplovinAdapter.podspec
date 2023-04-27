Pod::Spec.new do |s|
  s.name             = 'ADNetworkSDK_ApplovinAdapter'
  s.version          = '1.0.0'
  s.summary          = 'Mobidriven ADNetworkSDK Applovin Adapter'

  s.homepage         = 'https://github.com/GreenGreyStudioOfficial/ADNetworkSDK_ApplovinAdapter_iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Mobidriven' => 'info@mobidriven.com' }
  s.source           = { :git => 'https://github.com/GreenGreyStudioOfficial/ADNetworkSDK_ApplovinAdapter_iOS.git', :tag => "#{s.version}" }

  s.platform = :ios
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/**/*'

  spec.frameworks   = "Foundation", "UIKit"
  spec.requires_arc = true
  spec.static_framework = true
  spec.user_target_xcconfig = { 'ONLY_ACTIVE_ARCH' => 'YES' } 
  spec.dependency "AppLovinSDK", "~> 11.7.1"
  spec.dependency "ADNetworkSDK", "~> 1.0.0"
end
