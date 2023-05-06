//
//  ALMobidrivenRewardedAdapter.swift
//  AD_Demo_App
//
//  Created by Alexander Troitsky on 01.02.2023.
//

import Foundation
import AppLovinSDK
import ADNetworkSDK

public class ALMobidrivenRewardedAdapter:NSObject {
    
    weak var delegate:MARewardedAdapterDelegate?
    
    public func loadRewardedAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MARewardedAdapterDelegate) {
        self.delegate = delegate
        
        // print("ADAPTER: ALMobidrivenCustomAdapter loadInterstitialAd")
        // print("adUnitIdentifier : \(parameters.adUnitIdentifier)")
        // print("thirdPartyAdPlacementIdentifier : \(parameters.thirdPartyAdPlacementIdentifier)")
        
        ADNetworkSDK.shared.load(rewarded: true)
    }
    
    public func showRewardedAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MARewardedAdapterDelegate) {
        self.delegate = delegate
    }

}

extension ALMobidrivenRewardedAdapter:MARewardedAdapterDelegate {
    public func didFailToDisplayRewardedAdWithError(_ adapterError: MAAdapterError, extraInfo: [String : Any]?) {
        // print("RA :: didFailToDisplayRewardedAdWithError: \(adapterError)")
    }
    
    public func didRewardUser(with reward: MAReward, extraInfo: [String : Any]?) {
        // print("RA :: didRewardUser withExtraInfo: \(String(describing: extraInfo))")
    }
    
    public func didLoadRewardedAd() {
        // print("RA :: didLoadRewardedAd")
    }
    
    public func didLoadRewardedAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("RA :: didLoadRewardedAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    public func didFailToLoadRewardedAdWithError(_ adapterError: MAAdapterError) {
        // print("RA :: didFailToLoadRewardedAdWithError: \(adapterError)")
    }
    
    public func didDisplayRewardedAd() {
        // print("RA :: didDisplayRewardedAd")
    }
    
    public func didDisplayRewardedAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("RA :: didDisplayRewardedAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    public func didFailToDisplayRewardedAdWithError(_ adapterError: MAAdapterError) {
        // print("RA :: didFailToDisplayRewardedAdWithError: \(adapterError)")
    }
    
    public func didClickRewardedAd() {
        // print("RA :: didClickRewardedAd")
    }
    
    public func didClickRewardedAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("RA :: didClickRewardedAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    public func didHideRewardedAd() {
        // print("RA :: didHideRewardedAd")
    }
    
    public func didHideRewardedAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("RA :: didHideRewardedAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    public func didStartRewardedAdVideo() {
        // print("RA :: didStartRewardedAdVideo")
    }
    
    public func didCompleteRewardedAdVideo() {
        // print("RA :: didCompleteRewardedAdVideo")
    }
    
    public func didRewardUser(with reward: MAReward) {
        // print("RA :: didRewardUser, reward: \(reward)")
    }
    
    
}
