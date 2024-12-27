//
//  ALMobidrivenCustomAdapter.m
//  AD_Demo_App
//
//  Created by Alexander Troitsky on 13.05.2023.
//

#import "ALMobidrivenCustomAdapter.h"

@interface ALMobidrivenCustomAdapter()
@property (nonatomic, weak) id<MAInterstitialAdapterDelegate> interstitialDelegate;
@property (nonatomic, weak) id<MARewardedAdapterDelegate> rewardedDelegate;
//@property (nonatomic) BOOL haveAdsToShow;

@end

@implementation ALMobidrivenCustomAdapter

BOOL haveAdsToShow = NO;

- (void)destroy {
    NSLog(@"----- ALMobidrivenCustomAdapter Adapter: destroy");
    self.interstitialDelegate = nil;
    self.rewardedDelegate = nil;
}

- (void)initializeWithParameters:(id<MAAdapterInitializationParameters>)parameters completionHandler:(void (^)(MAAdapterInitializationStatus, NSString * _Nullable))completionHandler {
    NSLog(@"----- ALMobidrivenCustomAdapter: initializeWithParameters");
    NSString *gameId = parameters.serverParameters[@"app_id"];
    if (gameId.length != 0) {
        //dispatch_async(dispatch_get_main_queue(), ^(void) {
            NSLog(@"gameId: %@", gameId);
            [ADNetworkSDK shared].debug = YES;
            [ADNetworkSDK.shared setupWithKey:gameId delegate:self];
            completionHandler(MAAdapterInitializationStatusInitializedSuccess, nil);
        //});
    }
    else {
        completionHandler(MAAdapterInitializationStatusInitializing, @"No Mobidriven AppID provided yet");
    }
    
}

- (NSString *)SDKVersion {
    return @"1.0.0";
}

- (NSString *)adapterVersion {
    return @"1.0.0";
}

#pragma mark - MAInterstitialAdapter methods
- (void)loadInterstitialAdForParameters:(nonnull id<MAAdapterResponseParameters>)parameters andNotify:(nonnull id<MAInterstitialAdapterDelegate>)delegate {
    NSLog(@"----- ALMobidrivenCustomAdapter: loadInterstitialAdForParameters");
    self.interstitialDelegate = delegate;
    ADNetworkSDK.shared.delegate = self;
    if (haveAdsToShow) {
        [self.interstitialDelegate didLoadInterstitialAd];
        //dispatch_async(dispatch_get_main_queue(), ^(void) {
        //    [ADNetworkSDK.shared show];
        //});
    }
    else {
        [ADNetworkSDK.shared loadAdWithRewarded:NO];
    }
}

- (void)showInterstitialAdForParameters:(nonnull id<MAAdapterResponseParameters>)parameters andNotify:(nonnull id<MAInterstitialAdapterDelegate>)delegate {
    NSLog(@"----- ALMobidrivenCustomAdapter: showInterstitialAdForParameters");
    self.interstitialDelegate = delegate;
    ADNetworkSDK.shared.delegate = self;
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [ADNetworkSDK.shared show];
    });
}

#pragma mark - MARewardedAdapter methods
- (void)loadRewardedAdForParameters:(nonnull id<MAAdapterResponseParameters>)parameters andNotify:(nonnull id<MARewardedAdapterDelegate>)delegate {
    NSLog(@"----- ALMobidrivenCustomAdapter: loadRewardedAdForParameters");
    self.rewardedDelegate = delegate;
    ADNetworkSDK.shared.delegate = self;
    if (haveAdsToShow) {
        [self.rewardedDelegate didLoadRewardedAd];
        //dispatch_async(dispatch_get_main_queue(), ^(void) {
        //    [ADNetworkSDK.shared show];
        //});
    }
    else {
        [ADNetworkSDK.shared loadAdWithRewarded:YES];
    }
}

- (void)showRewardedAdForParameters:(nonnull id<MAAdapterResponseParameters>)parameters andNotify:(nonnull id<MARewardedAdapterDelegate>)delegate {
    NSLog(@"----- ALMobidrivenCustomAdapter: showRewardedAdForParameters");
    self.rewardedDelegate = delegate;
    ADNetworkSDK.shared.delegate = self;
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [ADNetworkSDK.shared show];
    });
}

#pragma mark - Mobidrriven ADNetworkSDK

