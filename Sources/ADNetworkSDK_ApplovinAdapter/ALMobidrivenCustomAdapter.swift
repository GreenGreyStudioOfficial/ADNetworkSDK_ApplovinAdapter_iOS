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
    
    func loadInterstitialAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MAInterstitialAdapterDelegate) {
        //interstitialAdapter = ALMobidrivenInterstitialAdapter()
        //interstitialAdapter?.loadInterstitialAd(for: parameters, andNotify: delegate)
        DispatchQueue.main.async {
            ADNetworkSDK.shared.load(rewarded: false, mraid: false)
        }
    }
    
    func showInterstitialAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MAInterstitialAdapterDelegate) {
        //interstitialAdapter?.showInterstitialAd(for: parameters, andNotify: delegate)
        
    }
}

// MARK: MARewardedAdapter methods
@objc extension ALMobidrivenCustomAdapter: MARewardedAdapter {
    func loadRewardedAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MARewardedAdapterDelegate) {
        //rewardedAdapter = ALMobidrivenRewardedAdapter()
        //rewardedAdapter?.loadRewardedAd(for: parameters, andNotify: delegate)
        DispatchQueue.main.async {
            ADNetworkSDK.shared.load(rewarded: true, mraid: false)
        }
    }
    
    func showRewardedAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MARewardedAdapterDelegate) {
        //rewardedAdapter?.showRewardedAd(for: parameters, andNotify: delegate)
    }
    
    
}

/*
// MARK: MobidrivenSDK methods
@objc extension ALMobidrivenCustomAdapter:ADNetworkSDKDelegate {
    
    func haveAdsToShow(available:Bool) {
        if available {
            log("[APP INFO] Есть загруженная реклама")
            DispatchQueue.main.async {
                ADNetworkSDK.shared.show()
            }
        }
        else {
            log("[APP INFO] Нет загруженной рекламы")
            ADNetworkSDK.shared.load(rewarded: false)
        }
    }
    
    func downloadComplete(id: String, fileName:String) {
        log("[APP INFO] Загружена реклама: \(id), видео: \(fileName)")
        
        //self.interstitialAdapter?.didLoadInterstitialAd()
        DispatchQueue.main.async {
            ADNetworkSDK.shared.show()
        }
    }
    
    func downloadFailed(id: String, error: String) {
        log("[APP ERROR] Не удалось загрузить рекламу: \(error)")
        
        let err:MAAdapterError = MAAdapterError(code: 0, errorString: error)
        self.interstitialAdapter?.didFailToLoadInterstitialAdWithError(err)
    }
    
    func showStart() {
        log("[APP INFO] Начало показа рекламы")
        
        self.interstitialAdapter?.didDisplayInterstitialAd()
    }
    
    func showClose() {
        log("[APP INFO] Экран показа рекламы закрыт")
        
        self.interstitialAdapter?.didHideInterstitialAd()
    }
    
    func showComplete(id: String?, rewarded: Bool, rewardRecieved: Bool) {
        var message = rewarded ? "Показ рекламы с вознаграждением завершен, id: \(id ?? "")" : "Показ рекламы завершен, id: \(id ?? "")"
        let rewardRecievedMessage = rewardRecieved ? "Вознаграждение получено." : "Вознаграждение не получено."
        if rewarded {
            message = message + ". " + rewardRecievedMessage
        }
        
        log("[APP INFO] " + message)
    }
    
    func showFailed(error: String) {
        log("[APP INFO] Ошибка показа рекламы: \(error)")
        
        let err:MAAdapterError = MAAdapterError(code: 0, errorString: error)
        self.interstitialAdapter?.didFailToDisplayInterstitialAdWithError(err)
    }
    
    func log(_ message:String) {
        print("ADAPTER :: \(message)")
    }
}


*/











/*
@objc extension ALMobidrivenCustomAdapter: MAInterstitialAdapterDelegate {
    func didLoadInterstitialAd() {
        print("XXXXX didLoadInterstitialAd")
    }
    
    func didLoadInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        
    }
    
    func didFailToLoadInterstitialAdWithError(_ adapterError: MAAdapterError) {
        
    }
    
    func didDisplayInterstitialAd() {
        print("XXXXX didDisplayInterstitialAd")
    }
    
    func didDisplayInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        
    }
    
    func didClickInterstitialAd() {
        print("XXXXX didClickInterstitialAd")
    }
    
    func didClickInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        
    }
    
    func didHideInterstitialAd() {
        print("XXXXX didHideInterstitialAd")
    }
    
    func didHideInterstitialAd(withExtraInfo extraInfo: [String : Any]?) {
        
    }
    
    func didFailToDisplayInterstitialAdWithError(_ adapterError: MAAdapterError) {
        print("XXXXX didFailToDisplayInterstitialAdWithError")
    }
}
*/

