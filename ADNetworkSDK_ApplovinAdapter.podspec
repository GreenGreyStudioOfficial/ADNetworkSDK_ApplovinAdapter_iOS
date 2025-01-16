Pod::Spec.new do |s|
  s.name             = 'ADNetworkSDK_ApplovinAdapter'
  s.version          = '1.0.4'
  s.summary          = 'Mobidriven ADNetworkSDK Applovin Adapter'

  s.homepage         = 'https://github.com/GreenGreyStudioOfficial/ADNetworkSDK_ApplovinAdapter_iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Mobidriven' => 'info@mobidriven.com' }
  s.source           = { :git => 'https://github.com/GreenGreyStudioOfficial/ADNetworkSDK_ApplovinAdapter_iOS.git', :tag => "#{s.version}" }

  s.platform = :ios
  s.ios.deployment_target = '13.0'
  s.source_files = 'Sources/**/*'

  s.frameworks   = "Foundation", "UIKit"
  s.requires_arc = true
  s.static_framework = true
  s.user_target_xcconfig = { 'ONLY_ACTIVE_ARCH' => 'YES' } 
  s.dependency "AppLovinSDK"
  s.dependency "ADNetworkSDK"
end