- (void)downloadCompleteWithId:(NSString * _Nonnull)id fileName:(NSString * _Nonnull)fileName {
    NSLog(@"----- ADNetworkSDK: downloadCompleteWithId: %@", fileName);
    if (self.interstitialDelegate != nil) {
        if ([self.interstitialDelegate respondsToSelector:@selector(didLoadInterstitialAd)]) {
            [self.interstitialDelegate didLoadInterstitialAd];
        }
    }
    if (self.rewardedDelegate != nil) {
        if ([self.rewardedDelegate respondsToSelector:@selector(didLoadRewardedAd)]) {
            [self.rewardedDelegate didLoadRewardedAd];
        }
    }
}

- (void)downloadFailedWithId:(NSString * _Nonnull)id error:(NSString * _Nonnull)error {
    NSLog(@"----- ADNetworkSDK: downloadFailedWithId: %@", error);
}

- (void)haveAdsToShowWithAvailable:(BOOL)available {
    NSLog(@"----- ADNetworkSDK: haveAdsToShowWithAvailable: %d", available);
    haveAdsToShow = available;
    
    if (self.interstitialDelegate != nil) {
        if ([self.interstitialDelegate respondsToSelector:@selector(didLoadInterstitialAd)]) {
            [self.interstitialDelegate didLoadInterstitialAd];
        }
    }
    if (self.rewardedDelegate != nil) {
        if ([self.rewardedDelegate respondsToSelector:@selector(didLoadRewardedAd)]) {
            [self.rewardedDelegate didLoadRewardedAd];
        }
    }
  
}

- (void)showClick {
    NSLog(@"----- ADNetworkSDK: showClick");
    if (self.interstitialDelegate != nil) {
        if ([self.interstitialDelegate respondsToSelector:@selector(didClickInterstitialAd)]) {
            [self.interstitialDelegate didClickInterstitialAd];
        }
    }
    if (self.rewardedDelegate != nil) {
        if ([self.rewardedDelegate respondsToSelector:@selector(didClickRewardedAd)]) {
            [self.rewardedDelegate didClickRewardedAd];
        }
    }
}

- (void)showClose {
    NSLog(@"----- ADNetworkSDK: showClose");
    if (self.interstitialDelegate != nil) {
        if ([self.interstitialDelegate respondsToSelector:@selector(didHideInterstitialAd)]) {
            [self.interstitialDelegate didHideInterstitialAd];
        }
    }
    if (self.rewardedDelegate != nil) {
        if ([self.rewardedDelegate respondsToSelector:@selector(didHideRewardedAd)]) {
            [self.rewardedDelegate didHideRewardedAd];
        }
    }
}

- (void)showCompleteWithId:(NSString * _Nullable)id rewarded:(BOOL)rewarded rewardRecieved:(BOOL)rewardRecieved {
    NSLog(@"----- ADNetworkSDK: showCompleteWithId: %@", id);
    /*
    if (self.rewardedDelegate != nil) {
        if ([self.rewardedDelegate respondsToSelector:@selector(didCompleteRewardedAdVideo)]) {
            [self.rewardedDelegate didCompleteRewardedAdVideo];
        }
    }
    */
}

- (void)showFailedWithError:(NSString * _Nonnull)error {
    NSLog(@"----- ADNetworkSDK: showFailedWithError: %@", error);
    if (self.interstitialDelegate != nil) {
        if ([self.interstitialDelegate respondsToSelector:@selector(didFailToDisplayInterstitialAdWithError:)]) {
            MAAdapterError *err = [MAAdapterError errorWithCode:0 errorString:error];
            [self.interstitialDelegate didFailToDisplayInterstitialAdWithError:err];
        }
    }
    if (self.rewardedDelegate != nil) {
        if ([self.rewardedDelegate respondsToSelector:@selector(didFailToDisplayRewardedAdWithError:)]) {
            MAAdapterError *err = [MAAdapterError errorWithCode:0 errorString:error];
            [self.rewardedDelegate didFailToDisplayRewardedAdWithError:err];
        }
    }
}

- (void)showStart {
    NSLog(@"----- ADNetworkSDK: showStart");
    if (self.interstitialDelegate != nil) {
        if ([self.interstitialDelegate respondsToSelector:@selector(didDisplayInterstitialAd)]) {
            [self.interstitialDelegate didDisplayInterstitialAd];
        }
    }
    if (self.rewardedDelegate != nil) {
        if ([self.rewardedDelegate respondsToSelector:@selector(didDisplayRewardedAd)]) {
            [self.rewardedDelegate didDisplayRewardedAd];
        }
    }
}

@end
