//
//  RSStore.swift
//  YADL Reference App
//
//  Created by Christina Tsangouri on 11/6/17.
//  Copyright © 2017 Christina Tsangouri. All rights reserved.
//

import UIKit
import OhmageOMHSDK
import ResearchSuiteAppFramework
import ResearchSuiteTaskBuilder

class RSStore: NSObject, OhmageOMHSDKCredentialStore, RSTBStateHelper {
    
    func valueInState(forKey: String) -> NSSecureCoding? {
        return self.get(key: forKey)
    }
    
    func setValueInState(value: NSSecureCoding?, forKey: String) {
        self.set(value: value, key: forKey)
    }
    
    func set(value: NSSecureCoding?, key: String) {
        RSAFKeychainStateManager.setValueInState(value: value, forKey: key)
    }
    func get(key: String) -> NSSecureCoding? {
        return RSAFKeychainStateManager.valueInState(forKey: key)
    }

    
    func reset() {
        RSAFKeychainStateManager.clearKeychain()
    }
    
}
