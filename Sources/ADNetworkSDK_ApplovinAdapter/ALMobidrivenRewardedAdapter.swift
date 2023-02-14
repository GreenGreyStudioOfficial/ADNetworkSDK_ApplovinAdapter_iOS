//
//  ALMobidrivenRewardedAdapter.swift
//  AD_Demo_App
//
//  Created by Alexander Troitsky on 01.02.2023.
//

import Foundation
import AppLovinSDK
import ADNetworkSDK

final class ALMobidrivenRewardedAdapter:NSObject {
    
    weak var delegate:MARewardedAdapterDelegate?
    
    func loadRewardedAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MARewardedAdapterDelegate) {
        self.delegate = delegate
        
        // print("ADAPTER: ALMobidrivenCustomAdapter loadInterstitialAd")
        // print("adUnitIdentifier : \(parameters.adUnitIdentifier)")
        // print("thirdPartyAdPlacementIdentifier : \(parameters.thirdPartyAdPlacementIdentifier)")
        
        ADNetworkSDK.shared.load(rewarded: true)
    }
    
    func showRewardedAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MARewardedAdapterDelegate) {
        self.delegate = delegate
    }

}

extension ALMobidrivenRewardedAdapter:MARewardedAdapterDelegate {
    func didLoadRewardedAd() {
        // print("RA :: didLoadRewardedAd")
    }
    
    func didLoadRewardedAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("RA :: didLoadRewardedAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    func didFailToLoadRewardedAdWithError(_ adapterError: MAAdapterError) {
        // print("RA :: didFailToLoadRewardedAdWithError: \(adapterError)")
    }
    
    func didDisplayRewardedAd() {
        // print("RA :: didDisplayRewardedAd")
    }
    
    func didDisplayRewardedAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("RA :: didDisplayRewardedAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    func didFailToDisplayRewardedAdWithError(_ adapterError: MAAdapterError) {
        // print("RA :: didFailToDisplayRewardedAdWithError: \(adapterError)")
    }
    
    func didClickRewardedAd() {
        // print("RA :: didClickRewardedAd")
    }
    
    func didClickRewardedAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("RA :: didClickRewardedAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    func didHideRewardedAd() {
        // print("RA :: didHideRewardedAd")
    }
    
    func didHideRewardedAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("RA :: didHideRewardedAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    func didStartRewardedAdVideo() {
        // print("RA :: didStartRewardedAdVideo")
    }
    
    func didCompleteRewardedAdVideo() {
        // print("RA :: didCompleteRewardedAdVideo")
    }
    
    func didRewardUser(with reward: MAReward) {
        // print("RA :: didRewardUser, reward: \(reward)")
    }
    
    
}