/*
@objc extension ALMobidrivenCustomAdapter: MANativeAdAdapter {
    func loadNativeAd(for parameters: MAAdapterResponseParameters, andNotify delegate: MANativeAdAdapterDelegate) {
        nativeDelegate = delegate
        guard let pid = Int(parameters.thirdPartyAdPlacementIdentifier) else {
            delegate.didFailToLoadNativeAdWithError(.invalidConfiguration)
            return
        }
        print("loadNativeAd for pid: \(pid)")

        /*
        // Prepare ad settings
        let adSettings = (try? TeadsAdapterSettings.instance(fromAppLovinParameters: parameters.localExtraParameters)) ?? TeadsAdapterSettings()

        // Load native ad
        currentNativePlacement = Teads.createNativePlacement(pid: pid, settings: adSettings.adPlacementSettings, delegate: self)
        currentNativePlacement?.requestAd(requestSettings: adSettings.adRequestSettings)
        self.adSettings = adSettings
        */
    }
}
*/
/*
@objc extension ALMobidrivenCustomAdapter: MAAdViewAdapter {
    func loadAdViewAd(for parameters: MAAdapterResponseParameters, adFormat: MAAdFormat, andNotify delegate: MAAdViewAdapterDelegate) {
        adDelegate = delegate
        self.adFormat = adFormat
        guard let pid = Int(parameters.thirdPartyAdPlacementIdentifier) else {
            delegate.didFailToLoadAdViewAdWithError(.invalidConfiguration)
            return
        }
        print("loadAdViewAd for pid: \(pid)")
        
        self.loadAd()
        /*
        // Prepare ad settings
        let adSettings = (try? TeadsAdapterSettings.instance(fromAppLovinParameters: parameters.localExtraParameters)) ?? TeadsAdapterSettings()

        // Load inRead ad
        currentInReadPlacement = Teads.createInReadPlacement(pid: pid, settings: adSettings.adPlacementSettings, delegate: self)
        currentInReadPlacement?.requestAd(requestSettings: adSettings.adRequestSettings)
        */
    }
}
*/




/*
 extension ALMobidrivenCustomAdapter:MAAdDelegate {
 public func didLoad(_ ad: MAAd) {
 print("MAAdDelegate didLoad")
 retryAttempt = 0
 
 self.showInterstitialAd()
 }
 
 public func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
 print("MAAdDelegate didFailToLoadAd: \(adUnitIdentifier)")
 print(error)
 
 retryAttempt += 1
 let delaySec = pow(2.0, min(6.0, retryAttempt))
 
 DispatchQueue.main.asyncAfter(deadline: .now() + delaySec) {
 self.interstitialAd.load()
 // self.rewardedAd.load()
 }
 }
 
 public func didDisplay(_ ad: MAAd) {
 print("MAAdDelegate didDisplay")
 }
 
 public func didHide(_ ad: MAAd) {
 print("MAAdDelegate didHide")
 // Interstitial ad is hidden. Pre-load the next ad
 // interstitialAd.load()
 
 // Rewarded ad is hidden. Pre-load the next ad
 // rewardedAd.load()
 }
 
 public func didClick(_ ad: MAAd) {
 print("MAAdDelegate didClick")
 }
 
 public func didFail(toDisplay ad: MAAd, withError error: MAError) {
 print("MAAdDelegate didFail:")
 print(error)
 // Interstitial ad failed to display. We recommend loading the next ad
 // interstitialAd.load()
 
 // Rewarded ad is hidden. Pre-load the next ad
 // rewardedAd.load()
 }
 }
 
 extension ALMobidrivenCustomAdapter:MARewardedAdDelegate {
 public func didRewardUser(for ad: MAAd, with reward: MAReward) {
 print("MARewardedAdDelegate didRewardUser")
 print("Rewarded user: \(reward.amount) \(reward.label)")
 }
 
 public func didStartRewardedVideo(for ad: MAAd) {
 print("MARewardedAdDelegate didStartRewardedVideo")
 }
 
 public func didCompleteRewardedVideo(for ad: MAAd) {
 print("MARewardedAdDelegate didCompleteRewardedVideo")
 }
 
 
 }
 */
