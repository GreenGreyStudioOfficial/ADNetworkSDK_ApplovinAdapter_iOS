//
//  ALMobidrivenInterstitialAdapter.swift
//  AD_Demo_App
//
//  Created by Alexander Troitsky on 01.02.2023.
//

import Foundation
import AppLovinSDK
import ADNetworkSDK

public class ALMobidrivenInterstitialAdapter:NSObject {
    
    weak var delegate:MAInterstitialAdapterDelegate?
    
    public func loadInterstitialAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MAInterstitialAdapterDelegate) {
        self.delegate = delegate
        
        //print("ADAPTER: ALMobidrivenCustomAdapter loadInterstitialAd")
        //print("adUnitIdentifier : \(parameters.adUnitIdentifier)")
        
        DispatchQueue.main.async {
            ADNetworkSDK.shared.load(rewarded: false, mraid: false)
        }
    }
    
    public func showInterstitialAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MAInterstitialAdapterDelegate) {
        self.delegate = delegate
    }

}

extension ALMobidrivenInterstitialAdapter:MAInterstitialAdapterDelegate {
    public func didLoadInterstitialAd() {
        // print("IA :: didLoadInterstitialAd")
    }
    
    public func didLoadInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("IA :: didLoadInterstitialAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    public func didFailToLoadInterstitialAdWithError(_ adapterError: MAAdapterError) {
        // print("IA :: didFailToLoadInterstitialAdWithError: \(adapterError)")
    }
    
    public func didDisplayInterstitialAd() {
        // print("IA :: didDisplayInterstitialAd")
    }
    
    public func didDisplayInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("IA :: didDisplayInterstitialAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    public func didClickInterstitialAd() {
        // print("IA :: didClickInterstitialAd")
    }
    
    public func didClickInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("IA :: didClickInterstitialAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    public func didHideInterstitialAd() {
        // print("IA :: didHideInterstitialAd")
    }
    
    public func didHideInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("IA :: didHideInterstitialAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    public func didFailToDisplayInterstitialAdWithError(_ adapterError: MAAdapterError) {
        // print("IA :: didFailToDisplayInterstitialAdWithError: \(adapterError)")
    }
    
    
}
