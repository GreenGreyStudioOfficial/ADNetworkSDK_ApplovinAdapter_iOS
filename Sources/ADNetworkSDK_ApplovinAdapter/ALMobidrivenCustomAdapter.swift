//
//  ALMobidrivenCustomAdapter.swift
//  AD_Demo_App
//
//  Created by Alexander Troitsky on 15.11.2022.
//

import Foundation
import AppLovinSDK
import ADNetworkSDK

@objc(ALMobidrivenCustomAdapter)
public class ALMobidrivenCustomAdapter:ALMediationAdapter {
    
    var interstitialAdapter:ALMobidrivenInterstitialAdapter?
    var rewardedAdapter:ALMobidrivenRewardedAdapter?
        
    var retryAttempt = 0.0
                
    @objc public override func initialize(with params: MAAdapterInitializationParameters, completionHandler: @escaping (MAAdapterInitializationStatus, String?) -> Void) {
        print("ALMobidrivenCustomAdapter initialize")
        if let gameId = params.customParameters["gameId"] as? String {
            print("GAME ID: \(gameId)")
            DispatchQueue.main.async {
                _ = ADNetworkSDK.shared
                ADNetworkSDK.shared.setKey(gameId)
            }
            completionHandler(.initializedSuccess, nil)
        }
        else {
            completionHandler(.initializedFailure, nil)
        }
    }
    
    public override func destroy() {
        print("ALMobidrivenCustomAdapter destroy adapter")
        interstitialAdapter = nil
        rewardedAdapter = nil
    }
    
    deinit {
        destroy()
    }
    
    public override var adapterVersion: String {
        return "1.0"
    }
    
    public override var sdkVersion: String {
        return ADNetworkSDK.shared.version()
    }
       
}

// MARK: MAInterstitialAdapter methods
@objc extension ALMobidrivenCustomAdapter: MAInterstitialAdapter {
    
    public func loadInterstitialAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MAInterstitialAdapterDelegate) {
        //interstitialAdapter = ALMobidrivenInterstitialAdapter()
        //interstitialAdapter?.loadInterstitialAd(for: parameters, andNotify: delegate)
        DispatchQueue.main.async {
            ADNetworkSDK.shared.load(rewarded: false, mraid: false)
        }
    }
    
    public func showInterstitialAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MAInterstitialAdapterDelegate) {
        //interstitialAdapter?.showInterstitialAd(for: parameters, andNotify: delegate)
        
    }
}

// MARK: MARewardedAdapter methods
@objc extension ALMobidrivenCustomAdapter: MARewardedAdapter {
    public func loadRewardedAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MARewardedAdapterDelegate) {
        //rewardedAdapter = ALMobidrivenRewardedAdapter()
        //rewardedAdapter?.loadRewardedAd(for: parameters, andNotify: delegate)
        DispatchQueue.main.async {
            ADNetworkSDK.shared.load(rewarded: true, mraid: false)
        }
    }
    
    public func showRewardedAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MARewardedAdapterDelegate) {
        //rewardedAdapter?.showRewardedAd(for: parameters, andNotify: delegate)
    }
    
    
}
