//
//  ALMobidrivenInterstitialAdapter.swift
//  AD_Demo_App
//
//  Created by Alexander Troitsky on 01.02.2023.
//

import Foundation
import AppLovinSDK
import ADNetworkSDK

final class ALMobidrivenInterstitialAdapter:NSObject {
    
    weak var delegate:MAInterstitialAdapterDelegate?
    
    func loadInterstitialAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MAInterstitialAdapterDelegate) {
        self.delegate = delegate
        
        //print("ADAPTER: ALMobidrivenCustomAdapter loadInterstitialAd")
        //print("adUnitIdentifier : \(parameters.adUnitIdentifier)")
        
        DispatchQueue.main.async {
            ADNetworkSDK.shared.load(rewarded: false, mraid: false)
        }
    }
    
    func showInterstitialAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MAInterstitialAdapterDelegate) {
        self.delegate = delegate
    }

}

extension ALMobidrivenInterstitialAdapter:MAInterstitialAdapterDelegate {
    func didLoadInterstitialAd() {
        // print("IA :: didLoadInterstitialAd")
    }
    
    func didLoadInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("IA :: didLoadInterstitialAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    func didFailToLoadInterstitialAdWithError(_ adapterError: MAAdapterError) {
        // print("IA :: didFailToLoadInterstitialAdWithError: \(adapterError)")
    }
    
    func didDisplayInterstitialAd() {
        // print("IA :: didDisplayInterstitialAd")
    }
    
    func didDisplayInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("IA :: didDisplayInterstitialAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    func didClickInterstitialAd() {
        // print("IA :: didClickInterstitialAd")
    }
    
    func didClickInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("IA :: didClickInterstitialAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    func didHideInterstitialAd() {
        // print("IA :: didHideInterstitialAd")
    }
    
    func didHideInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        // print("IA :: didHideInterstitialAd withExtraInfo: \(String(describing: extraInfo))")
    }
    
    func didFailToDisplayInterstitialAdWithError(_ adapterError: MAAdapterError) {
        // print("IA :: didFailToDisplayInterstitialAdWithError: \(adapterError)")
    }
    
    
}
