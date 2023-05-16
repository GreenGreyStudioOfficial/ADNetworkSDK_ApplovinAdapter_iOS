//
//  ALMobidrivenCustomAdapter.h
//  AD_Demo_App
//
//  Created by Alexander Troitsky on 13.05.2023.
//

#import <Foundation/Foundation.h>
#import <AppLovinSDK/AppLovinSDK.h>
#import <ADNetworkSDK/ADNetworkSDK-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALMobidrivenCustomAdapter : ALMediationAdapter <MAInterstitialAdapter, MARewardedAdapter, ADNetworkSDKDelegate>

@end

NS_ASSUME_NONNULL_END
